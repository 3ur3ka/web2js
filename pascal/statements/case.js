'use strict';

module.exports = class Case {
  constructor(label, statement) {
    this.label = label;
    this.statement = statement;
  }

  gotos() {
    return this.statement.gotos();
  }
  
  generate(block) {
    var code = "";

    for (var i in this.label) {
      if (this.label[i] === true) {
        code = code + `default:\n`;
      } else {
        code = code + `case ${this.label[i]}:\n`;
      }
    }

    code = code + this.statement.generate(block);
    code = code + "\nbreak;";
    
    return code;
  }
};
