%% hgbthesis.cls
%% Autor: Wilhelm Burger (wilhelm.burger@fh-hagenberg.at)
%% Diese Datei ist Teil des hagenberg-Package zur Erstellung von 
%% Bachelor- und Diplomarbeiten.

\NeedsTeXFormat{LaTeX2e}
\newcommand{\hgbthesisDate}{2015/02/23} %Versionsdatum
\ProvidesClass{hgbthesis}[\hgbthesisDate\space LaTeX-Vorlage fuer Diplomarbeiten, Masterarbeiten, Bachelorarbeiten etc.]

\RequirePackage{ifthen}

\newcommand{\hgb@MainLanguage}{german}	% also referenced in hgb.sty
\newcommand{\@matitelseiten}{}
\newcommand{\@datitelseiten}{}
\newcommand{\@batitelseiten}{}
\newcommand{\@hsrtitelseiten}{}
\newcommand{\@prtitelseiten}{}
\newcommand{\@maketitlepages}{\@matitelseiten}  %default: Masterarbeit


%% begin class options ---------------------------------------------
\DeclareOption{master}{\renewcommand{\@maketitlepages}{\@matitelseiten}}
\DeclareOption{diplom}{\renewcommand{\@maketitlepages}{\@datitelseiten}}
\DeclareOption{bachelor}{\renewcommand{\@maketitlepages}{\@batitelseiten}}
\DeclareOption{hsr-ba}{\renewcommand{\@maketitlepages}{\@hsrtitelseiten}}
\DeclareOption{praktikum}{\renewcommand{\@maketitlepages}{\@prtitelseiten}}
\DeclareOption{english}{\renewcommand{\hgb@MainLanguage}{english}}
\DeclareOption{german}{\renewcommand{\hgb@MainLanguage}{german}}
\DeclareOption*{\ClassWarning{hgbthesis}{Unknown document option "\CurrentOption"}}
\ProcessOptions
%% end class options ---------------------------------------------
 
\LoadClass[a4paper,11pt,oneside]{book}
 
\RequirePackage{hgb}	% load associated style file hgb.sty


%-------------- Setup für Seiten im Front-Teil --------------------

