var fs = require('fs');
var process = require('process');
var callstack = [];
var stackstack = [];
var files = [];
var exec = require('child_process').execSync;

var memory = undefined;
var inputBuffer = undefined;
var callback = undefined;
var texPool = "tex.pool";

let wasmExports;
let view;

let window = {};
const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
  prompt: ''
});

let DATA_ADDR = 2400 * 1024*64;
let END_ADDR = 2500 * 1024*64;
let windingDepth = 0;
let sleeping = false;

function startUnwind() {
  if (view) {
    view[DATA_ADDR >> 2] = DATA_ADDR + 8;
    view[DATA_ADDR + 4 >> 2] = END_ADDR;
  }
  
  wasmExports.asyncify_start_unwind(DATA_ADDR);
  windingDepth = windingDepth + 1;
}

function startRewind() {
  wasmExports.asyncify_start_rewind(DATA_ADDR);
  wasmExports.main();
  //if (windingDepth == 0) {
  //callback();
  //}
}

function stopRewind() {
  windingDepth = windingDepth - 1;
  wasmExports.asyncify_stop_rewind();
}

module.exports = {
  setMemory: function(m) {
    memory = m;
    view = new Int32Array(m);
  },

  setWasmExports: function(m) {
    wasmExports = m;
  },

  setTexPool: function(m) {
    texPool = m;
  },  

  setInput: function(input, cb) {
    inputBuffer = input;
    if (cb) callback = cb;
  },

  getCurrentMinutes: function() {
    var d = (new Date());
    return 60 * (d.getHours()) + d.getMinutes();
  },
  
  getCurrentDay: function () {
    return (new Date()).getDate();
  },
  
  getCurrentMonth: function() {
    return (new Date()).getMonth() + 1;
  },
  
  getCurrentYear: function() {
    return (new Date()).getFullYear();    
  },

  printString: function(descriptor, x) {
    var file = (descriptor < 0) ? {stdout:true} : files[descriptor];
    var length = new Uint8Array( memory, x, 1 )[0];
    var buffer = new Uint8Array( memory, x+1, length );
    var string = String.fromCharCode.apply(null, buffer);

    if (file.stdout) {
      process.stdout.write(string);
      return;
    }

    //console.log('>>>>> printSTring ' + file.filename + string);
    fs.writeSync( file.descriptor, string );    
  },
  
  printBoolean: function(descriptor, x) {
    var file = (descriptor < 0) ? {stdout:true} : files[descriptor];    

    var result = x ? "TRUE" : "FALSE";

    if (file.stdout) {
      process.stdout.write(result);
      return;
    }

    fs.writeSync( file.descriptor, result );    
  },
  printChar: function(descriptor, x) {
    var file = (descriptor < 0) ? {stdout:true} : files[descriptor];        
    if (file.stdout) {
      process.stdout.write(String.fromCharCode(x));
      return;
    }

    var b = Buffer.alloc(1);
    b[0] = x;

    //console.log('>>>>> printChar ' + file.filename + x.toString());
    fs.writeSync( file.descriptor, b );
  },
  printInteger: function(descriptor, x) {
    var file = (descriptor < 0) ? {stdout:true} : files[descriptor];            
    if (file.stdout) {
      process.stdout.write(x.toString());
      return;
    }

    fs.writeSync( file.descriptor, x.toString());
  },
  printFloat: function(descriptor, x) {
    var file = (descriptor < 0) ? {stdout:true} : files[descriptor];                
    if (file.stdout) {
      process.stdout.write(x.toString());
      return;
    }

    fs.writeSync( file.descriptor, x.toString());    
  },
  printNewline: function(descriptor, x) {
    var file = (descriptor < 0) ? {stdout:true} : files[descriptor];                    
    if (file.stdout) {
      process.stdout.write("\n");
      return;
    }

    fs.writeSync( file.descriptor, "\n");    
  },

  reset: function(length, pointer) {    
    var buffer = new Uint8Array( memory, pointer, length );
    var filename = String.fromCharCode.apply(null, buffer);

    if (filename.startsWith('{')) {
      filename = filename.replace(/^{/g,'');
      filename = filename.replace(/}.*/g,''); 
    }
    
    filename = filename.replace(/ +$/g,'');
    filename = filename.replace(/^\*/,'');    
    filename = filename.replace(/^TeXfonts:/,'');    

    if (filename == 'TeXformats:TEX.POOL')
      filename = texPool;

    if (filename == "TTY:") {
      files.push({ filename: "stdin",
                   stdin: true,
                   position: 0,
                   position2: 0,                   
                   erstat: 0,
                   eoln: false,
                   content: Buffer.from(inputBuffer)
                 });
      return files.length - 1;
    }

    try {
      var path = exec('kpsewhich ' + filename).toString().split("\n")[0];
    } catch (e) {
      files.push({
        filename: filename,
        erstat: 1
      });
      return files.length - 1;
    }

    files.push({
      filename: filename,
      position: 0,
      position2: 0,                         
      erstat: 0,
      eoln: false,      
      descriptor: fs.openSync(path,'r'),
      content: fs.readFileSync(path)
    });
    
    return files.length - 1;
  },

  rewrite: function (length, pointer) {
    
    var buffer = new Uint8Array( memory, pointer, length );
    var filename = String.fromCharCode.apply(null, buffer);
    
    //console.log('rewrite ' + filename);

    filename = filename.replace(/ +$/g,'');    
    
    if (filename == "TTY:") {
      files.push({ filename: "stdout",
                   stdout: true,
                   erstat: 0,                   
                 });
      return files.length - 1;
    }

    files.push({
      filename: filename,
      position: 0,
      erstat: 0,      
      descriptor: fs.openSync(filename,'w')
    });
    
    return files.length - 1;
  },

  getfilesize: function(length, pointer) {
    var buffer = new Uint8Array( memory, pointer, length );
    var filename = String.fromCharCode.apply(null, buffer);

    if (filename.startsWith('{')) {
      filename = filename.replace(/^{/g,'');
      filename = filename.replace(/}.*/g,''); 
    }
    
    filename = filename.replace(/ +$/g,'');
    filename = filename.replace(/^\*/,'');    
    filename = filename.replace(/^TeXfonts:/,'');    

    if (filename == 'TeXformats:TEX.POOL')
      filename = "tex.pool";

    try {
      filename = exec('kpsewhich ' + filename).toString().split("\n")[0];
    } catch (e) {
      try {
        var stats = fs.statSync(filename);

        return stats.size;
      } catch (e) {
        return 0;
      }
    }
    
    return 0;
  },  

  close: function(descriptor) {
    var file = files[descriptor];

    if (file.descriptor)
      fs.closeSync( file.descriptor );

    files[descriptor] = {};
  },

  eof: function(descriptor) {
    var file = files[descriptor];
    
    if (file.eof)
      return 1;
    else
      return 0;
  },

  erstat: function(descriptor) {
    var file = files[descriptor];
    return file.erstat;
  },

  
  eoln: function(descriptor) {
    var file = files[descriptor];

    if (file.eoln)
      return 1;
    else
      return 0;
  },

  evaljs: function(str_number, str_poolp, str_startp, pool_ptrp, pool_size, max_strings,
                   eqtbp,active_base,eqtb_size,count_base) {
    var str_start = new Uint32Array( memory, str_startp, max_strings+1);
    var pool_ptr = new Uint32Array( memory, pool_ptrp, 1);
    var str_pool = new Uint8Array( memory, str_poolp, pool_size+1);
    var length = str_start[str_number+1] - str_start[str_number];
    var input = new Uint8Array( memory, str_poolp + str_start[str_number], length );
    var string = new TextDecoder("ascii").decode(input);

    var count = new Uint32Array( memory, eqtbp + 8*(count_base - active_base), 512 );
    
    const handler = {
      get: function(target, prop, receiver) {
        return target[2*prop];
      },
      set: function(target, prop, value) {
        target[2*prop] = value;
      }
    };    
    
    var tex = {
      print: function(s) {
        const encoder = new TextEncoder('ascii');
        const view = encoder.encode(s);
        const b = Buffer.from(view);
        str_pool.set( b, pool_ptr[0] );
        pool_ptr[0] += view.length;
      },
      count: new Proxy(count, handler)
    };

    var f = Function(['tex','window'],string);
    f(tex, window);
  },
  
  inputln: function(descriptor, bypass_eoln, bufferp, firstp, lastp, max_buf_stackp, buf_size) {
    var file = files[descriptor];
    var last_nonblank = 0; // |last| with trailing blanks removed

    var buffer = new Uint8Array( memory, bufferp, buf_size);
    var first = new Uint32Array( memory, firstp, 1 );
    var last = new Uint32Array( memory, lastp, 1 );
    // FIXME: this should not be ignored
    var max_buf_stack = new Uint32Array( memory, max_buf_stackp, 1 );

    // cf.\ Matthew 19\thinspace:\thinspace30
    last[0] = first[0];

    // input the first character of the line into |f^|
    if (bypass_eoln) {
      if (!file.eof) {
        if (file.eoln) {
          file.position2 = file.position2 + 1;
        }
      }
    }
    
    let endOfLine = file.content.indexOf(10, file.position2);
    if (endOfLine < 0) endOfLine = file.content.length;
      
    if (file.position2 >= file.content.length) {
      if (file.stdin) {
        if (callback) callback();
      }
      
      file.eof = true;
      return false;
    } else {
      var bytesCopied = file.content.copy( buffer, first[0], file.position2, endOfLine );
      
      last[0] = first[0] + bytesCopied;
      
      while( buffer[last[0] - 1] == 32 )
        last[0] = last[0] - 1;
      
      file.position2 = endOfLine;
      file.eoln = true;
    }
    
    return true;
  },
  
  get: function(descriptor, pointer, length) {
    var file = files[descriptor];

    var buffer = new Uint8Array( memory );
    
    if (file.stdin) {
      if (file.position >= inputBuffer.length) {
	buffer[pointer] = 13;
        if (callback) callback();
      } else {
	buffer[pointer] = inputBuffer[file.position].charCodeAt(0);
      }
    } else {
      if (file.descriptor) {
        if (fs.readSync( file.descriptor, buffer, pointer, length, file.position ) == 0) {
          buffer[pointer] = 0;
          file.eof = true;
          file.eoln = true;
          return;
        }
      } else {
        file.eof = true;
        file.eoln = true;        
        return;
      }
    }
    
    file.eoln = false;
    if (buffer[pointer] == 10)
      file.eoln = true;
    if (buffer[pointer] == 13)
      file.eoln = true;

    file.position = file.position + length;
  },
  
  put: function(descriptor, pointer, length) {
    var file = files[descriptor];
    
    var buffer = new Uint8Array( memory );

    //console.log('>>>>>> put ' + file.filename);

    fs.writeSync( file.descriptor, buffer, pointer, length );
  },

  snapshot: function() {
    console.log('(-snapshot-)');
    fs.writeFileSync( 'files.json', JSON.stringify(files) );
    return 1;
  },  
};
