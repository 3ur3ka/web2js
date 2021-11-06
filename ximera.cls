%%
%% This is file `ximera.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% ximera.dtx  (with options: `classXimera')
%% src/banner.dtx  (with options: `classXimera')
%% src/options.dtx  (with options: `classXimera')
%% src/packages.dtx  (with options: `classXimera')
%% src/hyperref.dtx  (with options: `classXimera')
%% src/graphics.dtx  (with options: `classXimera')
%% src/paragraphs.dtx  (with options: `classXimera')
%% src/suppress.dtx  (with options: `classXimera')
%% src/makeCounter.dtx  (with options: `classXimera')
%% src/pagesetup.dtx  (with options: `classXimera')
%% src/metadata.dtx  (with options: `classXimera')
%% src/outcomes.dtx  (with options: `classXimera')
%% src/macros.dtx  (with options: `classXimera')
%% src/theorems.dtx  (with options: `classXimera')
%% src/enumerate.dtx  (with options: `classXimera')
%% src/proof.dtx  (with options: `classXimera')
%% src/only.dtx  (with options: `classXimera')
%% src/problem.dtx  (with options: `classXimera')
%% src/hints.dtx  (with options: `classXimera')
%% src/abstract.dtx  (with options: `classXimera')
%% src/title.dtx  (with options: `classXimera')
%% src/image.dtx  (with options: `classXimera')
%% src/interactives/javascript.dtx  (with options: `classXimera')
%% src/interactives/include.dtx  (with options: `classXimera')
%% src/interactives/geogebra.dtx  (with options: `classXimera')
%% src/interactives/desmos.dtx  (with options: `classXimera')
%% src/interactives/google.dtx  (with options: `classXimera')
%% src/interactives/graph.dtx  (with options: `classXimera')
%% src/link.dtx  (with options: `classXimera')
%% src/interactives/video.dtx  (with options: `classXimera')
%% src/answer.dtx  (with options: `classXimera')
%% src/choice.dtx  (with options: `classXimera')
%% src/solution.dtx  (with options: `classXimera')
%% src/feedback.dtx  (with options: `classXimera')
%% src/freeresponse.dtx  (with options: `classXimera')
%% src/verbatim.dtx  (with options: `classXimera')
%% src/footnote.dtx  (with options: `classXimera')
%% src/dialogue.dtx  (with options: `classXimera')
%% src/instructornotes.dtx  (with options: `classXimera')
%% src/xkcd.dtx  (with options: `classXimera')
%% src/foldable.dtx  (with options: `classXimera')
%% src/leash.dtx  (with options: `classXimera')
%% src/interactives/sagemath.dtx  (with options: `classXimera')
%% src/jax.dtx  (with options: `classXimera')
%% src/ungraded.dtx  (with options: `classXimera')
%% src/sectioning.dtx  (with options: `classXimera')
%% src/a11y.dtx  (with options: `classXimera')
%% ------------:| ------------------------------------------------------------
%%       ximera:| Simultaneously writing print and online interactive materials
%%       Author:| Jim Fowler and Oscar Levin and Jason Nowell and Hans Parshall and Bart Snapp
%%       E-mail:| bart.snapp@gmail.com
%%      License:| Released under the LaTeX Project Public License v1.3c or later
%%          See:| http://www.latex-project.org/lppl.txt
%% 
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{ximera}
 [2021/03/15 v2.00
 Simultaneously target PDF and the web]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\let\m\message
\def\w{\m{::}}\def\t{\m{:::}}\def\s{\m{ }}\def\n{\m{^^J}}\def\u{::'}\def\d{'::}\def\v{:::::}
\n
\m{\d.}\s\m{.\u}\w\m{}\m{\v}\s\s\m{\v}\m{}\m{.\v\v\v::::.}\s\m{}\t\n
\s\m{\d.\u}\s\w\t\t\s\t\t\w\m{}\s\s\s\s\s\s\s\t\s\m{\u::}\n
\s\s\t\s\s\w\t\m{}\t\t\m{}\t\m{ ::::\v}\m{.\v:\u}\m{}\m{\u}\m{\d}\n
\s\m{.\u::.}\s\w\t\m{}\t\t\m{}\t\w\s\s\s\s\w\m{}\m{\d.}\s\m{\u}\s\m{\d}\n
\m{.\u}\s\m{\d.}\w\t\s\m{':\u}\s\t\m{\d\v::}\w\s\m{}\m{\d.\u}\s\s\m{\d}\n
\n
\let\w\undefined
\let\t\undefined
\let\s\undefined
\let\n\undefined
\let\u\undefined
\let\d\undefined
\let\v\undefined
\let\m\undefined
\newif\ifhandout
\handoutfalse
\DeclareOption{handout}{\handouttrue}
\newif\ifauthor%                                        Flag for whether or not any author is given
    \authorfalse%                                       Defaults to false.
\newif\ifsuppressAuthorDisplay%                         A flag for deliberately suppressing author even if it is given.
    \suppressAuthorDisplayfalse%                        Default to not suppressing the display of the author.
\DeclareOption{noauthor}{\suppressAuthorDisplaytrue}
\newif\ifoutcomes%                                      Flag for whether or not outcomes are given.
    \outcomesfalse%                                     Default to false.
\newif\ifsuppressOutcomesDisplay%                       Flag for if outcome displays should be suppressed, even if given.
    \suppressOutcomesDisplayfalse%                      Default to not supressing the display of outcomes
\DeclareOption{nooutcomes}{\suppressOutcomesDisplaytrue}
\newif\ifinstructornotes
\instructornotesfalse
\DeclareOption{instructornotes}{\instructornotestrue}
\DeclareOption{noinstructornotes}{\instructornotestrue}
\newif\ifhints
\hintsfalse
\DeclareOption{hints}{\hintstrue}
\newif\ifnewpage
\newpagefalse
\DeclareOption{newpage}{\newpagetrue}
\newif\ifnumbers
\numbersfalse
\DeclareOption{numbers}{\numberstrue}
\newif\ifwordchoicegiven
\wordchoicegivenfalse
\DeclareOption{wordchoicegiven}{\wordchoicegiventrue}
\newif\iffirstinlinechoice% Support for other wordchoice command contents.
\firstinlinechoicetrue
\newif\ifxoc
\xocfalse
\DeclareOption{xoc}{\xoctrue}
\newif\ifweb
\webfalse
\DeclareOption{web}{\webtrue}
\newif\ifxake
\xakefalse
\ifweb\xaketrue\fi
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}

\ifweb
  \handoutfalse%
  \numbersfalse%
  \newpagefalse%
  \hintsfalse%
  \outcomestrue%
\fi


\RequirePackage[makeroom]{cancel}
\RequirePackage{everyhook}
\RequirePackage{enumitem}
\RequirePackage[pagestyles]{titlesec}
\RequirePackage{titletoc}
\RequirePackage{titling}
\RequirePackage{xcolor}
\RequirePackage{url}
\RequirePackage{fancyvrb}
\RequirePackage{tikz}
\RequirePackage{pgfplots}
\usepgfplotslibrary{groupplots}
\usetikzlibrary{calc}
\RequirePackage{forloop}
\RequirePackage{environ}% Included to allow saving of environment contents. This does *not* play well with various verbatem environments however and would be great to find a way around utilizing this package. One option is the "Suppress" command included below.
\RequirePackage{amssymb}% Included to have access to math typeset.
\RequirePackage{amsmath}% Included to have access to math typeset.
\RequirePackage{amsthm}%  Included to have access to math typeset.
\RequirePackage{xifthen}% http://ctan.org/pkg/xifthen
\RequirePackage{multido}% http://ctan.org/pkg/multido
\RequirePackage{listings} %% is this required???z

\RequirePackage{xkeyval}

\RequirePackage{comment}
\RequirePackage{gettitlestring}
\RequirePackage{nameref}
\ifweb
  \usepackage[OT1]{fontenc}
\fi
\ifweb
\RequirePackage{hyperref}
\else
\RequirePackage[pdfpagelabels,colorlinks=true,allcolors=blue!30!black]{hyperref}
\pdfstringdefDisableCommands{\def\hskip{}}%% quiets warning
\fi
\RequirePackage{graphicx}
\ifweb
\DeclareGraphicsExtensions{.eps,.bmp}
\DeclareGraphicsRule{.png}{bmp}{}{}
\fi
\ifweb
\PushPreHook{par}{\special{html <p>}}
\fi
\font\dummyft@=dummy \relax
\def\suppress{%
  \begingroup\par
  \parskip\z@
  \offinterlineskip
  \baselineskip=\z@skip
  \lineskip=\z@skip
  \lineskiplimit=\maxdimen
  \dummyft@
  \count@\sixt@@n
  \loop\ifnum\count@ >\z@
    \advance\count@\m@ne
    \textfont\count@\dummyft@
    \scriptfont\count@\dummyft@
    \scriptscriptfont\count@\dummyft@
  \repeat
  \let\selectfont\relax
  \let\mathversion\@gobble
  \let\getanddefine@fonts\@gobbletwo
  \tracinglostchars\z@
  \frenchspacing
  \hbadness\@M}
\def\endsuppress{\par\endgroup}
\newcommand{\Make@Counter}[1]{% This is an internal macro that should probably be depreciated for the below universal macro.
  \@ifundefined{c@#1}% Check to see if counter exists
       {     % If not, create it and set it to 0.
\newcounter{#1}
\setcounter{#1}{0}
}
{%If so, reset to 0.
\setcounter{#1}{0}
}
}

\newcommand{\MakeCounter}[1]{%% Code located in "Utilitymacros.dtx"
  \@ifundefined{c@#1}% Check to see if counter exists
       {     % If not, create it and set it to 0.
\newcounter{#1}
\setcounter{#1}{0}
}
{%If so, reset to 0.
\setcounter{#1}{0}
}
}

\setlength{\parindent}{0pt}
\setlength{\parskip}{5pt}
\oddsidemargin 62pt
\evensidemargin 62pt
\textwidth 345pt
\headheight 14pt
\ifweb\paperheight 100in\PassOptionsToPackage{margin=1in}{geometry}\fi
\RequirePackage{geometry}

%%\ifdefined\snapshot\AtBeginDocument{%
%%  \snapshot%
%%  \hsize=\directjs{tex.print(tex.hsize)}pt%
%%  \setlength{\textwidth}{\directjs{tex.print(tex.hsize)}pt}%}
%%  \setlength{\linewidth}{\directjs{tex.print(tex.hsize)}pt}%}
%%}\fi

\newcommand{\license}{\excludecomment}

\newcommand{\acknowledgement}{\excludecomment}

\renewcommand{\tag}{\excludecomment}
\def\theoutcomes{}
\newcommand{\outcome}[1]{}

\everymath{\displaystyle}
\let\prelim\lim
\renewcommand{\lim}{\displaystyle\prelim}
\ifweb%

\newlength{\ximeraindent}
\setlength{\ximeraindent}{12pt}

\newenvironment{indentation}[2]%
{%
  \par
  \setlength{\leftmargin}{#1}%
  \setlength{\rightmargin}{#2}%
  \advance\linewidth -\leftmargin
  \advance\linewidth -\rightmargin
  \advance\@totalleftmargin\leftmargin
  \@setpar{{\@@par}}%
  \parshape 1 \@totalleftmargin \linewidth
  \ignorespaces
}%
{\par}

\newcommand{\ximerizedEnvironment}[1]{%
  \BeforeBeginEnvironment{#1}{%
    \special{ximera:save}%
    \clearpage%
    \special{ximera:begin #1}%
    \begin{indentation}{\ximeraindent}{0in}
  }%

  \AfterEndEnvironment{#1}{%
    \special{ximera:save}%
    \clearpage%
    \special{ximera:end #1}%
    \end{indentation}
  }%
}%
\else%
\newcommand{\ximerizedEnvironment}[1]{}%
\fi%


      \newtheorem{theorem}{Theorem}
      \ximerizedEnvironment{theorem}

      \newtheorem{algorithm}{Algorithm}
      \ximerizedEnvironment{algorithm}

      \newtheorem{axiom}{Axiom}
      \ximerizedEnvironment{axiom}

      \newtheorem{claim}{Claim}
      \ximerizedEnvironment{claim}

      \newtheorem{conclusion}{Conclusion}
      \ximerizedEnvironment{conclusion}

      \newtheorem{condition}{Condition}
      \ximerizedEnvironment{condition}

      \newtheorem{conjecture}{Conjecture}
      \ximerizedEnvironment{conjecture}

      \newtheorem{corollary}{Corollary}
      \ximerizedEnvironment{corollary}

      \newtheorem{criterion}{Criterion}
      \ximerizedEnvironment{criterion}

      \newtheorem{definition}{Definition}
      \ximerizedEnvironment{definition}

      \newtheorem{example}{Example}
      \ximerizedEnvironment{example}

      \newtheorem*{explanation}{Explanation}
      \ximerizedEnvironment{explanation}

      \newtheorem{fact}{Fact}
      \ximerizedEnvironment{fact}

      \newtheorem{lemma}{Lemma}
      \ximerizedEnvironment{lemma}

      \newtheorem{formula}{Formula}
      \ximerizedEnvironment{formula}

      \newtheorem{idea}{Idea}
      \ximerizedEnvironment{idea}

      \newtheorem{notation}{Notation}
      \ximerizedEnvironment{notation}

      \newtheorem{model}{Model}
      \ximerizedEnvironment{model}

      \newtheorem{observation}{Observation}
      \ximerizedEnvironment{observation}

      \newtheorem{proposition}{Proposition}
      \ximerizedEnvironment{proposition}

      \newtheorem{paradox}{Paradox}
      \ximerizedEnvironment{paradox}

      \newtheorem{procedure}{Procedure}
      \ximerizedEnvironment{procedure}

      \newtheorem{remark}{Remark}
      \ximerizedEnvironment{remark}

      \newtheorem{summary}{Summary}
      \ximerizedEnvironment{summary}

      \newtheorem{template}{Template}
      \ximerizedEnvironment{template}

      \newtheorem{warning}{Warning}
      \ximerizedEnvironment{warning}

\renewcommand{\theenumi}{\textup{(\alph{enumi})}}
\renewcommand{\labelenumi}{\theenumi}
\renewcommand{\theenumii}{\textup{(\roman{enumii})}}
\renewcommand{\labelenumii}{\theenumii}
\renewcommand{\qedsymbol}{$\blacksquare$}
\renewenvironment{proof}[1][\proofname]
  {\begin{trivlist}\item[\hskip \labelsep \itshape \bfseries #1{}\hspace{2ex}]}
{\qed\end{trivlist}}

\ifhandout
\NewEnviron{prompt}{}
\else
\newenvironment{prompt}
     {\bgroup\color{gray!50!black}}
        {\egroup}
\fi

\ifhandout
\NewEnviron{onlineOnly}{
\ifweb
\BODY
\else
\fi
}
\else
\newenvironment{onlineOnly}
     {\bgroup\color{red!50!black}}
{\egroup}
\fi

\newcommand{\pdfOnly}[1]{\ifweb\else #1\fi}


\providecommand{\latexProblemContent}[1]{#1}
\Make@Counter{Iteration@probCnt}
\ifweb
\newcommand{\hang}{}% no decoration on the web
\newcommand{\hung}{}
\else
\newcommand{\hang}{% top theorem decoration
  \begingroup%
  \setlength{\unitlength}{.005\linewidth}% \linewidth/200
    \begin{picture}(0,0)(1.5,0)%
      \linethickness{1pt} \color{black!50}%
      \put(-3,2){\line(1,0){206}}% Top line
      \multido{\iA=2+-1,\iB=50+-10}{5}{% Top hangs
        \color{black!\iB}%
        \put(-3,\iA){\line(0,-1){1}}% Top left hang
        %\put(203,\iA){\line(0,-1){1}}% Top right hang
      }%
    \end{picture}%
  \endgroup%
}%
\newcommand{\hung}{% bottom theorem decoration
  \nobreak
  \begingroup%
    \setlength{\unitlength}{.005\linewidth}% \linewidth/200
    \begin{picture}(0,0)(1.5,0)%
      \linethickness{1pt} \color{black!50}%
      \put(60,0){\line(1,0){143}}% Bottom line
      \multido{\iA=0+1,\iB=50+-10}{5}{% Bottom hangs
        \color{black!\iB}%
        %\put(-3,\iA){\line(0,1){1}}% Bottom left hang
        \put(203,\iA){\line(0,1){1}}% Bottom right hang
        \put(\iB,0){\line(60,0){10}}% Left fade out
      }%
    \end{picture}%
  \endgroup%
}%
\fi
\MakeCounter{problem}
\newcommand{\problemNumber}{
\ifcsname c@depth\Roman{problem@Depth}Count\endcsname% Check to see if counter exists
\else
\expandafter\newcounter{depth\Roman{problem@Depth}Count}
\expandafter\setcounter{depth\Roman{problem@Depth}Count}{0}
\fi

\expandafter\stepcounter{depth\Roman{problem@Depth}Count}
\arabic{depthICount}% The first problem depth, what use to be |\theproblem|.

\forloop{Iteration@probCnt}{2}{\arabic{Iteration@probCnt} < \numexpr \value{problem@Depth} + 1 \relax}{%
    .\expandafter\arabic{depth\Roman{Iteration@probCnt}Count}% Get the problem number of the next depth level and append it with a ".".
}
}

%%%%%% Configure various problem environment commands
\Make@Counter{problem@Depth}

%%%% Configure environments start content

\newcommand{\problemEnvironmentStart}[2]{%

\stepcounter{problem@Depth}% Started a problem, so we've sunk another problem layer.
\def\spaceatend{#1}%
\begin{trivlist}%
\item%
  [%
    \hskip\labelsep\sffamily\bfseries
    #2 \problemNumber% Determine the correct number of the problem, and the format of that number.
]%
\slshape
}

%%%%% Configure environments end content

\newcommand{\problemEnvironmentEnd}{%This configures all the end content for a problem.
\stepcounter{problem@Depth}
\ifcsname c@depth\Roman{problem@Depth}Count\endcsname
\expandafter\ifnum\expandafter\value{depth\Roman{problem@Depth}Count}>0
\expandafter\setcounter{depth\Roman{problem@Depth}Count}{0}
\fi
\fi

\addtocounter{problem@Depth}{-2}% Exited a problem so we've exited a problem layer. Need -2 because we steppped once at the start to check for needing a depth-level count reset.

\par\addvspace{.5ex}\nobreak\noindent\hung %% line at the bottom

\ifhandout
\ifnewpage
\newpage
\fi
\fi
\end{trivlist}
}

%%%% Now populate the old environment names

\newenvironment{problem}[1][2in]%
{%Env start code
\problemEnvironmentStart{#1}{Problem}
}
{%Env end code
\problemEnvironmentEnd
}

\ximerizedEnvironment{problem}

\newenvironment{exercise}[1][2in]%
{%Env start code
\problemEnvironmentStart{#1}{Exercise}
}
{%Env end code
\problemEnvironmentEnd
}

\ximerizedEnvironment{exercise}

\newenvironment{exploration}[1][2in]%
{%Env start code
\problemEnvironmentStart{#1}{Exploration}
}
{%Env end code
\problemEnvironmentEnd
}

\ximerizedEnvironment{exploration}

\newenvironment{question}[1][2in]%
{%Env start code
\problemEnvironmentStart{#1}{Question}
}
{%Env end code
\problemEnvironmentEnd
}

\ximerizedEnvironment{question}

\newcounter{hintLevel}
\setcounter{hintLevel}{0}
\newenvironment{hint}{}{}
\renewenvironment{hint}
{
\ifhandout
\setbox0\vbox\bgroup
\else
\begin{trivlist}\item[\hskip \labelsep\small\slshape\bfseries Hint:\hspace{2ex}]
\small\slshape
\fi
\stepcounter{hintLevel}
}
{
\ifhandout
\egroup\ignorespacesafterend
\else
\end{trivlist}
\fi
\addtocounter{hintLevel}{-1}
}

\ifhints
\renewenvironment{hint}{
\begin{trivlist}\item[\hskip \labelsep\small\slshape\bfseries Hint:\hspace{2ex}]
\small\slshape}
{\end{trivlist}}
\fi

\let\abstract\relax
\let\endabstract\relax
\NewEnviron{abstract}{\protected@xdef\theabstract{\BODY}}

\let\@emptyauthor\@author
\def\author#1{
    \gdef\@author{#1}% Defines activity author
    }
\def\@author{\@latex@warning@no@line{No \noexpand\author given}}
\def\and{and }

\let\title\relax% clear the title
\newcommand{\title}[1][]{{\protected@xdef\@pretitle{#1}}\protected@xdef\@title} % define the new title
\title{}% give the blank title a value
\newif\iffirsttitle % For cards. The first title is surely a xourse title
\firsttitletrue % or exercise list title, which should be ignored when making cards
\newcounter{titlenumber}
\renewcommand{\thetitlenumber}{\arabic{titlenumber}}
\setcounter{titlenumber}{0}

\ifweb % webpages don't need headers and footers
  \newpagestyle{main}{
    \sethead[][][] % even
    {}{}{} % odd
    \setfoot[][][] % even
    {}{}{} % odd
  }
\else
  \newpagestyle{main}{
    \sethead[\textsl{\ifnumbers\thetitlenumber\hspace{1em}\fi\@title}][][] % even
    {}{}{\textsl{\ifnumbers\thetitlenumber\hspace{1em}\fi\@title}} % odd
    \setfoot[\thepage][][] % even
    {}{}{\thepage} % odd
  }
\fi
\pagestyle{main}
\renewcommand\maketitle{%
  \addtocounter{titlenumber}{1}%
  \ifweb\special{title \@title}\fi%
  \ifweb\special{html <h1>}\fi%
  {\flushleft\large\bfseries \@pretitle\par\vspace{-1em}}
  {\flushleft\LARGE\bfseries {\ifnumbers\thetitlenumber\fi}{\ifnumbers\hspace{1em}\else\hspace{0em}\fi}\@title \par }
  \phantomsection%
  \ifnumbers\addcontentsline{toc}{section}{\thetitlenumber~\@title}\else\addcontentsline{toc}{section}{\@title}\fi
  \ifweb\special{html </h1>}\fi%
  \vskip .6em\noindent\textit\theabstract\setcounter{problem}{0}\setcounter{section}{0}\setcounter{subsection}{0}\par\vspace{2em}
  %%% Design Question:
  % Would it make more sense to have author/outcomes in the header and reserve footer for footnotes?
  % Or some other method to distinguish between the two now that footnotes are viable?
  \ifoutcomes%                                          If we have learning outcomes, we should display them.
      \bgroup
          \let\thefootnote\relax%                       Kills off the symbol of the footnote
          \footnote{Learning outcomes: \theoutcomes}
          \setcounter{footnote}{0}%                     Reset the footnote to zero to fix numberings.
      \egroup
      \fi
  \ifauthor%                                            If we have an author, we should display it.
      \bgroup
          \let\thefootnote\relax%                       Kills off the symbol of the footnote
          \footnote{Author(s):~\@author}
          \setcounter{footnote}{0}%                     Reset the footnote to zero to fix numberings.
      \egroup
      \fi
  \aftergroup\@afterindentfalse
  \aftergroup\@afterheading}

\ifnumbers
\setcounter{secnumdepth}{2}
\renewcommand{\thesection}{\arabic{titlenumber}.\arabic{section}~}
\else
\setcounter{secnumdepth}{-2}
\fi

\def\activitystyle{}
\newcounter{sectiontitlenumber}
\setcounter{secnumdepth}{0}
\newcommand\@chapterstyleTitle{%
  \def\activitystyle{activity-chapter}
  \renewcommand{\maketitle}{%
    \addtocounter{titlenumber}{1}%
                    {\flushleft\small\sffamily\bfseries\@pretitle\par\vspace{-1.5em}}%
                    {\flushleft\LARGE\sffamily\bfseries\thetitlenumber\hspace{1em}\@title \par }%
                    {\vskip .6em\noindent\textit\theabstract\setcounter{problem}{0}\setcounter{sectiontitlenumber}{0}}%
                    \par\vspace{2em}
                    \phantomsection\addcontentsline{toc}{section}{\textbf{\thetitlenumber\hspace{1em}\@title}}%
                  }}

\newcommand\@sectionstyleTitle{%
  \def\activitystyle{activity-section} %BADBAD BART: What is this for?
  \renewcommand{\maketitle}{%
    \addtocounter{sectiontitlenumber}{1}
    {\flushleft\small\sffamily\bfseries\@pretitle\par\vspace{-1.5em}}%
    {\flushleft\Large\sffamily\bfseries\thetitlenumber.\thesectiontitlenumber\hspace{1em}\@title \par}%
    {\vskip .6em\noindent\textit\theabstract}%
    \par\vspace{2em}
    \phantomsection\addcontentsline{toc}{subsection}{\thetitlenumber.\thesectiontitlenumber\hspace{1em}\@title}%
  }}
\newenvironment{image}[1][]{\begin{center}}{\end{center}}
\newcommand{\alt}[1]{}


\DefineVerbatimEnvironment{javascript}{Verbatim}{numbers=left,frame=lines,label=JavaScript,labelposition=topline}


\def\js#1{\mbox{\texttt{\detokenize{#1}}}}


\define@key{interactive}{id}{\def\interactive@id{#1}}
\setkeys{interactive}{id=}
\newcommand{\includeinteractive}[2][]{
\setkeys*{interactive}{#1}%
\ifthenelse{\equal{\interactive@id}{}}{}{\recordvariable{\interactive@id}}
Interactive
}

\newcommand{\geogebra}[3]{Geogebra link: \url{https://tube.geogebra.org/m/#1}}
\newcommand{\desmos}[3]{Desmos link: \url{https://www.desmos.com/calculator/#1}}
\newcommand{\googleSheet}[5]{%
  Google Spreadsheet link: \url{https://docs.google.com/spreadsheets/d/#1}%
}


\ifweb
\newcommand{\graph}[2][]{\special{ximera:rule graph #2}% FIXME: handle keyvalue arguments
  \rule[-0.75em]{0.8\textwidth}{0.8\textwidth}}
\else
\newcommand{\graph}[2][]{\text{Graph of $#2$}}
\fi

\newcommand*{\link}[2][]{#1%
\ifthenelse{\equal{#1}{}}%
{\footnote{Link: \url{#2}}}%
{\footnote{See #1 at \url{#2}}}
}

\ifweb
\newcommand{\youtube}[1]{\special{ximera:rule youtube #1}
  \rule[-0.75em]{0.72\textwidth}{0.405\textwidth}}
\else
\newcommand{\youtube}[1]{YouTube link: \url{https://www.youtube.com/watch?v=#1}}
\fi

\define@key{answer}{given}[true]{\def\ans@given{#1}}
\define@key{answer}{tolerance}{\def\ans@tol{#1}}
\define@key{answer}{validator}{}
\define@key{answer}{id}{\def\ans@id{#1}}
\define@key{answer}{format}{}
\setkeys{answer}{id=,given=false}
\ifweb
\def\answer{%%
  \begingroup %% be better coded.
  \catcode`^=12
  \catcode`_=12\relax
  \answerbox
}
\newcommand{\answerbox}[2][]{% We require this because we must change
\renewcommand{\sqrt}[1]{\string \sqrt\{##1\}} %% the catcodes
\renewcommand{\frac}[2]{((##1)/(##2))}%% before the command
\renewcommand{\log}{\string\log}%% these renewcommads could
\renewcommand{\ln}{\string\ln}%% in theory go above the new command
\renewcommand{\sin}{\string\sin}%
\renewcommand{\cos}{\string\cos}%
\renewcommand{\tan}{\string\tan}%
\renewcommand{\arcsin}{\string\arcsin}%
\renewcommand{\arccos}{\string\arccos}%
\renewcommand{\arctan}{\string\arctan}%
\renewcommand{\infty}{\string\infty}%
\renewcommand{\Gamma}{\string\Gamma}%
\renewcommand{\Delta}{\string\Delta}%
\renewcommand{\Lambda}{\string\Lambda}%
\renewcommand{\Phi}{\string\Phi}%
\renewcommand{\Pi}{\string\Pi}%
\renewcommand{\Psi}{\string\Psi}%
\renewcommand{\Sigma}{\string\Sigma}%
\renewcommand{\Theta}{\string\Theta}%
\renewcommand{\Upsilon}{\string\Upsilon}%
\renewcommand{\Xi}{\string\Xi}%
\renewcommand{\Omega}{\string\Omega}%
\renewcommand{\alpha}{\string\alpha}%
\renewcommand{\beta}{\string\beta}%
\renewcommand{\gamma}{\string\gamma}%
\renewcommand{\delta}{\string\delta}%
\renewcommand{\epsilon}{\string\epsilon}%
\renewcommand{\zeta}{\string\zeta}%
\renewcommand{\eta}{\string\eta}%
\renewcommand{\theta}{\string\theta}%
\renewcommand{\iota}{\string\iota}%
\renewcommand{\kappa}{\string\kappa}%
\renewcommand{\lambda}{\string\lambda}%
\renewcommand{\mu}{\string\mu}%
\renewcommand{\nu}{\string\nu}%
\renewcommand{\xi}{\string\xi}%
\renewcommand{\pi}{\string\pi}%
\renewcommand{\rho}{\string\rho}%
\renewcommand{\sigma}{\string\sigma}%
\renewcommand{\tau}{\string\tau}%
\renewcommand{\upsilon}{\string\upsilon}%
\renewcommand{\phi}{\string\phi}%
\renewcommand{\chi}{\string\chi}%
\renewcommand{\psi}{\string\psi}%
\renewcommand{\omega}{\string\omega}%
\renewcommand{\digamma}{\string\digamma}%
\renewcommand{\varepsilon}{\string\epsilon}%
\renewcommand{\varkappa}{\string\kappa}%
\renewcommand{\varphi}{\string\phi}%
\renewcommand{\varpi}{\string\pi}%
\renewcommand{\varrho}{\string\rho}%
\renewcommand{\varsigma}{\string\sigma}%
\renewcommand{\vartheta}{\string\theta}%
\special{ximera:rule answer #2}%% below we use $#2$, without this AMS environments like gather fail.
\setlength{\fboxrule}{0pt}%% When in arrays, answer needs more vertical padding
\setlength{\fboxsep}{7pt}%% So we put it in an \fbox
\fbox{\rule[-0.75em]{\widthof{\hspace{5.5em}$#2$}}{2.5em}}%% Assumes that the height of the answer is the standard line height
\endgroup
}
\else
\newcommand{\answer}[2][]{%
\ifmmode%
\setkeys{answer}{#1}%
\ifthenelse{\boolean{\ans@given}}
{% Start then statement
\ifhandout % In handout mode, if answer is given
#2 % just give the answer
\else % When not in handout mode,
\underset{\scriptstyle\mathrm{given}}{\fbox{\ensuremath{#2}}} % make a box with the word `given' underneath
\fi
}% End then statement
{% Start else statement
\ifhandout
\fbox{\rm{?}}
\else% show answer in box outside handout mode
\fbox{\ensuremath{#2}}
\fi
}% End else statement
\else%
\GenericError{\space\space\space\space}% Throw an error based on... something? -- Jason
{Attempt to use \@backslashchar answer outside of math mode}
{See https://github.com/ximeraProject/ximeraLatex for explanation.}
{Need to use either inline or display math.}%
\fi
      }
\fi
\define@key{choice}{value}[]{\def\choice@value{#1}}
\define@boolkey{choice}{correct}[true]{\def\choice@correct{#1}}
\define@key{multipleChoice}{id}{\def\mc@id{#1}}
\define@key{otherchoice}{value}[]{\def\otherchoice@value{#1}}
\define@boolkey{otherchoice}{correct}[true]{\def\otherchoice@correct{#1}}
\setkeys{choice}{correct=false,value=}
\setkeys{multipleChoice}{id=}
\setkeys{otherchoice}{correct=false,value=}
\newcounter{ximeraWebChoiceEnumi}

\newcommand{\@choicebox}[2]{%
  \parbox{\linewidth}{
    \renewcommand{\arraystretch}{1}
    \begin{tabular}{rl}\hfil\\
      \parbox{.05\linewidth}{\flushright\large\bfseries(\alph{#1})} &
      \parbox{.9\linewidth-2\tabcolsep}{\flushleft #2} \\\hfil
  \end{tabular}}
}%

\def\@choiceBoxLineSqueeze{-1ex}

\ifweb %% raw choice for web
\newcommand{\@rawchoice}[3]{% (correct) syle (multiplechoice or selectall) and words
  \setkeys{choice}{correct=false}%
  \setkeys{choice}{#1}%
  \addtocounter{ximeraWebChoiceEnumi}{1}
  \let\@mytmplen\relax% %% I need a temp length that can be negative for depth
  \newlength\@mytmplen% %% so we do it here
  \setlength\@mytmplen{\totalheightof{\@choicebox{ximeraWebChoiceEnumi}{#3}}}%
  \ifthenelse{\boolean{\choice@correct}}
     {%
       \special{ximera:rule:open #2 correct}%
       \hspace{-\tabcolsep}\rule[-0.5\@mytmplen]{\linewidth}{\@mytmplen}%
       \hspace{-\linewidth}\@choicebox{ximeraWebChoiceEnumi}{#3}%
       \special{ximera:rule:close #2 correct}%
       \setkeys{choice}{correct=false}\\[\@choiceBoxLineSqueeze]%
     }
     {%
       \special{ximera:rule:open #2 incorrect}%
       \hspace{-\tabcolsep}\rule[-0.5\@mytmplen]{\linewidth}{\@mytmplen}%
       \hspace{-\linewidth}\@choicebox{ximeraWebChoiceEnumi}{#3}%
       \special{ximera:rule:close #2 incorrect}%
               \\[\@choiceBoxLineSqueeze]%
     }%
}
\else\fi
\newcommand{\choice}[2][]{% choice for PDF's
\setkeys{choice}{correct=false}%
\setkeys{choice}{#1}%% options are 'correct' or nothing
\ifthenelse{\boolean{\choice@correct}}
    {% Begin then result
      \ifhandout
    \item{#2}% if it's a handout do nothing
      \else% otherwise use a checkmark to indicate the correct choice to the author
    \item{#2}\,\checkmark\,\setkeys{choice}{correct=false}
      \fi% for handout
    }
    {\item{#2}} % End then result
}

\newcommand{\otherchoice}[2][]{%
\ignorespaces%
\setkeys{otherchoice}{#1}%
\ifthenelse{\boolean{\otherchoice@correct}}%
{% Start then result
#2\ignorespaces\setkeys{otherchoice}{correct=false}\ignorespaces%
}% End then result
\ignorespaces%
}%

\newcommand{\inlinechoice}[2][]{%
\setkeys{choice}{#1}%
\iffirstinlinechoice
\firstinlinechoicefalse
\else
/
\fi
#2
\ifthenelse{\boolean{\choice@correct}}%
{% Start then result
\ifhandout\else\checkmark\ignorespaces\setkeys{choice}{correct=false}\ignorespaces\fi%
}% End then result
{}%nothing to show as not correct
\hspace{-.25em}\ignorespaces%
}
\def\@checkworkwidth{12em}
\newcommand{\@checkwork}{\rule[-0.75em]{\@checkworkwidth}{2.5em}}
\newenvironment{multipleChoice}[1][]
        {% Environment Start Code
        \setkeys{multipleChoice}{#1}%
        \ifweb
        \special{ximera:begin multiplechoice}
        \renewcommand{\choice}[2][]{\@rawchoice{##1}{multiplechoice}{##2}}
        \begin{center}\else
        \begin{trivlist}
        \item[\hskip \labelsep\small\bfseries Multiple Choice:]\hfil
          \begin{enumerate}
        \fi%
}% Note this means that \item has to be the first line after \begin{multipleChoice}.
{% Environment End Code
        \ifweb\end{center}\setcounter{ximeraWebChoiceEnumi}{0}\hfill\special{ximera:rule checkwork multiplechoice}\@checkwork % button for checking work
        \special{ximera:end multiplechoice}
        \else
        %\def\choice\@tempchoice
        \end{enumerate}
\end{trivlist}
        \fi
        }

%%multipleChoice@ is for internal use only! (used in wordChoice)  REMOVE BADBAD
%%this is simply a wrapper for the sole showing (other)choice. REMOVE BADBAD
%%\newenvironment{multipleChoice@}[1][]{}{)} REMOVE BADBAD

\newcommand{\@wordChoiceStackup}[1]{% used for web
\let\@maxWd\relax
\newlength\@maxWd% with a new tmp length
\setlength{\@maxWd}{0em}%
\renewcommand{\choice}[2][]{%
\setkeys{choice}{correct=false}%
\setkeys{choice}{##1}%
\let\@choiceWd\relax% we'll get the length of the entrie
\newlength\@choiceWd% with a new tmp length
\settowidth{\@choiceWd}{\mbox{##2}}%
\setlength{\@maxWd}{\maxof{\@maxWd}{\@choiceWd}}%
\ifthenelse{\boolean{\choice@correct}}
{% correct
\special{ximera:rule:open wordchoice correct}%
##2\hspace{-\@choiceWd}%
\special{ximera:rule:close wordchoice correct}%
}%
{% incorrect
\special{ximera:rule:open wordchoice incorrect}%
##2\hspace{-\@choiceWd}%
\special{ximera:rule:close wordchoice incorrect}%
}%
}% end of redefintion of choice
\mbox{#1~\hspace{\@maxWd}}}

\newcommand{\wordChoice}[1]{%
\let\@choicetemp\choice% Assign a "choicetemp" command to duplicate choice.
\ifweb%
\special{ximera:begin wordchoice}%
\let\@maxWd\relax% we'll get the length of the entrie
\newlength\@maxWd% with a new tmp length
\setlength{\@maxWd}{\widthof{\@wordChoiceStackup{#1}}}%
\rule[-0.75em]{\@maxWd}{2.5em}\hspace{-\@maxWd}\@wordChoiceStackup{#1}%
\special{ximera:end wordchoice}%
\else
\ifwordchoicegiven% If wordchoice option is on, we need to juggle around some definitions.
\let\choice\otherchoice% just prints the correct choice
#1
\else% If not given, we display all answers
\let\choice\inlinechoice%
(#1)\ignorespaces
\fi%for \ifwordchoicegiven
\fi%for \ifweb
\let\choice\@choicetemp% Now that we are done with
}% our modified \choice, we return it to its orginal def

%% %    \begin{macrocode} COMMENTED BY SNAPP 8/1/2021
%% %<*htXimera>
%% \renewenvironment{multipleChoice@}{\refstepcounter{problem}}{}%
%% \ConfigureEnv{multipleChoice@}{\stepcounter{identification}\IgnorePar\HCode{<span class="word-choice" id="word-choice\arabic{identification}">}}{\HCode{</span>}\IgnoreIndent}{}{}
%% %</htXimera>
%% %    \end{macrocode} END COMMENT

\newenvironment{selectAll}[1][]
        {% Environment Start Code
        \setkeys{selectAll}{#1}%
        \ifweb
        \special{ximera:begin selectall}
        \renewcommand{\choice}[2][]{\@rawchoice{##1}{selectall}{##2}}
        \begin{center}\else
        \begin{trivlist}
        \item[\hskip \labelsep\small\bfseries Select All Correct Answers:]\hfil
          \begin{enumerate}
        \fi%
}% Note this means that \item has to be the first line after \begin{selectAll}.
{% Environment End Code
        \ifweb\end{center}\setcounter{ximeraWebChoiceEnumi}{0}\hfill\special{ximera:rule checkwork selectall}\@checkwork % button for checking work
        \special{ximera:end selectall}
        \else
        %\def\choice\@tempchoice
        \end{enumerate}
\end{trivlist}
        \fi
        }


%% solution environment
\ifhandout % what follows is handout behavior
\newenvironment{solution}%
       {%
 \setbox0\vbox\bgroup
       }
               {%
 \egroup
       }
\else
\newenvironment{solution}%
       {%
 \begin{trivlist}
 \item[\hskip \labelsep\bfseries Solution:\hspace{2ex}]
       }
       % %% line at the bottom}
       {
\end{trivlist}
 \par\addvspace{.5ex}\nobreak\noindent\hung
       }
\fi

\newcommand{\PH@Command}{}
\newenvironment{validator}[1][]{
\def\PH@Command{#1}% Use PH@Command to hold the content and be a target for "\expandafter" to expand once.
\mbox{\texttt{\detokenize\expandafter{\PH@Command}}}% Now expand PH@Command once and then detokenize.
}{}
\ifhandout%
\newenvironment{feedback}
               {%
 \setbox0\vbox\bgroup
       }
               {%
 \egroup
       }
\else
\newenvironment{feedback}[1][attempt]{

\def\PH@Command{#1}% Use PH@Command to hold the content and be a target for "\expandafter" to expand once.

\begin{trivlist}% Begin the trivlist to use formating of the "Feedback" label.
\item[\hskip \labelsep\small\slshape\bfseries Feedback% Format the "Feedback" label. Don't forget the space.
(\texttt{\detokenize\expandafter{\PH@Command}}):% Format (and detokenize) the condition for feedback to trigger
\hspace{2ex}]\small\slshape% Insert some space before the actual feedback given.
}{
\end{trivlist} 
}

\fi
\newboolean{given} %% required for freeResponse
\setboolean{given}{true} %% could be replaced by a key=value pair later if needed

\ifweb
\newenvironment{freeResponse}[1][false]%
{\special{ximera:rule freeresponse}

  \noindent\rule{\hsize}{1in}

}%
{}%
\else
\ifhandout
\newenvironment{freeResponse}[1][false]%
{%
\def\givenatend{\boolean{#1}}
\ifthenelse{\boolean{#1}}
{% Begin then result
\begin{trivlist}
\item
}% End then result
{% Begin else result
\setbox0\vbox\bgroup
}% End else result
}
{%
\ifthenelse{\givenatend}
{% Begin then result
\end{trivlist}
}% End then result
{% Begin else result
\egroup
}% End else result
}
\else
\newenvironment{freeResponse}[1][false]%
{% Environment Beginning Code
  \ifthenelse{\boolean{#1}}%% Could probably change this with just putting the (given) in the boolean?-- Jason
   {% Begin then result
   \begin{trivlist}
   \item[\hskip \labelsep\bfseries Free Response (Given):\hspace{2ex}]
   }% End then result
{% Begin else result
\begin{trivlist}
\item[\hskip \labelsep\bfseries Free Response:\hspace{2ex}]
}% End else result
}
{% Environment Ending Code
\end{trivlist}
}
\fi
\fi
\DefineVerbatimEnvironment{code}{Verbatim}{numbers=left,frame=lines,label=Code,labelposition=topline}
\DefineVerbatimEnvironment{python}{Verbatim}{numbers=left,frame=lines,label=Python,labelposition=topline}
\DefineVerbatimEnvironment{javascriptCode}{Verbatim}{numbers=left,frame=lines,label=JavaScript,labelposition=topline}
\ifweb
  \renewcommand{\footnote}[2][]{\relax}
\else
\fi
\newenvironment{dialogue}{%
   \renewcommand\descriptionlabel[1]{\hspace{\labelsep}\textbf{##1:}}
   \begin{description}%
}{%
   \end{description}%
}

%% instructor intro/instructor notes
%%
\ifhandout % what follows is handout behavior
\ifinstructornotes
\newenvironment{instructorIntro}%
       {%
 \begin{trivlist}
 \item[\hskip \labelsep\bfseries Instructor Introduction:\hspace{2ex}]
}
       % %% line at the bottom}
       {
 \end{trivlist}
 \par\addvspace{.5ex}\nobreak\noindent\hung
       }
\else
\newenvironment{instructorIntro}%
       {%
 \setbox0\vbox\bgroup
       }
       {%If this mysteriously starts breaking
                        % remove \ignorespacesafterend
 \egroup\ignorespacesafterend
       }
               \fi
\else% for handout, so what follows is default
\ifinstructornotes
\newenvironment{instructorIntro}%
       {%
         \setbox0\vbox\bgroup
       }
{%
  \egroup
}
                \else
        \newenvironment{instructorIntro}%
{%
  \begin{trivlist}
  \item[\hskip \labelsep\bfseries Instructor Introduction:\hspace{2ex}]
}
{
  \end{trivlist}
  \par\addvspace{.5ex}\nobreak\noindent\hung
}
                \fi
\fi

%% instructorNotes environment
\ifhandout % what follows is handout behavior
\ifinstructornotes
\newenvironment{instructorNotes}%
       {%
 \begin{trivlist}
 \item[\hskip \labelsep\bfseries Instructor Notes:\hspace{2ex}]
       }
       % %% line at the bottom}
       {
\end{trivlist}
 \par\addvspace{.5ex}\nobreak\noindent\hung
       }
       \else
\newenvironment{instructorNotes}%
       {%
         \setbox0\vbox\bgroup
       }
{%
  \egroup
}
                \fi
\else% for handout, so what follows is default
\ifinstructornotes
\newenvironment{instructorNotes}%
       {%
 \setbox0\vbox\bgroup
       }
       {%
 \egroup
       }
       \else
       \newenvironment{instructorNotes}%
              {%
        \begin{trivlist}
        \item[\hskip \labelsep\bfseries Instructor Notes:\hspace{2ex}]
              }
              % %% line at the bottom}
              {
        \end{trivlist}
        \par\addvspace{.5ex}\nobreak\noindent\hung
              }
                      \fi
                              \fi

\newcommand{\xkcd}[1]{#1}

\colorlet{textColor}{black} % since textColor is referenced below
\colorlet{background}{white} % since background is referenced below

%% pretty-foldable
\newenvironment{foldable}{%
}{%
}

%% pretty-expandable
\newenvironment{expandable}{%
}{%
}

\newcommand{\unfoldable}[1]{#1}


\newenvironment{leash}[1]{%
}{%
}


\IfFileExists{sagetex.sty}{\RequirePackage{sagetex}}{}

\DefineVerbatimEnvironment{sageCell}{Verbatim}{numbers=left,frame=lines,label=SAGE,labelposition=topline}

\DefineVerbatimEnvironment{sageOutput}{Verbatim}{numbers=left,frame=lines,label=SAGE-Output,labelposition=topline}



\newenvironment{ungraded}{}{}
\ifweb
\titleformat{\section}{\normalfont\Large\bfseries}{\thesection}{1em}{\special{html <h2>}}[\special{html </h2>}]
\fi
\ifweb
\titleformat{\subsection}{\normalfont\large\bfseries}{\thesubsection}{1em}{\special{html <h3>}}[\special{html </h3>}]
\fi
%% %<*htXourse>  %%%%%%%% REMOVE FROM HERE VVVVVVVVVVVVVVVVVVVVVVVVV
%% \newcounter{ximera@part} %%% REPLACE WITH NEW CARDS
%% \setcounter{ximera@part}{0}
%% \renewcommand\part[1]{%
%% \stepcounter{ximera@part}%
%% \ifvmode \IgnorePar\fi \EndP%
%% \HCode{<h1 id="part\arabic{ximera@part}" class="card part">#1</h1>}%
%% \IgnoreIndent%
%% }
%% %</htXourse>  %%%%%%%%%%%%%%% TO HERE^^^^^^^^^^^^^^^^^^^^^^^^^^^^
\ifweb
\titleformat{\subsubsection}{\normalfont\normalsize\bfseries}{\thesubsubsection}{1em}{\special{html <h4>}}[\special{html </h4>}]
\titleformat{\paragraph}[runin]{\normalfont\normalsize\bfseries}{\theparagraph}{1em}{\special{html <h5>}}[\special{html </h5>}]
\titleformat{\subparagraph}[runin]{\normalfont\normalsize\bfseries}{\thesubparagraph}{1em}{\special{html <h6>}}[\special{html </h6>}]
\fi
\ifweb %% using etoolbox
\pretocmd{\itemize}{\special{html <ul>}}{}{}
\apptocmd{\enditemize}{\special{html </ul>}}{}{}
\pretocmd{\enumerate}{\special{html <ol>}}{}{}
\apptocmd{\endenumerate}{\special{html </ol>}}{}{}
\pretocmd{\@item}{\special{html <li>}}{}{}
\fi


%% 
%% Copyright (C) 2018-2021 by Bart Snapp <bart.snapp@gmail.com> and Jim Fowler <kisonecat@gmail.com>
%% 
%% This work may be distributed and/or modified under the conditions of
%% the LaTeX Project Public License (LPPL), either version 1.3c of this
%% license or (at your option) any later version.  The latest version of
%% this license is in the file:
%% 
%% http://www.latex-project.org/lppl.txt
%% 
%% This work is "maintained" (as per LPPL maintenance status) by
%% Bart Snapp. The source code can be found at:
%% 
%% https://github.com/XimeraProject/ximeraLatex
%% 
%% This work consists of the file ximera.dtx, the associated files
%% under src/, and a Makefile.
%% 
%% Running "make" generates the derived files README, ximera.pdf, ximera.cls, xourse.cls.
%% 
%% Running "make inst" installs the files in the user's TeX tree.
%% 
%% Running "make install" installs the files in the local TeX tree.
%% 
%%
%% End of file `ximera.cls'.
