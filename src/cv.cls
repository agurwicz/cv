% Sizes
\newcommand{\contentsize}{9pt}
\newcommand{\headernamesize}{24pt}
\newcommand{\headerinfosize}{9.5pt}
\newcommand{\sectionsize}{12pt}
\newcommand{\publicationauthorsize}{9pt}

\newcommand{\cvlisttopspace}{-0.5em}
\newcommand{\cvlistbottomspace}{0.9em}
\newcommand{\headertopspace}{1.2em}

\LoadClass[\contentsize]{article}

% Packages
\RequirePackage[papersize={8.5in, 11in}, margin=0.5in]{geometry}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{enumitem}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{xifthen}
\RequirePackage{booktabs}
\RequirePackage{float}
\RequirePackage{lmodern}
\RequirePackage{sansmathfonts}

% Setup
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\rfoot{\thepage/\pageref{LastPage}}
\setlength{\footskip}{0cm}
\setlength{\parindent}{0pt}
\renewcommand{\familydefault}{\sfdefault}
\newcommand{\cvbullet}{\boldmath\( \cdot \)}
\renewcommand\labelitemi{\cvbullet}
\setlist[itemize]{itemsep=-1pt, topsep=1pt}

% Header
\newcommand{\cvhline}[1]{\noindent\rule{\textwidth}{#1}}
\newcommand{\headerspace}{\hspace{6pt}\( \vert \)\hspace{6pt}}

\newcommand{\cvmakeheader}[6]{
    \begin{center}
        \begin{cvswitchfont}{\headernamesize}
            #1
        \end{cvswitchfont}

        \vspace{8pt}
        \begin{cvswitchfont}{\headerinfosize}
            \href{https://#2}{#2}\headerspace
            \href{https://#3}{#3}\headerspace
            \href{mailto:#4}{#4}\headerspace
            \href{tel:#5}{#6}
        \end{cvswitchfont}
    \end{center}

    \vspace{2em}
}

% Custom commands

\newenvironment{cvswitchfont}[1]{\fontsize{#1}{1pt}\fontsize{#1}{1pt}\selectfont}{}

\NewDocumentEnvironment{cvcontentsection}{smO{}}{%
    \IfBooleanF{#1}{\vspace{\headertopspace}}%
    \begin{cvswitchfont}{\sectionsize} \textsc{#2} \end{cvswitchfont} #3

    \vspace{-4pt}\cvhline{0.05pt}
}{}

\NewDocumentEnvironment{cvsubcontentsection}{smO{}}{%
    \IfBooleanF{#1}{\vspace{\headertopspace}}%
    \begin{cvswitchfont}{\sectionsize} \textsc{#2} \end{cvswitchfont} #3
    ~\newline
}{}

\NewDocumentEnvironment{cvjob}{smmmmm+b}{%
    \begin{tabular*}{\textwidth}{@{}l@{\extracolsep{\fill}}r@{}}
        \textbf{#2} & #3
    \end{tabular*}

    \vspace{3.75pt}
    \begin{tabular*}{\textwidth}{@{}l@{\extracolsep{\fill}}r@{}}
        \textit{#4} & #5\ifstrempty{#6}{}{ \textendash\ #6}
    \end{tabular*}

    \vspace{\cvlisttopspace}
    \ifstrempty{#7}{}{%
        \begin{itemize}[topsep=\cvlistbottomspace,itemsep=0.3mm,rightmargin=\leftmargin]
            #7
        \end{itemize}%
        \IfBooleanT{#1}{\vspace{-\cvlistbottomspace}}%
    }
}{}
\NewDocumentEnvironment{cvjob2}{smmmmm+b}{%
    \begin{tabular*}{\textwidth}{@{}l@{\extracolsep{\fill}}r@{}}
        \textbf{#2} & #3
    \end{tabular*}

    \vspace{3.75pt}
    \begin{tabular*}{\textwidth}{@{}l@{\extracolsep{\fill}}r@{}}
        \textit{#4} & #5 \\
        & #6
    \end{tabular*}

    \vspace{\cvlisttopspace}
    \ifstrempty{#7}{}{%
        \begin{itemize}[topsep=\cvlistbottomspace,itemsep=0.3mm,rightmargin=\leftmargin]
            #7
        \end{itemize}%
        \IfBooleanT{#1}{\vspace{-\cvlistbottomspace}}%
    }
}{}

\newcommand{\cvdoilink}[1]{%
    \url{https://doi.org/#1}.%
}

\NewDocumentCommand{\cvpublication}{smmmo}{%
    #3\IfValueT{#5}{ (#5).} #2. #4%
    \vspace{\cvlistbottomspace}
    \IfBooleanT{#1}{\vspace{-\cvlistbottomspace}}
}

\NewDocumentCommand{\cvtalk}{smm}{%
    \textbf{\textit{#2}}
    \vspace{\cvlisttopspace}\begin{itemize}[topsep=\cvlistbottomspace] #3 \end{itemize}
    \IfBooleanT{#1}{\vspace{-\cvlistbottomspace}}
}

\NewDocumentCommand{\cvaward}{smmmm}{%
    \textbf{#2}, #3\hfill#4
    \vspace{\cvlisttopspace}\begin{itemize}[topsep=\cvlistbottomspace] \item #5 \end{itemize}
    \IfBooleanT{#1}{\vspace{-\cvlistbottomspace}}
}

\NewDocumentEnvironment{cvteaching}{smmm+b}{%
    \begin{tabular*}{\textwidth}{@{}l@{\extracolsep{\fill}}r@{}}
        \textbf{#2} & #3\ifstrempty{#4}{}{ \textendash\ #4}
    \end{tabular*}

    \vspace{\cvlisttopspace}
    \ifstrempty{#5}{}{%
        \begin{itemize}[topsep=\cvlistbottomspace,itemsep=0.3mm,rightmargin=\leftmargin]
            #5
        \end{itemize}%
        \IfBooleanT{#1}{\vspace{-\cvlistbottomspace}}%
    }
}{}

\NewDocumentCommand{\cvitem}{sm}{\IfBooleanF{#1}{&} \cvbullet~#2}
\NewDocumentEnvironment{cvitems}{m}{\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}#1}}{\end{tabular*}}

\NewDocumentCommand{\cvreference}{mmmmmm}{
    \textbf{#1}, #3

    \vspace{3pt}
    #4\ifstrempty{#5}{}{, #5}

    \vspace{3pt}
    \href{mailto:#2}{#2} \( \vert \) #6
    \vspace{\cvlistbottomspace}
}
