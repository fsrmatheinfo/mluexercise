%! Class = mluexercise
%! Author = Fachschaftsrat Mathematik/Informatik der Studierendenschaft der Martin-Luther-Universität Halle-Wittenberg
%! Date = 2020/04/20

\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{mluexercise}[2020/04/20 v1.0]

% Class options:
\newif\ifdataminingstyle\dataminingstylefalse
\DeclareOption{dataminingstyle}{%
  \dataminingstyletrue
}

% Process options and pass remaining options to parent class.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\ProcessOptions*

% Load base class (scrartcl).
\LoadClass{scrartcl}

% Encoding:
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}

% Basic utilities:
\RequirePackage{ifthen} % Conditional branches and loops.
\RequirePackage{etoolbox} % Hooks for executing code.
\RequirePackage{hyperref}
\RequirePackage{color,xcolor}
\RequirePackage{graphicx}

% Language:
\RequirePackage{babel}
\RequirePackage{iflang}
\newcommand{\IfGerman}[2]{\IfLanguagePatterns{german}{#1}{\IfLanguagePatterns{ngerman}{#1}{#2}}}

% Variables:
\newcommand{\@checkoption}[3]{%
    \AtEndPreamble{%
        \ifthenelse{\equal{\the#1}{}}{%
            \ClassError{mluexercise}{Missing #2}{Set #2 using the \protect#3 command.}%
        }{}%
    }%
}
\newtoks\@lecture
\newcommand{\lecture}[1]{\global\@lecture{#1}}
\let\title\lecture % Redefine standard \title command.
\@checkoption{\@lecture}{lecture name}{\lecture}
\newtoks\@semester
\newcommand{\semester}[1]{\global\@semester{#1}}
\global\@semester{ % Automatically set semester based on the current date.
    \ifnum\month<4 % Winter semester, including previous year.
    WS~{\advance\year by -1 \the\year\advance\year by 1}/\the\year%
    \else\ifnum\month<10 % Summer semester.
    SS~\the\year%
    \else % Winter semester, including next year.
    WS~\the\year/{\advance\year by 1 \the\year\advance\year by -1}%
    \fi\fi%
}
\newtoks\@exercise
\newcommand{\exercise}[1]{\global\@exercise{#1}}
\@checkoption{\@exercise}{exercise number}{\exercise}
\newtoks\@task
\newcommand{\task}[1]{\global\@task{#1}}
\global\@task{1}
\newtoks\@group
\newcommand{\group}[1]{\global\@group{#1}}
\global\@group{0}
\newtoks\@studentname
\newcommand{\studentname}[1]{\global\@studentname{#1}}
\let\author\studentname % Redefine standard \title command.
\@checkoption{\@studentname}{student name}{\studentname}
\newtoks\@studentnumber
\newcommand{\studentnumber}[1]{\global\@studentnumber{#1}}
\newtoks\@studentsymbol
\newcommand{\studentsymbol}[1]{\global\@studentsymbol{#1}}

% Page layout:
\RequirePackage{calc}
\RequirePackage[
    a4paper,
    inner=2cm,
    outer=2cm,
    top=3cm,
    bottom=3cm,
    head=0.75cm,
    headsep=0.25cm,
    foot=0.75cm,
]{geometry}
\RequirePackage{totpages}
\renewcommand{\baselinestretch}{1.15}
\setlength{\parindent}{0em} % Disable paragraph indentation.
\setlength{\parskip}{1ex} % Instead enable paragraph margins.

% Font families:
\RequirePackage{libertine} % Libertine for body text.
\RequirePackage{eulervm} % "Euler Maths" font for maths.
\RequirePackage[ttdefault]{sourcecodepro} % "Source Code Pro" font for monospace/code.
\RequirePackage{microtype}\DisableLigatures{family=tt*} % Disable ligatures for monospace fonts.

% Text styles:
\newcommand{\strong}[1]{\textbf{#1}}
\newcommand{\italic}[1]{\textit{#1}}
\newcommand{\code}[1]{\texttt{#1}}
\newcommand{\Underline}[1]{\underline{\underline{#1}}} % Double underline.
\newcommand{\plural}[1]{\textsuperscript{\underline{$#1$}}} \newcommand{\pl}[1]{\plural{#1}} % Abbreviated plural (superscript + underline) for "Lineare Algebra" lecture.
\RequirePackage[autostyle=true,german=quotes]{csquotes}

% URL/link font:
\RequirePackage{relsize}
\newcommand{\ttsmallfont}{\ttfamily\smaller}
\renewcommand{\UrlFont}{\ttsmallfont}
\newcommand{\textttsmall}[1]{{\ttsmallfont #1}}
\newcommand{\query}[1]{{\ttsmallfont #1}}
\newcommand{\domain}[1]{\href{http://#1}{\mbox{\ttsmallfont #1}}}
\newcommand{\email}[1]{\href{mailto:#1}{\mbox{\ttsmallfont #1}}}

% Maths packages:
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{amstext}
\RequirePackage{array}
\RequirePackage{cancel}

\newcommand{\union}{\cup}
\newcommand{\disjunction}{\uplus}
\newcommand{\intersection}{\cap}
\newcommand{\intersect}{\cap}
\newcommand{\infinity}{\infty} % Unendlich-Zeichen
\newcommand{\corresponds}{\triangleq} % Entspricht-Zeichen

\newcommand{\C}{\mathbb{C}} \newcommand{\complexnumbers}{\C} % Complex numbers.
\newcommand{\R}{\mathbb{R}} \newcommand{\realnumbers}{\R} % Real numbers.
\newcommand{\Q}{\mathbb{Q}} \newcommand{\rationalnumbers}{\Q} % Rational numbers.
\newcommand{\Z}{\mathbb{Z}} \newcommand{\wholenumbers}{\Z} % Whole numbers.
\newcommand{\N}{\mathbb{N}} \newcommand{\naturalnumbers}{\N} % Natural numbers.
\newcommand{\B}{\mathbb{B}} \newcommand{\binarynumbers}{\B} % Binary numbers.
\renewcommand{\O}{\mathcal{O}} % asymptotic O-Notation ("Datenstrukturen und effiziente Algorithmen" lecture)

\newcommand{\mland}{\(\land\)} % \land in text.
\newcommand{\mlor}{\(\lor\)} % \lor in text.

\newcommand{\base}[1]{\mathcal{#1}} % Formatierung für Basis ("Lineare Algebra" lecture)

% Math operators for "Lineare Algebra" lecture:
\DeclareMathOperator{\im}{im} % Image
\DeclareMathOperator{\id}{id} % Identity
\DeclareMathOperator{\sel}{sel} % Selection
\DeclareMathOperator{\dom}{dom} % Domain
\DeclareMathOperator{\ran}{ran} % Range
\DeclareMathOperator{\Hom}{Hom} % Homomorphism
\DeclareMathOperator{\End}{End} % Endomorphism

% Math operators for "Datenstrukturen und effiziente Algorithmen" lecture:
\DeclareMathOperator{\indeg}{indeg} % Indegree
\DeclareMathOperator{\outdeg}{outdeg} % Outdegree

% Math operators for "Einführung in Data Science" and "Data Mining" lectures:
\renewcommand{\P}{\ifdataminingstyle p\else\mathbf{P}\fi}
\newcommand{\E}{\ifdataminingstyle\mathbb{E}\else\mathbf{E}\fi}
\DeclareMathOperator{\var}{var}
\DeclareMathOperator{\Var}{Var}
\DeclareMathOperator{\cov}{cov}
\DeclareMathOperator{\Cov}{Cov}
\DeclareMathOperator{\Bin}{Bin}
\DeclareMathOperator{\Exp}{Exp}
\DeclareMathOperator{\Dir}{Dir}
\DeclareMathOperator{\Mult}{Mult}
\newcommand{\Normal}{\mathcal{N}}
\newcommand{\Norm}{\Normal}

% Swap commands for better style.
\let\tmp\mod \let\mod\bmod \let\bmod\tmp
\let\varemptyset\emptyset \let\emptyset\varnothing
\let\tmp\epsilon \let\epsilon\varepsilon \let\varepsilon\tmp
\let\tmp\phi \let\phi\varphi \let\varphi\tmp

\newcommand{\eqtransform}{\ensuremath{\qquad\big|\,\,}} % Equivalence transformation
\newcommand{\ditto}{\textquotedbl} \newcommand{\dito}{\ditto} % "Ditto" sign
\renewcommand{\qed}{\nopagebreak\hfill\ensuremath{\square}} % End of proof: "quod erat demonstrandum"

% Math mode table columns.
\newcolumntype{L}{>{\(}l<{\)}}
\newcolumntype{R}{>{\(}r<{\)}}
\newcolumntype{C}{>{\(}c<{\)}}

% Calculus:
\newcounter{calculusRowCount}

\RequirePackage{pgfkeys}
\newenvironment{calculus}[1]{
\pgfkeys{/mlu/calculus/.cd,show index=false,context=\Gamma,context command=context,#1}
\setcounter{calculusRowCount}{0}
\newcommand{\calculusSymbol}{\text{\sffamily\itshape\pgfkeysvalueof{/mlu/calculus/symbol}}}
\newcommand{\calculusContext}{\ensuremath{\pgfkeysvalueof{/mlu/calculus/context}}}
\expandafter\let\csname \pgfkeysvalueof{/mlu/calculus/context command}\endcsname\calculusContext
\par\vspace{0.5em}
\begin{minipage}{\textwidth}\begin{tabular}{
@{\stepcounter{calculusRowCount} (\arabic{calculusRowCount})\hspace{1em}} R
    @{\hspace{0.4em} $\vdash_{\ifthenelse{\equal{\pgfkeysvalueof{/mlu/calculus/show index}}{true}}{\ifthenelse{\equal{\pgfkeysvalueof{/mlu/calculus/symbol}}{}}{}{\calculusSymbol}}{\hspace{-0.1em}}}$\hspace{0.6em}}
L l}
}{
\end{tabular}\end{minipage}\vspace{0.5em}
\let\calculusContext\undefined \let\calculusSymbol\undefined
\expandafter\let\csname \pgfkeysvalueof{/mlu/calculus/context command}\endcsname\undefined
}
\newenvironment{eqcalc}[1][]{\begin{calculus}[symbol=E,show index=true,context={\calculusSymbol_{#1}},context command=E]}{\end{calculus}} % Equation calculus
\newenvironment{seqcalc}{\begin{calculus}[symbol=S,show index=true, context={\calculusSymbol},context command=seq]}{\end{calculus}} % Sequence calculus

% Algorithms:
\RequirePackage[vlined,linesnumbered]{algorithm2e}
\DontPrintSemicolon % Hide semicolons.
\SetKwProg{Function}{function}{\ is}{end function} % Function definition.
\SetKwComment{Comment}{\quad$\triangleright$\ }{}\SetCommentSty{itshape} % Comment style.
\SetKw{Continue}{continue}
\SetKwBlock{Repeat}{repeat}{}
\SetNlSty{tiny}{}{} % Line number font.
\SetNlSkip{0.5em} % Line number skip.
\SetAlgoNlRelativeSize{0}
\SetAlFnt{\footnotesize}

\RequirePackage{listings}
\RequirePackage{listingsutf8} % UTF8 support in included listings.

% Colors:
\definecolor{lsnumber}{rgb}{0,0,0} % Zeilennummerfarbe
\definecolor{lscomment}{rgb}{0.25,0.5,0.35} % Kommentarfarbe
\definecolor{lskeyword}{rgb}{0.5,0,0.35} % Schlüsselwörterfarbe
\definecolor{lsstring}{rgb}{0.6,0,0} % Zeichenkettenfarbe

% Default code style:
\lstset{
    language=C,
    basicstyle=\ttfamily,
    breakatwhitespace=false,
    breaklines=true,
    prebreak={\mbox{\(\hookleftarrow\)}},
    numbers=left,
    numberstyle=\color{lsnumber}\tiny,
    numbersep=0.5em,
    stepnumber=1,
    commentstyle=\color{lscomment},
    morecomment=[s][\color{lscomment}]{/**}{*/},
    keepspaces=true,
    keywordstyle=\bfseries\color{lskeyword},
    stringstyle=\color{lsstring},
    showtabs=false, showspaces=false,
    showstringspaces=false,
    tabsize=2,
}

% Haskell code style ("Konzepte der Programmierung" lecture):
\lstdefinestyle{haskell}{
    language=haskell,
    escapeinside={*'}{'*},
    showstringspaces=false,
    morecomment=[l]\%,
    captionpos=b,
    emphstyle={\bfseries},
}

% Prof. Molitor's assembler code style ("Einführung in Rechnerarchitektur" lecture):
\lstdefinestyle{massembler}{
    language=[x86masm]Assembler,
    morekeywords={
    ldd, sto, shl, shr, rol, ror, sub, add, shli,
    shri, roli, rori, subi, addi, or, and, xor,
    xnor, jmp, beq, bneq, bgt, bo, ldpc, stpc
    },
    comment=[l]{\#},
}

% Title format:
\newcommand{\Rom}[1]{\uppercase\expandafter{\romannumeral#1\relax}}
\newcommand{\groupstring}{\ifnum\the\@group>0{, \IfGerman{Gruppe}{Group} \Rom{\the\@group}}\fi}
\author{}
\setkomafont{title}{\sffamily\bfseries\huge\centering}
\setkomafont{date}{\sffamily\large\centering}
\newlength{\approxtitlewidth}
\renewcommand{\maketitle}{%
    \settowidth{\approxtitlewidth}{\usefontofkomafont{title}\the\@lecture}%
    \ifthenelse{\lengthtest{\approxtitlewidth>\textwidth}}{\addtokomafont{title}{\LARGE}}{}%
    \begin{center}%
        \usefontofkomafont{title}\the\@lecture \\
        \usefontofkomafont{date}\@date, \the\@semester\groupstring
    \end{center}
}

% Page head/foot:
\RequirePackage[headsepline,footsepline]{scrlayer-scrpage}
\pagestyle{scrheadings}
\clearscrheadfoot
\setkomafont{pageheadfoot}{\sffamily}
\setkomafont{pagenumber}{\sffamily}
\ofoot{\thepage~von~\ref{TotPages}}

% Headings:
\setkomafont{sectioning}{\sffamily\mdseries}
\setkomafont{section}{\LARGE}
\setkomafont{subsection}{\Large}
\setkomafont{subsubsection}{\large}
\setkomafont{paragraph}{\large}
\setkomafont{subparagraph}{\normalsize}
\renewcommand\thesection{\bfseries\upshape \IfGerman{Aufgabe}{Task} \arabic{section}}
\renewcommand\thesubsection{\bfseries\upshape \alph{subsection})}
\renewcommand\thesubsubsection{\upshape (\roman{subsubsection})}
\renewcommand{\autodot}{}

% Drawing/plots:
\RequirePackage{float}
\RequirePackage{subcaption}
\RequirePackage{tikz}
\RequirePackage{pgfplots}
\RequirePackage{rotating}
\usetikzlibrary{positioning}
\usetikzlibrary{automata}
\usetikzlibrary{trees}
\tikzset{
    >=latex,
    font=\sffamily,
}
\pgfplotsset{compat=1.16}

% Hooks:
\AtEndPreamble{
    % Title/headings:
    \setcounter{section}{\the\@task} \addtocounter{section}{-1} % Set first section number to task number.

    \newcommand{\@exercisestring}{\IfGerman{\the\@exercise.~Übungsserie}{Exercise~\the\@exercise}}

    % Page head/foot:
    \ihead{\the\@studentname}
    \chead{\textbf{\@exercisestring}}
    \ohead{
        \the\@studentnumber%
        \ifthenelse{\equal{\the\@studentnumber}{} \OR \equal{\the\@studentsymbol}{}}{}{\ /\,}%
        \the\@studentsymbol%
    }

    % PDF meta information:
    \hypersetup{
        pdfauthor={\the\@studentname},
        pdftitle={\@exercisestring - \the\@lecture}
    }
}
