% ---------------------------------------------------------------------------------
% devops_typography.cls (originally sticky_typography.cls)
%   LaTeX template for typography of DevOps Utrecht.
%
%   (C) 2015 Laurens Duijvesteijn <l.duijvesteijn@gmail.com>
%
%   MIT Licensed.
%
% ---------------------------------------------------------------------------------

%
% Identification
%
%   The next lines give this class its name, a version and the date of last
%   modification. It also restricts the input format to LaTex2e.
%
\ProvidesClass{devops_typography}[2018/06/12 version 0.0.1]
\NeedsTeXFormat{LaTeX2e}

%
% Options
%
%   The next line reads the options given to the class. If a file is named
%   `<option>.members` is found, this file is loaded. This is intended for use as
%   `<committee_name>.members` to save the members of a certain committee for reuse.
%
%   After reading in the options, they are processed and the article class is loaded.
%   `\relax` is a no-op command, which is used in place where LaTeX expects a macro,
%   but none is required.
%
\DeclareOption*{\InputIfFileExists{\CurrentOption.type}{}{%
  \PassOptionsToClass{\CurrentOption}{article}}}

\ProcessOptions\relax
\LoadClass{article}
%
% Typographical adjustments
%
%   This section sets bitsteam charter as the default font for paragraphs and TeX
%   Gyre Heros as the heading font.
%
\RequirePackage[bitstream-charter]{mathdesign}
\RequirePackage{carlito}
\RequirePackage{titlesec}
\RequirePackage[T1]{fontenc}
\RequirePackage{sourcecodepro}

% Set the font of a \section to TeX Gyre Heros. 'b' is for bold.
\titleformat{\section}
  {\carlito{}\bfseries{}}
  {}
  {0em}
  {\hspace{-0.4pt}\Large \thesection\hspace{0.6em}}
  
\titleformat{\subsection}
  {\carlito{}\bfseries{}}
  {}
  {0em}
  {\hspace{-0.4pt}\large \thesubsection\hspace{0.6em}}

\titleformat{\subsubsection}
  {\carlito{}\bfseries{}}
  {}
  {0em}
  {\hspace{-0.4pt}\Large \thesubsubsection\hspace{0.6em}}


% Set a parskip instead of indenting paragraphs.
\setlength{\parindent}{0pt}
\setlength{\parskip}{.25pt}

% Provide macro's for writing names that we'll need more often.
\RequirePackage{xspace}

\newcommand{\devops}{\texttt{DevOps}\xspace}
\newcommand{\sticky}{\textit{\mbox{Studievereniging} \mbox{Sticky}}\xspace}
\newcommand{\DEVOPS}{\textbf{D}ispuut \textbf{E}xclusief \textbf{V}oor \textbf{O}pgetogen \textbf{P}rogrammerende \textbf{S}ticky-ers\xspace}

% vim: ft=tex