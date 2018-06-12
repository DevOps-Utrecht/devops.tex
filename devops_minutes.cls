% ---------------------------------------------------------------------------------
% devops_minutes.cls (originally sticky_minutes.cls)
%   LaTeX template for minutes for DevOps Utrecht.
%
%   (C) 2015 Laurens Duijvesteijn <l.duijvesteijn@gmail.com>
%
%   MIT licensed.
%
% ---------------------------------------------------------------------------------

%
% Identification
%
%   The next lines give this class its name, a version and the date of last
%   modification. It also restricts the input format to LaTex2e.
%
\ProvidesClass{devops_minutes}[2018/06/12 version 0.0.1]
\NeedsTeXFormat{LaTeX2e}

%
% Typography and options
%
%   This class depends on the typographical configuration as defined in the style
%   `devops_typography.cls`.
%
%   The next line reads the options given to the class. If a file is named
%   `<option>.members` is found, this file is loaded. This is intended for use as
%   `<committee_name>.members` to save the members of a certain committee for reuse.
%
%   After reading in the options, they are processed and the article class is loaded.
%   `\relax` is a no-op command, which is used in place where LaTeX expects a macro,
%   but none is required.
%

\DeclareOption*{\InputIfFileExists{\CurrentOption.leden}{}{%
  \PassOptionsToClass{\CurrentOption}{devops_typography}}}

\ProcessOptions \relax
\LoadClass{devops_typography}

\RequirePackage{xspace}

%
% Internationalization
%
%   In this section of the class, translations of the above strings are defined.
%
\RequirePackage{translations}

\DeclareTranslationFallback{str-head}
  {\vars@committee\xspace, minutes: \vars@date\xspace}
\DeclareTranslation{Dutch}{str-head}
  {Notulen \vars@committee\xspace: \vars@date\xspace}

\DeclareTranslationFallback{str-members}
  {Members\xspace}
\DeclareTranslation{Dutch}{str-members}
  {Leden\xspace}

\DeclareTranslationFallback{str-absent}
  {Absent\xspace}
\DeclareTranslation{Dutch}{str-absent}
  {Afwezig\xspace}

\DeclareTranslationFallback{str-guests}
  {Guests\xspace}
\DeclareTranslation{Dutch}{str-guests}
  {Gasten\xspace}

\DeclareTranslationFallback{str-notetaker}
  {Minutes taker\xspace}
\DeclareTranslation{Dutch}{str-notetaker}
  {Notulist\xspace}

\DeclareTranslationFallback{str-chair}
  {Chairperson\xspace}
\DeclareTranslation{Dutch}{str-chair}
  {Voorzitter\xspace}

\DeclareTranslationFallback{str-action}
  {Action\xspace}
\DeclareTranslation{Dutch}{str-action}
  {AP\xspace}

\DeclareTranslationFallback{str-actionlist}
  {Action items\xspace}
\DeclareTranslation{Dutch}{str-actionlist}
  {Overzicht actiepunten\xspace}

\DeclareTranslationFallback{str-location}
  {Location\xspace}
\DeclareTranslation{Dutch}{str-location}
  {Locatie\xspace}

%
% DeclareAuthorVariable interface
%
%   Here an abstraction is defined for the declaration of author variables. This
%   consists of the following commands:
%
%     \DeclareAuthorVariable*{}   - define a mandatory author variable.
%     \DeclareAuthorVariable{}    - define an optional author variable.
%
%   Credits:
%
%     tex.stackexchange.com user "egreg", https://tex.stackexchange.com/users/4427/egreg
%     from answer http://tex.stackexchange.com/a/93912
%
%   Content is originally from him/her and licensed under CC-BY-SA 3.0 until noted.

%% This branches between the normal and starred command.
\newcommand{\DeclareAuthorVariable}{%
  \@ifstar{\vars@DeclareAuthorVariable{\vars@mandatory@var}}
          {\vars@DeclareAuthorVariable{\vars@optional@var}}%
}

