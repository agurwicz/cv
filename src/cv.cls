% Font sizes
\newcommand{\contentsize}{8pt}
\newcommand{\headernamesize}{18pt}
\newcommand{\headerinfosize}{9pt}
\newcommand{\publicationauthorsize}{7.5pt}

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
    \noindent\makebox[\linewidth]{\rule{\textwidth+0.5em}{0.5pt}}
}

% Custom commands
\newenvironment{cvswitchfont}[1]{\fontsize{#1}{1pt}\fontsize{#1}{1pt}\selectfont}{}

\newcommand{\cvcontentsection}[2][]{%
    \vspace{-0.5pt}%
    \par \bigskip\textbf{\underline{\MakeUppercase{#2}}} #1%
    \vspace{4.5pt}%
}

\newcommand{\cvjob}[4]{%
    \vspace{6pt}%
    \textit{#1}, \textbf{#2} \textendash\ #3\hfill#4%
    \hspace{-0.5em} \vspace{3pt}%
}

\newcommand{\cvsubjob}[2]{%
    \vspace{3pt} \hspace{3pt}%
    \textbullet #1\ifthenelse{\isempty{#2}}{}{: #2.}%
    \vspace{3pt}%
}

\newcommand{\cvdoilink}[1]{\href{https://doi.org/#1}{DOI: \texttt{#1}.}}

\newcommand{\cvpublication}[3]{%
    \vspace{6pt}%
    \textbf{\textit{#1}} \newline%
    \begin{cvswitchfont}{\publicationauthorsize} #2 \end{cvswitchfont} \newline%
    \vspace*{-2.8pt} \begin{itemize}[leftmargin=*] \item #3 \end{itemize}%
    \vspace{1pt}%
}

\newcommand{\cvmember}[2]{%
    \vspace{5pt}%
    #1\hfill#2\hspace{-0.5em}%
    \vspace{3pt}%
}

\newcommand{\cvteaching}[3]{%
    \vspace{6pt}%
    #1.\hfill#2, #3%
    \hspace{-0.5em}\par%
}
