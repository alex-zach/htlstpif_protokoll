% Class declaration
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{htlstpif_protokoll_en}

% Basis Layout
\LoadClass{article}[12pt]
\setlength{\parskip}{0.7\baselineskip}
\setlength{\parindent}{0pt}

% Imports
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[english]{babel}
\RequirePackage{geometry}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{listings}
\RequirePackage{lastpage}
\RequirePackage{xcolor}
\RequirePackage{hyperref}
\RequirePackage{cite}
\RequirePackage{babelbib}
\RequirePackage{float}

% Page format
\geometry{a4paper, top=3cm, bottom=3cm, left=2cm, right=2cm}

% headlines
\fancypagestyle{firstpage} {
  \fancyhf{}
  \fancyhead[L]{\includegraphics[height=1cm]{logo.png}}
  \fancyhead[R]{\large Abteilung für Informatik}
  \fancyfoot[R]{\thepage\ von \pageref{LastPage}}
}

\fancypagestyle{standard} {
  \fancyhf{}
  \fancyhead[L]{\includegraphics[height=0.75cm]{logo_cropped.png}}
  \fancyhead[R]{\varname}
  \fancyfoot[R]{\thepage\ von \pageref{LastPage}}
}

\pagestyle{standard}

% Titlepage
\newcommand{\vartitle}{\textbackslash ptitle\{TITLE\}}
\newcommand{\varpnr}{\textbackslash pnr\{PNR\}}
\newcommand{\vardate}{\textbackslash pdate\{DATE\}}
\newcommand{\varname}{\textbackslash name\{NAME\}}
\newcommand{\varclass}{\textbackslash class\{CLASS\}}
\newcommand{\varknr}{\textbackslash knr\{CNR\}}
\newcommand{\vargroup}{\textbackslash group\{GROUP\}}

\newcommand{\ptitle}[1]{\renewcommand{\vartitle}{#1}}
\newcommand{\pnr}[1]{\renewcommand{\varpnr}{#1}}
\newcommand{\pdate}[1]{\renewcommand{\vardate}{#1}}
\newcommand{\name}[1]{\renewcommand{\varname}{#1}}
\newcommand{\class}[1]{\renewcommand{\varclass}{#1}}
\newcommand{\knr}[1]{\renewcommand{\varknr}{#1}}
\newcommand{\group}[1]{\renewcommand{\vargroup}{#1}}

\newcommand{\htlstpiftitlepage}{%
  {
  \thispagestyle{firstpage}
  \pagenumbering{arabic}
  \vspace*{2cm}
  \setlength{\tabcolsep}{0.2cm}
  \renewcommand{\arraystretch}{2}
  \Large
  \begin{tabular}{p{3cm}p{4cm}p{4cm}p{3cm}}
    \huge Titel: & \multicolumn{3}{l}{\huge \vartitle} \\
    Number: & \varpnr \\
    Class: & \varclass \\
    Name:   & \varname & Catalog Number: & \varknr \\
    Group: & \vargroup \\
    Submition: & \vardate \\
    \hline
  \end{tabular}
  \renewcommand{\arraystretch}{1}
  }
  \newpage
}

% Listings
\definecolor{backcolour}{rgb}{0.95,0.95,0.95}
\definecolor{black}{rgb}{0,0,0}
\definecolor{keywordcolour}{rgb}{0.007,0.19,0.98}
\definecolor{commentcolor}{rgb}{0,0.53,0.09}
\definecolor{strcolor}{rgb}{0.53,0.31,0}

\lstdefinestyle{code}{
  backgroundcolor=\color{backcolour},
  basicstyle=\ttfamily\footnotesize,
  keywordstyle=\color{keywordcolour},
  commentstyle=\color{commentcolor},
  stringstyle=\color{strcolor},
  breakatwhitespace=false,
  breaklines=true,
  captionpos=b,
  showspaces=false,
  showstringspaces=false,
  showtabs=false,
  tabsize=2,
  rulecolor=\color{black},
  frame=single,
  framesep=3pt
}

\lstset{
  literate=%
    {Ö}{{\"O}}1
    {Ä}{{\"A}}1
    {Ü}{{\"U}}1
    {ß}{{\ss}}1
    {ü}{{\"u}}1
    {ä}{{\"a}}1
    {ö}{{\"o}}1
}

\lstnewenvironment{code}[1][]
    {\lstset{style=code,
    #1}}
    {}

% helpers
\newenvironment{theorie}{\newpage\setcounter{section}{0}\part{Theory}}{\setcounter{section}{0}}
\newenvironment{praxis}{\newpage\setcounter{section}{0}\part{Practical}}{\setcounter{section}{0}}

\newcommand{\source}[1]{%
  \cite{#1}
}
\newcommand{\sources}[1]{%
  \newpage
  \part{Sources}
  \bibliography{#1}{}
  \bibliographystyle{babunsrt}
}

\newcommand{\arrow}{$\rightarrow$ }

\newcommand{\image}[3]{%
  \begin{figure}[H]
    \centering
    \includegraphics[width=#3\textwidth]{#2}
    \caption{#1}
  \end{figure}
}

% Options
\DeclareOption{titlepage}{%
    \AtBeginDocument{%
        \htlstpiftitlepage
    }
}
\DeclareOption{toc}{%
    \AtBeginDocument{%
        \tableofcontents
        \newpage
    }
}
\ProcessOptions\relax