%% The main command; the internal version of \foo is \vars@foo. The macro \vars@foo
%% is initialized to give an error or an info message when used, so if the user
%% doesn't provide a value for a mandatory variable, we'll catch the issue.
\newcommand{\vars@DeclareAuthorVariable}[2]{%
  \@namedef{vars@#2}{#1{#2}}%
  \@namedef{#2}##1{\@namedef{vars@#2}{##1}\@namedef{vars@#2@defined}{}}%
}
%% The error and info messages
\newcommand{\vars@mandatory@var}[1]{%
  \ClassError{vars}
    {Missing value for mandatory variable
     \expandafter\string\csname#1\endcsname}
    {You have to provide a value with
     \expandafter\string\csname#1\endcsname{...}}%
}
\newcommand{\vars@optional@var}[1]{%
  \ClassInfo{vars}
    {Missing value for optional variable
     \expandafter\string\csname#1\endcsname}%
}

\newcommand{\@ifauthorvariable}[3]{\@ifundefined{vars@#1@defined}{#3}{#2}}
%   End of CC-BY-SA 3.0 unported code

%
% AuthorVariable declarations
%
%   This class exposes the following variables to authors for use in the template.
%   All variables, except for the date and the name of the committee, are optional.
%
%     \committee{}                 - The name of the committee
%     \members{}                   - The members of the committee
%     \date{}                      - Date of the meeting
%     \absent{}                    - Absentees
%     \guests{}                    - Guests
%     \notetaker{}                 - The notetaker of the minutes
%     \chair{}                     - The chair of the committee
%     \location{}                  - The location of the meeting
%
\DeclareAuthorVariable*{committee}
\DeclareAuthorVariable{members}
\DeclareAuthorVariable*{date}
\DeclareAuthorVariable{absent}
\DeclareAuthorVariable{guests}
\DeclareAuthorVariable{notetaker}
\DeclareAuthorVariable{chair}
\DeclareAuthorVariable{location}

%
% Page headers/footers
%
%   Here the actual formatting of the document is defined. The standard header and
%   footer are removed from the first page, and the next pages get standard ones.
%
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}

\fancypagestyle{pagestyle}{%
  \fancyhf{} % clear all six fields
  \fancyhead[L]{\carlito \textbf{\vars@committee{}} - \vars@date}
  \fancyhead[R]{\carlito \thepage{} / \pageref{LastPage}}
  \renewcommand{\headrulewidth}{0.7pt}
  \renewcommand{\footrulewidth}{0pt}
}
\pagestyle{pagestyle}

%
% Minutes metadata
%
%   `\metadata` prints a description list with the members of the committee, which
%   ones are absent, the guests and the minutestaker
%   by itself.
%
\newcommand{\metadata}{%
  \begin{description}
	\@ifauthorvariable{location}{
		\item[\GetTranslation{str-location}:] \vars@location
		}{}
	\@ifauthorvariable{members}{
		\item[\GetTranslation{str-members}:] \vars@members
		}{}
	\@ifauthorvariable{absent}{
		\item[\GetTranslation{str-absent}:] \vars@absent
		}{}
	\@ifauthorvariable{chair}{
		\item[\GetTranslation{str-chair}:] \vars@chair
		}{}
	\@ifauthorvariable{notetaker}{
		\item[\GetTranslation{str-notetaker}:] \vars@notetaker
		}{}
	\@ifauthorvariable{guests}{
		\item[\GetTranslation{str-guests}:] \vars@guests
		}{}
  \end{description}
}

%
% Minute header
%
%   The header of the minutes consists of the name of the committee that was in
%   assembly and the date. It also prints some horizontal rules and the previously
%   defined metadata.
%
\newcommand{\header}{%
  \begin{center}
    {\Large \GetTranslation{str-head}}
  \end{center}
  \noindent\rule{\textwidth}{0.3pt}
  \metadata
  \noindent\rule{\textwidth}{0.7pt}
}

%
% Action lists
%
%   Here, action items and lists get defined. When defining an action item use
%   `\action{name}{due}{item}` or the Dutch alias `\ap{naam}{deadline}{taak}`.
%
%   These will show up in the document and will get sorted per person with the
%   `\actionlist` command or it's Dutch alias `\aplijst`.
%
%   Credits:
%
%     tex.stackexchange.com user "Werner", https://tex.stackexchange.com/users/5764/werner
%     from answer http://tex.stackexchange.com/a/228548
%
%   Content is originally from him/her and licensed under CC-BY-SA 3.0 until noted.
%
\RequirePackage{multido}

\newcounter{personcntr}% Keep track of number of persons
\makeatletter
\newcommand{\action}[3]{% \action{<name>}{<time>}{<duty>}
  \@ifundefined{person@#1}{% If person doesn't exist
    \stepcounter{personcntr}% Next person
    \expandafter\xdef\csname person@#1\endcsname{1}% One time/duty
    \expandafter\xdef\csname person@bynumber@\thepersoncntr\endcsname{#1}% Number person

  }{% Person already exists
    \expandafter\xdef\csname person@#1\endcsname{%
      \number\numexpr\csname person@#1\endcsname+1}% Step number of time/duty
  }%
  \expandafter\xdef\csname person@#1@\csname person@#1\endcsname @time\endcsname{#2}% Store time
  \expandafter\xdef\csname person@#1@\csname person@#1\endcsname @duty\endcsname{#3}% Store duty
  \ignorespaces%
  \noindent\textbf{\GetTranslation{str-action} #1:} #3 \hfill \textit{#2}
}
\gdef\newpar{\par}% \multido doesn't enjoy \par

\newcommand\actionlist{% Print actions
  \def\descriptionBODY{}% Empty descriptionBODY
  {\let\item\relax% Prevent expansion of \item
   \let\newpar\relax% Prevent expansion of \newpar
    \multido{\iPerson=1+1}{\value{personcntr}}{% Step through all persons
      % Extract person name
      \expandafter\xdef\expandafter\thisperson\expandafter{\csname person@bynumber@\iPerson\endcsname}%
      \protected@xdef\descriptionBODY{%
        \descriptionBODY%
        \item[\thisperson] \leavevmode\newpar}% Add person name to descriptionBODY
      % Extract person number
      \expandafter\xdef\expandafter\thispersonnum\expandafter{\csname person@\thisperson\endcsname}%
      \multido{\iDuty=1+1}{\thispersonnum}{%
        \protected@xdef\descriptionBODY{%
          \descriptionBODY%
          \csname person@\thisperson @\iDuty @duty\endcsname% Add person duty to descriptionBODY
          \hfill
          {\bfseries\csname person@\thisperson @\iDuty @time\endcsname}% Add person time to descriptionBODY
          \newpar
        }%
      }%
    }%
  }%
  % Print person time/duty
  \section{\GetTranslation{str-actionlist}}% Give the list a title
  \begin{description}
    \descriptionBODY
  \end{description}
}
\makeatother

% End of CC-BY-SA 3.0 code

%
% Dutch aliases
%
\let\commissie\committee
\let\orgaan\committee
\let\leden\members
\let\afwezig\absent
\let\datum\date
\let\gasten\guests
\let\notulist\notetaker
\let\voorzitter\chair
\let\hoofd\header
\let\ap\action
\let\actiepunten\actionlist
\let\locatie\location

% vim: ft=tex