\newcommand{\@studiengang}{\@MissingArg{Studiengang??}}
\newcommand{\studiengang}[1]{%
	\renewcommand{\@studiengang}{#1}
}

\newcommand{\@subtitle}{\@MissingArg{Subtitle??}}
\newcommand{\subtitle}[1]{%
	\renewcommand{\@subtitle}{#1}
}

\newcommand{\@studienort}{\@MissingArg{Studienort??}}
\newcommand{\studienort}[1]{%
	\renewcommand{\@studienort}{#1}
}

\newcommand{\@betreuerBez}{????}
\newcommand{\@betreuerName}{\@MissingArg{Betreuer??}}

\newcommand{\betreuer}[1]{%
  \renewcommand{\@betreuerBez}{Betreuer}
	\renewcommand{\@betreuerName}{#1}
}
\newcommand{\betreuerin}[1]{%
  \renewcommand{\@betreuerBez}{Betreuerin}
	\renewcommand{\@betreuerName}{#1}
}

\newcommand{\@nummer}{\@MissingArg{Arbeit Nummer??}}
\newcommand{\nummer}[1]{%
	\renewcommand{\@nummer}{#1}
}

\newcommand{\@gegenstand}{\@MissingArg{Gegenstand??}}
\newcommand{\gegenstand}[1]{%
	\renewcommand{\@gegenstand}{#1}
}

\newcommand{\@semester}{\@MissingArg{Semester??}}
\newcommand{\semester}[1]{%
	\renewcommand{\@semester}{#1}
}

%% -------------------------------------------------

\newcounter{@abgabetag}
\newcounter{@abgabemonat}
\newcounter{@abgabejahr}

\setcounter{@abgabetag}{\the\day}
\setcounter{@abgabemonat}{\the\month}
\setcounter{@abgabejahr}{\the\year}

\newcommand{\abgabedatum}[3]{%	%\abgabedatum{yyyy}{mm}{dd}
	\setcounter{@abgabejahr}{#1}
	\setcounter{@abgabemonat}{#2}
	\setcounter{@abgabetag}{#3}
}

\newcommand{\abgabemonat}[1]{%
	\ClassWarning{hgbthesis}{\noexpand\abgabemonat is deprecated - 
	use \noexpand\abgabedatum instead!}
}

\newcommand{\abgabejahr}[1]{%
	\ClassWarning{hgbthesis}{\noexpand\abgabejahr is deprecated - 
	use \noexpand\abgabedatum instead!}
}

%% ----------------------------------------------------------

\newcommand{\@firma}{\@MissingArg{Firma??}}
\newcommand{\firma}[1]{%
\renewcommand{\@firma}{#1}
}

\newcommand{\@firmenUrl}{\@MissingArg{www.???}}
\newcommand{\firmenUrl}[1]{%
\renewcommand{\@firmenUrl}{#1}
}

\newcommand{\@firmenTel}{\@MissingArg{Tel??}}
\newcommand{\firmenTel}[1]{%
\renewcommand{\@firmenTel}{#1}
}

\newcommand{\@license}{\@MissingArg{Lizenztext??}}
\newcommand{\license}[1]{%
\renewcommand{\@license}{#1}
}


%------------------ Titelseiten -------------------

%% deprecated - use \maketitle instead!
\newcommand{\titelseite}{ 
  \ClassWarning{hgbthesis}{\noexpand\titelseite is deprecated - use \noexpand\maketitle instead}
  \maketitle
} 

\newcommand{\@batitel}{%
\begin{titlepage}%
\rule{0mm}{1mm}
\vspace*{20mm}
%\noindent Left side \hfill right side\\
\begin{center}%
  \setlength{\unitlength}{1cm}
  \begin{picture}(12,4)
  %\thinlines\put(0,0){\framebox(12,4){}}
  \put(0,1.8){\parbox{12cm}{\centering\LARGE\bf%
    \setlength{\baselineskip}{20pt}%
    \@title}}
  \end{picture}
    \vskip 10mm%
    {\large\sc\@author}
    \vskip 40mm%
    {\Large B\,A\,C\,H\,E\,L\,O\,R\,A\,R\,B\,E\,I\,T}%
    \vskip 8mm%
    {\large\sf Nr.~\@nummer}
    \vskip 8mm%
    {\large eingereicht am} \vskip 1mm {Fachhochschul-Bachelorstudiengang}%
    \vskip 4mm%
    {\large\sc\@studiengang}%
    \vskip 4mm%
    {\large in \@studienort}%
    \vskip 16mm%
    {\large im \monthname[\value{@abgabemonat}] \arabic{@abgabejahr}}%
\end{center}\par
  \vfil\null
\end{titlepage}%
}

\newcommand{\@satitel}{%
\begin{titlepage}%
\rule{0mm}{1mm}
\vspace*{20mm}
%\noindent Left side \hfill right side\\
\begin{center}%
  \setlength{\unitlength}{1cm}
  \begin{picture}(12,2)
  %\thinlines\put(0,0){\framebox(12,4){}}
    \put(0,1.8){\parbox{12cm}{\centering\Huge\bf%
    \setlength{\baselineskip}{20pt}%
    \@title}}
  \end{picture}
  \begin{picture}(12,2)
    \put(0,1.8){\parbox{12cm}{\centering\large\bf%
    \setlength{\baselineskip}{20pt}%
    \@subtitle}}
  \end{picture}  
  
  
    \vskip 0mm%
    {\large\sc\@author}
    \vskip 25mm%
    {\Large B\,A\,C\,H\,E\,L\,O\,R\, \,T\,H\,E\,S\,I\,S}
    % S\,E\,M\,E\,S\,T\,E\,R\, \,T\,H\,E\,S\,I\,S
    %  B\,A\,C\,H\,E\,L\,O\,R\,A\,R\,B\,E\,I\,T
    \vskip 8mm%
    %{\large eingereicht am} \vskip 1mm {Fachhochschul-Bachelorstudiengang}%
    University of Applied Sciences of Eastern Switzerland (HSR FHO)
    \vskip 4mm%
    {\large Department of \sc\@studiengang}%
    \vskip 4mm%
    {\large in \@studienort}%
    \vskip 16mm%
    {\large Advised by Prof. Dr.  Olaf Zimmermann}%
    \vskip 2mm%
    {\large Co-Examined Internally by Prof. Dr. Andreas Rinkel}%
    \vskip 2mm%
    {\large Co-Examined Externally by Dr. Gerald Reif}%
    \vskip 2mm%
    {\large Supported by Zühlke Engineering AG}%
    \vskip 2mm%
    {\large \monthname[\value{@abgabemonat}] \arabic{@abgabejahr}} (v1.0.1)%
\end{center}\par
  \vfil\null
\end{titlepage}%
}

\newcommand{\@matitel}{%
\begin{titlepage}%
\begin{german}
\rule{0mm}{1mm}
\vspace*{20mm}
%\noindent Left side \hfill right side\\
\begin{center}%
  \setlength{\unitlength}{1cm}
  \begin{picture}(12,4)
  %\thinlines\put(0,0){\framebox(12,4){}}
  \put(0,1.8){\parbox{12cm}{\centering\LARGE\bf%
    \setlength{\baselineskip}{20pt}%
    \@title}}
  \end{picture}
    \vskip 10mm%
    {\large\sc\@author}
    \vskip 40mm%
    {\Large M\,A\,S\,T\,E\,R\,A\,R\,B\,E\,I\,T}%
    \vskip 20mm%
    {\large eingereicht am} \vskip 1mm {Fachhochschul-Masterstudiengang}%
    \vskip 4mm%
    {\large\sc\@studiengang}%
    \vskip 4mm%
    {\large in \@studienort}%
    \vskip 16mm%
    {\large im \monthname[\value{@abgabemonat}] \arabic{@abgabejahr}}%
%   {\large im \@abgabemonat\ \@abgabejahr}%
\end{center}\par
  \vfil\null
\end{german}
\end{titlepage}%
}

\newcommand{\@datitel}{%
\begin{titlepage}%
\rule{0mm}{1mm}
\vspace*{20mm}
%\noindent Left side \hfill right side\\
\begin{center}%
  \setlength{\unitlength}{1cm}
  \begin{picture}(12,4)
  %\thinlines\put(0,0){\framebox(12,4){}}
  \put(0,1.8){\parbox{12cm}{\centering\LARGE\bf%
    \setlength{\baselineskip}{20pt}%
    \@title}}
  \end{picture}
    \vskip 10mm%
    {\large\sc\@author}
    \vskip 40mm%
    {\Large D\,I\,P\,L\,O\,M\,A\,R\,B\,E\,I\,T}%
    \vskip 20mm%
    {\large eingereicht am} \vskip 1mm {Fachhochschul-Masterstudiengang}%
    \vskip 4mm%
    {\large\sc\@studiengang}%
    \vskip 4mm%
    {\large in \@studienort}%
    \vskip 16mm%
    {\large im \monthname[\value{@abgabemonat}] \arabic{@abgabejahr}}%
\end{center}\par
  \vfil\null
\end{titlepage}%
}

\newcommand{\@prtitel}{%
\begin{titlepage}%
\rule{0mm}{1mm}
\vspace*{20mm}
%\noindent Left side \hfill right side\\
\begin{center}%
  \setlength{\unitlength}{1cm}
  \begin{picture}(12,4)
  %\thinlines\put(0,0){\framebox(12,4){}}
  \put(0,1.8){\parbox{12cm}{\centering\LARGE\bf%
    \setlength{\baselineskip}{20pt}%
    Endbericht zum Berufspraktikum}}
  \end{picture}
    \vskip 10mm%
    {\large\sc\@author}
    \vskip 40mm%
    {\Large B\,A\,C\,H\,E\,L\,O\,R\,A\,R\,B\,E\,I\,T}%
    \vskip 8mm%
    {\large\sf Nr.~\@nummer}
    \vskip 8mm%
    {\large eingereicht am} \vskip 1mm {Fachhochschul-Bachelorstudiengang}%
    \vskip 4mm%
    {\large\sc\@studiengang}%
    \vskip 4mm%
    {\large in \@studienort}%
    \vskip 16mm%
    {\large im \monthname[\value{@abgabemonat}] \arabic{@abgabejahr}}%
\end{center}\par
  \vfil\null
\end{titlepage}%
}

%------------------ Copyright-Seite -------------------

\newcommand{\strictlicense}{%
\ifthenelse{\equal{\hgb@MainLanguage}{german}}%
	{\license{Alle Rechte vorbehalten}}%
	{\license{All Rights Reserved}}
}

\newcommand{\@ccLicenseAt}{%
Diese Arbeit wird unter den Bedingungen der \textsl{Creative Commons Lizenz} 
\emph{Namens\-nennung--NichtKommerziell--Keine\-Bearbeitung Österreich} 
(CC BY-NC-ND) veröffentlicht --
siehe \url{http://creativecommons.org/licenses/by-nc-nd/3.0/at/}.}

\newcommand{\@ccLicenseEn}{%
This work is published under the conditions of the 
\textsl{Creative Commons License Attribution--Non\-Commercial--No\-Derivatives} 
(CC BY-NC-ND)---see
\url{http://creativecommons.org/licenses/by-nc-nd/3.0/}.}

\newcommand{\cclicense}{%
\ifthenelse{\equal{\hgb@MainLanguage}{german}}%
{\license{\@ccLicenseAt}} % german CC license text
{\license{\@ccLicenseEn}} % english CC license text (default)
}
	
%\strictlicense
\cclicense	% Creative Commons License (default)

\newcommand{\@makelicense}{ 
  \sbox\@tempboxa{\@license}%
  \ifdim \wd\@tempboxa >\hsize
    \begin{sloppypar}\noindent\@license\end{sloppypar}
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
} 

\newcommand{\@copyrightseite}{%
\newpage
\setcounter{page}{2}
\thispagestyle{plain}
\rule{0mm}{1mm}
\vspace*{75mm}
\begin{center}
\copyright\ Copyright\ \arabic{@abgabejahr}\ \@author
\end{center}
\vspace{8mm}
\@makelicense
%\begin{center}
%\includegraphics[width=2.0cm]{images/by-nc-nd-eu}
%\end{center}
}

%------------------ Firmen-Seite -------------------
\newcommand{\@firmenseite}{%
\newpage
\setcounter{page}{2}
\thispagestyle{plain}
\rule{0mm}{1mm}
\begin{center}
\vspace{25mm} 
{Praktikumsstelle:}
\\
\vspace{3mm}
{\Large\sf\@firma\\ \mbox{}}
\\
{\sf \@firmenTel}
\\
{\sf \@firmenUrl}
\\
\vspace{45mm} 
{Kontaktperson:}
\\
\vspace{3mm} 
{\Large\sf\@betreuerName\\ \mbox{}}
\end{center}
}

%------------------ Betreuer-Seite -------------------

\newcommand{\@babetreuerseite}{%
\newpage
\setcounter{page}{2}
\thispagestyle{plain}
\rule{0mm}{1mm}
\begin{center}
%
\vspace{40mm} 
{Diese Arbeit entstand im Rahmen des Gegenstands}\\
\vspace{6mm} 
{\Large\sf \@gegenstand\\ \mbox{}}\\
\medskip
im\\
\bigskip
{\@semester}\\
%
\vspace{45mm} 
%{Betreuer:}\\
{\@betreuerBez:}\\
\vspace{3mm} 
{\Large\sf \@betreuerName\\ \mbox{}}
\end{center}
}

%% -------------- Erklärung / Declaration ---------

\newcommand{\@erklaerungsseiteDe}{%
\begin{german}
\chapter{Erklärung}
\noindent
%Standardfassung der FH-OÖ ab 04.04.2012:
Ich erkläre eidesstattlich, dass ich die vorliegende Arbeit selbstständig und ohne fremde Hilfe verfasst, 
andere als die angegebenen Quellen nicht benutzt und die den benutzten Quellen entnommenen Stellen als 
solche gekennzeichnet habe. Die Arbeit wurde bisher in gleicher oder ähnlicher Form keiner anderen 
Prüfungsbehörde vorgelegt.
\par
\vspace{10mm}
\noindent
\@studienort, am \formatdate{\value{@abgabetag}}{\value{@abgabemonat}}{\value{@abgabejahr}}
\par
\vspace{12mm}
\noindent
\@author
\end{german}
}

\newcommand{\leadingzero}[1]{\ifnum #1<10 0\the#1\else\the#1\fi}

\newcommand{\@erklaerungsseiteEn}{%
\begin{english}
\chapter{Declaration}
\noindent
We hereby declare 
\begin{itemize}
\item that this bachelor thesis and the work presented in it is our own, original work.
\item that all sources we consulted and cited are clearly attributed. We have acknowledged
all main sources of help. 
\item that no copyright secured material has been used by unfair means. 
\end{itemize}

\par
\vspace{10mm}
\noindent
%\@studienort, \the\year-\leadingzero{\month}-\leadingzero{\day} %http://de.wikibooks.org/wiki/LaTeX-W%F6rterbuch:_today 
\@studienort, {\usdate\formatdate{\value{@abgabetag}}{\value{@abgabemonat}}{\value{@abgabejahr}}}
\par
\vspace{8mm}
\noindent
Lukas Kölbener \hspace{20ex} Michael Gysel 
\end{english}
}

\newcommand{\@erklaerungsseite}{%
\ifthenelse{\equal{\hgb@MainLanguage}{german}}%
	{\@erklaerungsseiteDe}%
	{\@erklaerungsseiteEn}
}


%------------ Struktur der Frontseiten -------------------

\renewcommand{\@matitelseiten}{
\@matitel
\@copyrightseite
\@erklaerungsseite
}
     
\renewcommand{\@datitelseiten}{
\@datitel
\@copyrightseite
\@erklaerungsseite
}

\renewcommand{\@batitelseiten}{
\@batitel
\@babetreuerseite
\@erklaerungsseite
}

\renewcommand{\@hsrtitelseiten}{
\@satitel
%\@babetreuerseite
\@erklaerungsseite
}

\renewcommand{\@prtitelseiten}{
\@prtitel
\@firmenseite
\@erklaerungsseite
}

%------------ Automatischer Eintrag der PDF Metadaten ------------

\renewcommand{\maketitle}{	%replace standard LaTeX-command
\hypersetup{
		pdftitle={\@title},
		pdfauthor={\@author},
		pdfsubject={\@studiengang, \@studienort},
		pdfcreator={LaTeX},
		pdfproducer={},
		pdfkeywords={}
}%
\@maketitlepages
}

%%-------------------------------------------------------------

\usepackage{hgbheadings}
\usepackage{hgbbib}

%%-------------------------------------------------------------

\endinput

