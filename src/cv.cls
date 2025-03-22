% Sizes
\newcommand{\contentsize}{8pt}
\newcommand{\headernamesize}{18pt}
\newcommand{\headerinfosize}{9pt}
\newcommand{\publicationauthorsize}{8pt}

\newcommand{\cvlisttopspace}{-0.45em}
\newcommand{\cvlistbottomspace}{0.9em}

% Using extarticle for smaller font sizes
\LoadClass[\contentsize]{extarticle}

% Packages
\RequirePackage[papersize={8.5in, 11in}, left=0.3in, right=0.3in, top=0.5in, bottom=0.5in]{geometry}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{enumitem}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{xifthen}
\RequirePackage{booktabs}
\RequirePackage{float}
\RequirePackage{lmodern}

% Setup
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\rfoot{\thepage/\pageref{LastPage}}
\linespread{0.5}
\setlength{\parindent}{0pt}
\renewcommand{\familydefault}{\sfdefault}
\newcommand{\cvbullet}{\boldmath\( \cdot \)}
\renewcommand\labelitemi{\cvbullet}
\setlist[itemize]{itemsep=-1pt, topsep=1pt}

% Header
\newcommand{\cvhline}[1]{\noindent\makebox[\linewidth]{\rule{\textwidth+0.5em}{#1}}}

\newcommand{\cvmakeheader}[5]{
    \begin{minipage}{.45\linewidth} \begin{flushleft}
        \begin{cvswitchfont}{\headernamesize} \textbf{#1} \end{cvswitchfont}
    \end{flushleft} \end{minipage}
    \hfill
    \begin{minipage}{.45\linewidth} \begin{flushright} \begin{cvswitchfont}{\headerinfosize}
        \hfill \href{mailto:#2}{\texttt{#2}} \( \vert \) \href{tel:#3}{\texttt{#3}} \newline
        \hfill \href{https://www.#4}{\texttt{#4}} \( \vert \) \href{https://www.#5}{\texttt{#5}}
    \end{cvswitchfont} \end{flushright} \end{minipage}

    \vspace{0.5em}
    \cvhline{0.8pt}
    \vspace{1em}
}

% Custom commands

\newenvironment{cvswitchfont}[1]{\fontsize{#1}{1pt}\fontsize{#1}{1pt}\selectfont}{}

\newenvironment{cvcontentsection}[2][]{%
    \textbf{\MakeUppercase{#2}} #1
    \newline \vspace{-2pt} \cvhline{0.05pt}
    ~\newline
}{
    \vspace{1.5em}
}

\NewDocumentEnvironment{cvjob}{smmmm}{%
    \textit{#2}, \textbf{#3} \textendash\ #4\hfill#5%
    \hspace{-0.5em}
    \vspace{\cvlisttopspace}\begin{itemize}[topsep=\cvlistbottomspace,itemsep=0.3mm,rightmargin=\leftmargin]
}{%
    \end{itemize}
    \IfBooleanT{#1}{\vspace{-\cvlistbottomspace}}
}

\newcommand{\cvdoilink}[1]{\href{https://doi.org/#1}{DOI: \texttt{#1}.}}

\NewDocumentCommand{\cvpublication}{smmm}{%
    \textbf{\textit{#2}}
    \newline \begin{cvswitchfont}{\publicationauthorsize} #3 \end{cvswitchfont}
    \vspace{\cvlisttopspace}\begin{itemize}[topsep=\cvlistbottomspace] \item #4 \end{itemize}
    \IfBooleanT{#1}{\vspace{-\cvlistbottomspace}}
}

\NewDocumentCommand{\cvtalk}{smmm}{%
    \textbf{\textit{#2}}\hfill#4
    \vspace{\cvlisttopspace}\begin{itemize}[topsep=\cvlistbottomspace] \item #3 \end{itemize}
    \IfBooleanT{#1}{\vspace{-\cvlistbottomspace}}
}

\NewDocumentCommand{\cvaward}{smm}{%
    #2
    \vspace{\cvlisttopspace}\begin{itemize}[topsep=\cvlistbottomspace] \item #3 \end{itemize}
    \IfBooleanT{#1}{\vspace{-\cvlistbottomspace}}
}

\NewDocumentCommand{\cvteaching}{sO{}mm}{%
    #3\hfill#4\ifthenelse{\isempty{#2}}{}{, #2}%
    \vspace{\cvlistbottomspace}
    \IfBooleanT{#1}{\vspace{-\cvlistbottomspace}}%
}

\NewDocumentCommand{\cvskill}{sm}{\IfBooleanF{#1}{&} \cvbullet~#2}
\NewDocumentEnvironment{cvskills}{m}{\begin{tabular}{#1}}{\end{tabular}}
