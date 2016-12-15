\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ec}[2016/09/18 Eston College Research Paper]

%% 8.5 by 11 inch paper and 12pt font (4).
\LoadClass[letterpaper,12pt]{article}

%% Times Roman font face (4).
\RequirePackage{pslatex}
\RequirePackage{setspace}
\RequirePackage{ragged2e}
\RequirePackage[absolute]{textpos}
\RequirePackage[greek,english]{babel}
\usepackage[babel]{csquotes}
\usepackage[utf8x]{inputenc}
\usepackage{fixltx2e}

%% Use letter-sized paper for PDF output.
\ifx\pdfoutput\undefined
\else
  \pdfpagewidth 8.5in
  \pdfpageheight 11in
\fi

%% 1 inch margins on all sides (4).
\setlength{\paperwidth}{8.5in}
\setlength{\paperheight}{11in}
\setlength{\hoffset}{0pt}
\setlength{\voffset}{0pt}
\setlength{\oddsidemargin}{0pt}
\setlength{\evensidemargin}{0pt}
\setlength{\topmargin}{0pt}
\setlength{\headheight}{0pt}
\setlength{\headsep}{0pt}
\setlength{\textheight}{9in}
\setlength{\textwidth}{6.5in}
\setlength{\marginparsep}{0pt}
\setlength{\marginparwidth}{0pt}
%% This is not specified in the the guide, but rather a reasonable guess.
\let\oldfootnote\footnote
\renewcommand\footnote[1]{%
\oldfootnote{\hspace{1mm}#1}}

%% Text, title pages and outlines are double spaced (5).
\doublespacing

\g@addto@macro{\RaggedRight}{\hbadness=\@M}
\setlength{\RaggedRightRightskip}{0pt plus 1fil}
\setlength{\RaggedRightParindent}{.5in}
\RaggedRight

\setlength{\TPHorizModule}{1in}
\setlength{\TPVertModule}{1in}

%% Title pages include the fields title, author, student I.D. number, mailbox
%% number, professor, course name and number, and due date (author, title,
%% and date are already defined) (5).
\renewcommand{\@title}{}
\renewcommand{\title}[1]{\renewcommand{\@title}{\uppercase{#1}}}
\newcommand{\@boxnumber}{}
\newcommand{\boxnumber}[1]{\renewcommand{\@boxnumber}{#1}}
\newcommand{\@studentid}{}
\newcommand{\studentid}[1]{\renewcommand{\@studentid}{#1}}
\newcommand{\@professor}{}
\newcommand{\professor}[1]{\renewcommand{\@professor}{#1}}
\newcommand{\@course}{}
\newcommand{\course}[1]{\renewcommand{\@course}{#1}}
\renewcommand{\@date}{}
\renewcommand{\date}[1]{\renewcommand{\@date}{#1}}

%% These counters help with the pagination of the title page and outline.
%% The page numbering should work no matter where you put the title page
%% and outline.
\newcounter{temppage}
\newcounter{prefacepage}
\setcounter{prefacepage}{1}

\renewcommand{\maketitle}{%
  \begin{titlepage}%
  \centering%
  %% The title block should be 2 inches from the top of the page
  %% (Appendix A).
  \vspace*{1in}\vspace*{-2.25em}%
  \@title%
  %% The author block should be 5 inches from the top of the page
  %% (Appendix A).
  \begin{textblock}{6.5}(1,5)%
  \centering%
  By\\%
  \@author\\%
  Student \# \@studentid\\%
  Box \@boxnumber%
  \end{textblock}%
  %% The assignment block should be 2 inches from the bottom of the page
  %% (Appendix A).
  \vfill%
  \@professor\\%
  \@course\\%
  \@date%
  \vspace*{1in}%
  \end{titlepage}%
  \addtocounter{prefacepage}{1}%
}

%% The outline page needs a field for a thesis statement (5).
\newcommand{\@thesis}{}
\newcommand{\thesis}[1]{\renewcommand{\@thesis}{#1}}

%% This is just a helper that makes the table of contents more like the
%% title page.
\newenvironment{toc}{%
  \newpage%
  \pagenumbering{roman}%
  \setcounter{temppage}{\value{page}}%
  \setcounter{page}{\value{prefacepage}}%
}{%
  \if\value{page}=\value{prefacepage}{%
    \thispagestyle{empty}%
  }\else{%
    \setcounter{prefacepage}{\value{page}}%
  }\fi%
  \newpage%
  \pagenumbering{arabic}%
  \setcounter{page}{\value{temppage}}%
}

\renewcommand{\tableofcontents}{%
  \begin{toc}%
  %% The word "OUTLINE" is centred and typed two inches from the top of the
  %% page (Appendix B).
  \vspace*{1in}\vspace*{-1em}%
  {\centering OUTLINE\par}%
  %% The thesis statement is two lines below the title. It is single spaced.
  %% Nothing is written about a hanging indent, but the example uses one
  %% (Appendix B).
  \vspace*{1em}%
  \begin{singlespace}%
    \leftskip=0.5in%
    \hangindent=9pt%
    \hangafter=1%
    \noindent \underline{Thesis:} \@thesis%
  \end{singlespace}%
  %% The outline is also two lines below the thesis. These spaces were
  %% eyeballed, as is the 1.5 line-spacing for the outline (Appendix B).
  \vspace*{1.5em}%
  \begin{spacing}{1.5}%
    \@starttoc{toc}%
  \end{spacing}%
  \end{toc}%
}

%% These spaces are just clever guesses.
\renewcommand{\l@section}{\@dottedtocline{1}{0.5in}{0.5in}}
\renewcommand{\l@subsection}{\@dottedtocline{2}{1in}{1.75em}}
\renewcommand{\l@subsubsection}{\@dottedtocline{3}{1.5in}{1.75em}}
\renewcommand{\l@paragraph}{\@dottedtocline{4}{2in}{1.75em}}
\renewcommand{\@dotsep}{10000}
\let\ec@contentsline\contentsline
\renewcommand{\contentsline}[3]{\ec@contentsline{#1}{#2}{}}

%% Outlines use Roman, Alph, arabic, and alph for each indentation level
%% 1, 2, 3, and 4 respectively. The example shows that the forth level
%% numbering is followed by periods, however, the text says right
%% parentheses (Appendix B).
\renewcommand{\thesection}{\Roman{section}.}
\renewcommand{\thesubsection}{\Alph{subsection}.}
\renewcommand{\thesubsubsection}{\arabic{subsubsection}.}
\renewcommand{\theparagraph}{\alph{paragraph})}
\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{4}

%% Nothing is said about titles in the guide, so we hide them by default.
\renewcommand{\@startsection}[7]{%
  \refstepcounter{#1}%
  \addcontentsline{toc}{#1}{%
    \protect\numberline{\csname the#1\endcsname}#7%
  }%
}

\setlength{\footnotesep}{20pt}
\renewcommand{\footnoterule}{%
  \vspace*{-3pt}%
  \hrule width 2.5in height 0.4pt%
  \vspace*{-3pt}%
}

\renewenvironment{thebibliography}{
  \newpage%
  \begin{singlespace}%
  \setlength{\parskip}{0pt}%
  %% The title "WORKS CITED" is centred and typed two inches from the top
  %% of the page (Appendix C).
  \vspace*{1in}\vspace*{-1.3em}%
  {\centering WORKS CITED\par}%
    \begin{list}{}%
      {\setlength{\topsep}{0pt}%
       \setlength{\partopsep}{3em}% Three lines after the title.
       \setlength{\itemsep}{2em}% Two lines between entries.
       \setlength{\parsep}{0pt}%
       \setlength{\leftmargin}{0.5in}%
       \setlength{\rightmargin}{0pt}%
       \setlength{\labelwidth}{0pt}%
       \setlength{\labelsep}{0pt}%
       \setlength{\listparindent}{0pt}%
       \setlength{\itemindent}{-0.5in}}% Hanging indent.
      \renewcommand{\bibitem}[1]{\item}%
}{%
    \end{list}%
  \end{singlespace}%
}

\newlength{\ec@qindent}
\setlength{\ec@qindent}{0pt}

\renewenvironment{quote}[1][\ec@qindent]{%
  \begin{list}{}%
    {\setlength{\topsep}{0pt}%
     \setlength{\partopsep}{0pt}%
     \setlength{\itemsep}{0pt}%
     \setlength{\parsep}{0pt}%
     \setlength{\leftmargin}{\parindent}%
     \setlength{\rightmargin}{0pt}%
     \setlength{\labelwidth}{0pt}%
     \setlength{\labelsep}{0pt}%
     \setlength{\listparindent}{\parindent}%
     \setlength{\itemindent}{#1}%
     \singlespacing}%
  \item\relax%
}{%
  \end{list}%
}

\newcommand{\LORD}{\textsc{Lord}}
\newcommand{\hellip}{.\thinspace.\thinspace.}
\newcommand{\questions}[1]{}
