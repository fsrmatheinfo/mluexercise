%! Class = mluexercise
%! Author = Fachschaftsrat Mathematik/Informatik der Studierendenschaft der Martin-Luther-Universität Halle-Wittenberg
%! Date = 2020/04/20

\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{mluexercise}[2020/04/20 v1.0]

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
    WS~{\advance\year by -1\the\year\advance\year by 1}/\the\year%
    \else\ifnum\month<10 % Summer semester.
    SS~\the\year%
    \else % Winter semester, including next year.
    WS~\the\year/{\advance\year by 1\the\year\advance\year by -1}%
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

\RequirePackage{mlutext}
\RequirePackage{mlumath}
\RequirePackage{mlualgorithm}
\RequirePackage{mlulisting}
\RequirePackage[autostyle=true,german=quotes]{csquotes}

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
