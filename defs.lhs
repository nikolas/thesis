% -*- mode: LaTeX; compile-command: "mk" -*-

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Haskell typesetting

%include thesis.fmt

% Use 'arrayhs' mode, so code blocks will not be split across page breaks.
\arrayhs

\renewcommand{\Conid}[1]{\mathsf{#1}}

\newcommand{\mappend}{\diamond}
\newcommand{\mempty}{\varepsilon}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Package imports

\usepackage{amsmath}
\usepackage{amssymb}
%\usepackage{amsthm}
\usepackage[amsmath,amsthm,thmmarks]{ntheorem}
\usepackage{mathtools}
\usepackage{stmaryrd}
\usepackage[all,cmtip,2cell]{xy}
\UseAllTwocells
\usepackage{xcolor}
\usepackage{prettyref}
\usepackage{xspace}
\usepackage{url}
\usepackage{footmisc}
\usepackage{tikz}
\usetikzlibrary{shapes.geometric}

\usepackage[]{showkeys}

% \usepackage{breakurl}
\usepackage[numbers]{natbib}

\usepackage{graphicx}
\graphicspath{{images/}}
\usepackage[outputdir=diagrams,backend=cairo,extension=pdf]{diagrams-latex}

\usepackage[top=1in, bottom=1in, left=1.5in, right=1in,includefoot,paperwidth=8.5in,paperheight=11in]{geometry}
\usepackage{setspace}

% \usepackage{enumitem}

\usepackage[pdftex]{hyperref}
\hypersetup{
    pdftitle={\Title},
    pdfauthor={Brent Yorgey},
    bookmarksnumbered=true,
    bookmarksopen=true,
    bookmarksopenlevel=1,
    hidelinks,
    naturalnames=true,
    pdfstartview=Fit,
    pdfpagemode=UseOutlines,
    pdfpagelayout=TwoPageRight
}

\usepackage{doi}

\usepackage{fancyhdr}
\lfoot[\fancyplain{}{}]{\fancyplain{}{}}
\rfoot[\fancyplain{}{}]{\fancyplain{}{}}
\cfoot[\fancyplain{}{\footnotesize\thepage}]{\fancyplain{}{\footnotesize\thepage}}
\lhead[\fancyplain{}{}]{\fancyplain{}{}}
\rhead[\fancyplain{}{}]{\fancyplain{}{}}
\chead[\fancyplain{}{}]{\fancyplain{}{}}
\renewcommand{\headrulewidth}{0pt}
\setlength{\headheight}{15pt}

\newcommand{\signature}{~ \\ \underline{\hspace{20em}}}

\newenvironment{pagecentered}{%
\vspace*{\stretch{2}}%
\begin{center}%
\begin{minipage}{.8\textwidth}%
}{%
\end{minipage}%
\end{center}%
\vspace*{\stretch{3}}\clearpage}

\newcommand{\nochapter}[1]{%
  \refstepcounter{chapter}%
  \addcontentsline{toc}{chapter}{#1}%
  \markright{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage[utf8x]{inputenx}
\ifgreek
\usepackage[polutonikogreek,english]{babel}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Declarative formatting

\newcommand{\term}[1]{\emph{#1}}
\newcommand{\latin}[1]{\textit{#1}\xspace}
\newcommand{\foreign}[1]{\emph{#1}}

\newcommand{\ie}{\latin{i.e.}}
\newcommand{\eg}{\latin{e.g.}}
\newcommand{\etal}{\latin{et al.}}
\newcommand{\etc}{\latin{etc.}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Math typesetting

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% General math

\newcommand{\bbb}[1]{\ensuremath{\mathbb{#1}}}
\providecommand{\N}{\bbb{N}}
\providecommand{\Z}{\bbb{Z}}
\providecommand{\Q}{\bbb{Q}}
\providecommand{\R}{\bbb{R}}
\providecommand{\C}{\bbb{C}}

\newcommand{\all}[1]{\forall #1.\;}
\newcommand{\exist}[1]{\exists #1.\;}

\newcommand{\mcal}[1]{\ensuremath{\mathcal{#1}}}
\let\Sect\S
\renewcommand{\S}{\mcal S}
\renewcommand{\H}{\mcal H}
\newcommand{\I}{\mcal I}
\newcommand{\Sym}{\mcal S}

\newcommand{\msf}[1]{\ensuremath{\mathsf{#1}}\xspace}
\newcommand{\newmsf}[1]{%
\expandafter\providecommand\csname #1\endcsname{}\expandafter\renewcommand\csname #1\endcsname{\msf{#1}}}

\newcommand{\param}{\mathord{-}}

\newcommand{\comp}{\mathbin{\circ}}
\newcommand{\union}{\cup}
\newcommand{\Union}{\bigcup}
\newcommand{\intersect}{\cap}
\newcommand{\Intersect}{\bigcap}
\newcommand{\powerset}{\mcal P}
\newcommand{\singleton}{\{\star\}}

\newcommand{\partition}{\vdash}
\newcommand{\rectangle}{\multimap}

% problem: doesn't seem to adapt to different font sizes, even though
% we use em units??
%
% \newcommand{\rectangle}{\mathbin{%
% \begin{tikzpicture}%
% \draw (0,0) rectangle (1.618ex,1ex);%
% \end{tikzpicture}}%
% }

\newcommand{\floor}[1]{\left\lfloor #1 \right\rfloor}
\newcommand{\ceil}[1]{\left\lceil #1 \right\rceil}

\newcommand{\bij}{\stackrel{\sim}{\longrightarrow}}
\newcommand{\perm}[1]{#1!}
\newcommand{\iso}{\simeq}
\newcommand{\mkIso}{\rightleftharpoons}
\newcommand{\inj}{\hookrightarrow}

\newcommand{\quotient}[2]{#1 \mathbin{/} \mathord{#2}}

% axiom of choice
\newmsf{AC}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Theorems etc.

\newtheorem{thm}{Theorem}[section]
\newtheorem{prop}[thm]{Proposition}
\newtheorem{lem}[thm]{Lemma}
\newtheorem{cor}[thm]{Corollary}

\theoremstyle{definition}

\makeatletter
\newtheorem*{rep@@theorem}{\protect\rep@@title}
\newcommand{\newreptheorem}[2]{%
\newenvironment{rep#1}[1]{%
 \def\rep@@title{#2 \ref*{##1}}%
 \begin{rep@@theorem}}%
 {\end{rep@@theorem}}}
\makeatother

\newtheorem{defn}[thm]{Definition}
\newreptheorem{defn}{Definition}

\theoremstyle{remark}
\newtheorem*{rem}{Remark}
\newtheorem*{ex}{Example}
\newtheorem*{nota}{Notation}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Type theory

\newcommand{\universe}{\mcal{U}}
\newcommand{\defeq}{\mathrel{:\equiv}}
\newcommand{\dep}[1]{\prod_{#1}}
\newcommand{\fun}[1]{\lambda #1.\ }

\newcommand{\TyZero}{\ensuremath{\bot}\xspace}
\newcommand{\TyOne}{\ensuremath{\top}\xspace}
\newcommand{\unit}{\ensuremath{\star}\xspace}

\newcommand{\cons}[1]{\ensuremath{\mathsf{#1}}}

\providecommand{\False}{}
\renewcommand{\False}{\cons{F}}
\providecommand{\True}{}
\renewcommand{\True}{\cons{T}}

\newcommand{\zero}{\msf{O}}
\newcommand{\suc}[1]{\msf{S}\ #1}
\newcommand{\fzero}{\msf{FO}}
\newcommand{\fsuc}{\msf{FS}}

\newcommand{\lam}[2]{\lambda\,#1.\;#2}

\newcommand{\pair}[2]{\langle #1 , #2 \rangle}
\newcommand{\inl}{\cons{inl}}
\newcommand{\inr}{\cons{inr}}
\newcommand{\outl}{\cons{outl}}
\newcommand{\outr}{\cons{outr}}

\newcommand{\Type}{\ensuremath{\mathcal{U}}}
\newcommand{\FinType}{\ensuremath{\Type_{\text{Fin}}}}
\newcommand{\FinTypeT}{\ensuremath{\Type_{\ptrunc{\text{Fin}}}}}
\newcommand{\IsFinite}[1]{\mathsf{IsFinite}\;#1}
\newcommand{\sizesymb}{\#}
\newcommand{\size}[1]{\ensuremath{\sizesymb#1}}

\newcommand{\Fin}[1]{\ensuremath{\cons{Fin}\ #1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% HoTT

\newcommand{\ptrunc}[1]{\ensuremath{\left\||#1\right\||}}
\newcommand{\ptruncI}[1]{\ensuremath{\left||#1\right||}}
\newcommand{\id}{\cons{id}}

\newcommand{\tygrpd}[1]{\ensuremath{\mathcal{G}(#1)}}

\newcommand{\transport}[2]{\ensuremath{\mathsf{transport}^{#1}(#2)}}

\newmsf{ua}

\newcommand{\hott}[1]{\textit{h}-#1}

\newmsf{isSet}
\newmsf{isFinite}

\newmsf{hom}
\newmsf{Fun}
\newmsf{Ana}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Category theory

% typesetting for category names
\newcommand{\cat}[1]{\ensuremath{\mathbf{#1}}\xspace}

\newcommand{\op}{\ensuremath{\mathrm{op}}}            % opposite category
\newcommand{\disc}[1]{\ensuremath{\left||#1\right||}} % discrete category
\newcommand{\then}{\mathbin{;}}                       % flipped composition

% objects & morphisms
\DeclareMathOperator{\Ob}{Ob}
\newcommand{\mor}[2]{\ensuremath{#1 \longrightarrow #2}}
\newcommand{\nt}[2]{\ensuremath{#1 \stackrel{\bullet}{\longrightarrow} #2}}
\newcommand{\ntiso}[2]{\ensuremath{#1 \stackrel{\bullet}{\longleftrightarrow} #2}}

\newcommand{\Hom}[3][]{#2 \to_{#1} #3}

% some standard categories
\newcommand{\newcategory}[1]{%
\expandafter\providecommand\csname #1\endcsname{}\expandafter\renewcommand\csname #1\endcsname{\cat{#1}}}

\newcategory{Set}     % sets and total functions
\newcategory{FinSet}  % finite sets
\newcategory{Cat}     % (small) categories
\newcategory{Spe}     % species
\newcategory{CSpe}    % constructive species
\newcategory{Hask}    % Haskell types and functions
\newcategory{B}
\newcategory{P}

\providecommand{\L}{}
\renewcommand{\L}{\bbb{L}}     % category of linear orderings

\newcommand{\BT}{\mcal{B}}
\newcommand{\PT}{\mcal{P}}

\newcommand{\fin}[1]{\ensuremath{[#1]}}

% generic categories
\newcommand{\D}{\bbb{D}}
\newcommand{\E}{\bbb{E}}

% adjunctions
\newcommand{\adj}{\dashv}

% monoidal lifting
\newcommand{\lifted}[1]{\hat{#1}}
\newcommand{\lotimes}{\mathbin{\lifted{\otimes}}}

% products and coproducts
\newcommand{\choice}[2]{[#1, #2]}
\newcommand{\fork}[2]{\langle #1, #2 \rangle}

% ends and coends
\newcommand{\eend}[1]{\all{#1}}
\newcommand{\coend}[1]{\exist{#1}}

% Kan extensions
\newcommand{\ran}[2]{#2 / #1}
\newcommand{\lan}[2]{#2 \backslash #1}
\DeclareMathOperator{\Lan}{Lan}
\DeclareMathOperator{\Ran}{Ran}

% cliques
\DeclareMathOperator{\clq}{clq}

% groupoids
\newcommand{\core}[1]{#1^*}

% commutative diagrams
\newcommand{\pushout}[1][dr]{\save*!/#1+1.2pc/#1:(1,-1)@@^{||-}\restore}
\newcommand{\pullback}[1][dr]{\save*!/#1-1.2pc/#1:(-1,1)@@^{||-}\restore}

\newcommand{\Span}[5]{\xymatrix{#1 & #3 \ar[l]_{#2} \ar[r]^{#4} & #5}}
\newcommand{\BackForth}[4]{\xymatrix{#1 \ar@@<.5ex>[r]^{#2} & #4 \ar@@<.5ex>[l]^{#3}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Species

\renewcommand{\Sp}{\msf}
\newcommand{\X}{\Sp{X}}
\newcommand{\Y}{\Sp{Y}}
\newcommand{\F}{\Sp{F}}
\newcommand{\G}{\Sp{G}}
\newcommand{\List}{\Sp{L}}
\newcommand{\T}{\Sp{T}}
\newcommand{\Par}{\Sp{Par}}
\newcommand{\Bag}{\Sp{E}}
\newcommand{\Cyc}{\Sp{C}}
\newcommand{\Bin}{\Sp{B}}

\newcommand{\Zero}{\msf{0}}
\newcommand{\One}{\msf{1}}

\newcommand{\sprod}{\cdot}
\newcommand{\fcomp}{\mathbin{\square}}

\providecommand{\comp}{\circ}

\newcommand{\usum}{\boxplus}
\newcommand{\uprod}{\boxtimes}
\newcommand{\ucomp}{\boxcircle}

\newcommand{\unl}[1]{\widetilde{#1}}

\newcommand{\Lab}{\mathfrak{L}}
\newcommand{\Str}{\mathfrak{S}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Comments

\newif\ifcomments\commentstrue
\newif\ifallcomments\allcommentsfalse

\ifcomments
\newcommand{\authornote}[3]{\textcolor{#1}{[#3 ---#2]}}
\newcommand{\todo}[1]{\textcolor{red}{[TODO: #1]}}
\else
\newcommand{\authornote}[3]{}
\newcommand{\todo}[1]{}
\fi

\ifallcomments
\newcommand{\later}[1]{\textcolor{green}{[LATER: #1]}}
\else
\newcommand{\later}[1]{}
\fi

\newcommand{\bay}[1]{\authornote{blue}{BAY}{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Prettyref

\newrefformat{fig}{Figure~\ref{#1}}
\newrefformat{chap}{Chapter~\ref{#1}}
\newrefformat{sec}{\Sect\ref{#1}}
\newrefformat{eq}{equation~\eqref{#1}}
\newrefformat{prob}{Problem~\ref{#1}}
\newrefformat{tab}{Table~\ref{#1}}
\newrefformat{thm}{Theorem~\ref{#1}}
\newrefformat{lem}{Lemma~\ref{#1}}
\newrefformat{prop}{Proposition~\ref{#1}}
\newrefformat{defn}{Definition~\ref{#1}}
\newrefformat{cor}{Corollary~\ref{#1}}

% memoir defines pref and Pref as 'pageref'
\providecommand{\pref}{}
\renewcommand{\pref}[1]{\prettyref{#1}}

% \Pref is just like \pref but it uppercases the first letter; for use
% at the beginning of a sentence.
\providecommand{\Pref}{}
\renewcommand{\Pref}[1]{%
  \expandafter\ifx\csname r@@#1\endcsname\relax {\scriptsize[ref]}
    \else
    \edef\reftext{\prettyref{#1}}\expandafter\MakeUppercase\reftext
    \fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Proofs

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Structured proofs

\newenvironment{sproof}{%
    \begin{tabbing}
    \phantom{$\equiv$} \= \qquad\qquad\qquad\qquad\qquad \= \kill
}{
    \end{tabbing}
}
\newcommand{\stmt}[1]{\> \ensuremath{#1} \\}
\newcommand{\lstmt}[1]{\> \ensuremath{#1} }
\newcommand{\reason}[2]{\ensuremath{#1} \>\> \{ \quad #2 \quad \} \\}

\newcommand{\subpart}[1]{\llcorner #1 \lrcorner}
\newcommand{\suppart}[1]{\ulcorner #1 \urcorner}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% SDG qed symbol

\font\tinyfont=cmss10 scaled 375

% This is for the amsthm package
% \let\oldqedsymbol\qedsymbol
% \renewcommand{\qedsymbol}{\rlap\oldqedsymbol{}\raise
%   .5ex\hbox{\tinyfont \hskip .3em S\kern-.15em D\kern -.15em G}}

% Now I'm using the ntheorem package with amsthm option
\let\oldproofSymbol\proofSymbol
\renewcommand{\proofSymbol}{\rlap\oldproofSymbol{}\raise
  .5ex\hbox{\tinyfont \hskip .3em S\kern-.15em D\kern -.15em G}}
