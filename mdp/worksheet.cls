% worksheet.cls
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{worksheet}[2025/01/21 Custom Worksheet Class]

% Base class
\LoadClass[11pt,letterpaper]{article}

% Required packages
\RequirePackage{geometry}
\RequirePackage{listings}
\RequirePackage{xcolor}
\RequirePackage{enumitem}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}

% Page geometry
\geometry{
    letterpaper,
    margin=1in,
    headheight=14pt
}

% Header and footer setup
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}
\fancyhead[L]{\@title}
\fancyhead[R]{\@date}
\fancyfoot[C]{Page \thepage{} of \pageref{LastPage}}

% Custom commands for worksheet information
\renewcommand{\maketitle}{%
    \begin{center}
        {\Large\textbf{\@title}}\\[0.5em]
        {\large\@author}\\[0.5em]
        {\@date}
    \end{center}
}

% Code listing settings
\lstdefinestyle{mystyle}{
    backgroundcolor=\color{white},   
    commentstyle=\color{black},
    keywordstyle=\color{black},
    numberstyle=\tiny\color{black},
    stringstyle=\color{black},
    basicstyle=\ttfamily\footnotesize,
    breakatwhitespace=false,         
    breaklines=true,                 
    captionpos=b,                    
    keepspaces=true,                 
    numbers=left,                    
    numbersep=5pt,                  
    showspaces=false,                
    showstringspaces=false,
    showtabs=false,                  
    tabsize=2
}

\lstset{style=mystyle}

% Commands for answer spaces
\newcommand{\answerspace}[1][3in]{%
    \par\vspace{1ex}%
    \noindent\framebox[\linewidth]{%
        \vbox to #1{\vfill}%
    }%
    \par\vspace{1ex}%
}

\newcommand{\shortanswerspace}[1][1in]{\answerspace[#1]}
\newcommand{\longanswerspace}[1][4in]{\answerspace[#1]}

% Form field command
\newcommand{\formfield}[1]{%
    \begingroup%
    \setlength{\parindent}{0pt}%
    #1: \uline{\hspace{2in}}%
    \endgroup%
}

% Two column form field command
\newcommand{\twofields}[2]{%
    \noindent%
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll@{}}%
        \formfield{#1} & \formfield{#2}\\[1ex]%
    \end{tabular*}%
}

% Required package for underlines
\RequirePackage{ulem}

% Required package for optional arguments
\RequirePackage{xparse}
\newcounter{questionCounter}
% Question environment with subtitle support
\NewDocumentEnvironment{question}{o o}{%
    \stepcounter{questionCounter}%
    \par\vspace{2ex}\noindent%
    \textbf{Question \thequestionCounter.}%
    \IfValueT{#1}{ #1}%
    \par\vspace{0.5ex}%
    \hrule height 0.5pt%
    \IfValueT{#2}{%
        \vspace{0.5ex}\noindent#2\par%
    }%
    \vspace{1ex}%
}{\par\vspace{2ex}}

% Solution environment
\newenvironment{solution}{%
    \par\noindent%
    \textbf{Solution:}\par%
    \vspace{1ex}%
}{\par\vspace{2ex}}