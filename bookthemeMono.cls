\NeedsTeXFormat{LaTeX2e}[1994/12/01]
\ProvidesPackage{bookthemeMono}[2018/09/04]

%中文CTEX包，字号，行间距，页面尺寸 
\LoadClass[a4paper, zihao=-4, linespread=1.2, heading=true]{ctexbook} 

% 最小行间间距设定
\setlength{\lineskiplimit}{3pt} 
\setlength{\lineskip}{3pt}

\newcommand{\cyear}{2017}  %仿真更新项目的年份

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 设置中文字体
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% \setCJKfamilyfont{songti}{SimSun}  
% \setCJKfamilyfont{heiti}{SimHei}  
% \setCJKfamilyfont{kaishu}{KaiTi}  
% \setCJKfamilyfont{fangsong}{FangSong}
% \setCJKfamilyfont{wenquanyi}{WenQuanYi Micro Hei}

% \newcommand*{\songti}{\CJKfamily{songti}} % 宋体  
% \newcommand*{\heiti}{\CJKfamily{heiti}}   % 黑体  
% \newcommand*{\kaishu}{\CJKfamily{kaishu}}  % 楷书  
% \newcommand*{\fangsong}{\CJKfamily{fangsong}} % 仿宋  
% \newcommand*{\wenquanyi}{\CJKfamily{wenquanyi}}    % 文泉驿

\setCJKmainfont[BoldFont={Source Han Serif CN}]{Source Han Serif CN}
\xeCJKsetup{CJKmath=true}
\setCJKmathfont{KaiTi}  % 数学环境中使用楷体

% 颜色
\RequirePackage[table]{xcolor}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 页面尺寸设置
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage[top=2.8truecm,bottom=2.8truecm,
            left=2.5truecm,right=2.5truecm,
            %includehead,%includefoot,
           pdftex]{geometry}    % 页面设置%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 标题样式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\maketitle}{%
  \null \thispagestyle{empty}%
  % \vspace*{-2cm}
  \begin{center}\leavevmode 
    \vfill 
    { \heiti \zihao{1} \@title \par}%
    \vfill\vfill\vfill 
    \vspace{2.5cm} 
    {\songti \zihao{3} 深圳市规划和国土资源委员会（市海洋局）} \par\vspace{0.5em}
    {\songti \zihao{3} 深圳市规划国土发展研究中心} \par
    {\songti \zihao{3} \@date \par}%    
  \end{center}
  \null
  \newpage
  \thispagestyle{empty}
  \cleardoublepage
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 目录样式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\renewcommand{\CTEXthechapter}{\thechapter}
\RequirePackage{titlesec}

\setcounter{secnumdepth}{3} % 一直到subsubsection
\titlespacing{\chapter}{0pt}{0pt}{12pt} %章标题和后面的间隔
%\titlecontents*{subsection}[2.5em]{\small}{\thecontentslabel{} }{}{, \thecontentspage}[;\qquad][.]

%%% 章节装饰样式
\def\LV{\vrule height 2cm depth 0.5cm\hspace{0.1cm}}
\def\GrosCarreAvecUnChiffre#1{%
  \rlap{\vrule height 0.8cm width 1cm depth 0.2cm}%
  \rlap{\hbox to 1cm{\hss\mbox{#1}\hss}}%
  \vrule height 0pt width 1cm depth 0pt}
\newcommand{\chaformat}[1]{%          
\hbox{%
    \huge 
    \LV\LV\LV\LV\LV\LV\LV\LV\LV\LV
    \hspace{-0.5cm}%
    \GrosCarreAvecUnChiffre{\textcolor{white}{\thechapter}}
    \hspace{0.2cm}\hbox{#1}%
}}

\titleformat{\chapter}[block]{\LARGE\sffamily}{}{0pt}{\chaformat}
\titleformat*{\section}{\centering\Large\bfseries}
\titleformat{\subsubsection}[hang]{\bfseries\large}{\rule{1.5ex}{1.5ex}}{0.5em}{}
\ctexset{
    section/name = {\S}}   %标题前面加标记

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 页眉和页脚样式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{fancyhdr}
\fancyhf{}
\fancyhead[EC]{\textnormal{\kaishu\leftmark}}
\fancyhead[OC]{\textnormal{\kaishu\@title}}
\fancyhead[ER,OR]{--\ \thepage\ --}
\fancyfoot{}

\pagestyle{fancy}

%\renewcommand\chaptermark[1]{\markright{\CTEXifname{\CTEXthechapter~~~}{}#1}}
%\renewcommand\chaptermark[1]{\markboth{\CTEXifname{\CTEXthechapter~~~}{}#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 前言样式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand\frontmatter{%
    \cleardoublepage
  \@mainmatterfalse
  \thispagestyle{fancy} 
  \pagenumbering{Roman}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 目录页样式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{titletoc}   % 用于目录
\titlecontents{chapter}[0em]{\zihao{4}}{\contentslabel{1.5em}\qquad}
     {0pt}{\hfill\zihao{-4}\contentspage}
% \titlecontents{section}[2em]{\addvspace{0em}}{\contentslabel{1.8em}\hspace{1em}}
%      {\hspace*{-2.3em}}{\titlerule*[8pt]{$\cdot$}\contentspage}[\addvspace{0em}] %增加行间距
\titlecontents{section}[2em]{}{\contentslabel{1.8em}\hspace{1em}}
     {\hspace*{-2.3em}}{\titlerule*[8pt]{$\cdot$}\contentspage}
\titlecontents{subsection}[4em]{}{\contentslabel{1.8em}\hspace{1em}}
     {\hspace*{-2.3em}}{\titlerule*[8pt]{$\cdot$}\contentspage}

\renewcommand\contentsname{\ziju{1}目录}
\makeatletter
\newcommand{\tocformat}[1]{{\zihao{2}\bf#1}}
\renewcommand\tableofcontents{%
\thispagestyle{empty}%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi

\mbox{}\hfill{\tocformat{\contentsname}}\hfill\mbox{}

\vspace{20pt}
\@starttoc{toc}
\if@restonecol\twocolumn\fi}

\renewcommand\contentsname{\ziju{1}目录}
% \renewcommand{\tocformat}[1]{{\zihao{2}\bf#1}}
% \renewcommand\tableofcontents{%
% \thispagestyle{empty}%
%     \if@twocolumn
%       \@restonecoltrue\onecolumn
%     \else
%       \@restonecolfalse
%     \fi

% \hspace{-1em}\mbox{}\hfill{\tocformat{\contentsname}}\hfill\mbox{}

% \vspace{20pt}
% \@starttoc{toc}
% \if@restonecol\twocolumn\fi}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 章节样式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand\chapter{%\if@openright\cleardoublepage\else\clearpage\fi   %如果不想出现偶数页空白可以把\cleardoublepage改成\clearpage
                    \if@openright\clearpage\else\clearpage\fi
                    \thispagestyle{fancy}% 
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}

\RequirePackage{hyperref}       % hyperref 宏包通常要求放在导言区的最后!!!
\hypersetup{CJKbookmarks, %
            bookmarksopen,
            bookmarksnumbered,%
            bookmarksopenlevel=3,
            colorlinks,%
            linkcolor=blue,%
            citecolor=blue,%
            plainpages=false,%
            pdfstartview=FitV,  %FitH
            hyperfootnotes,
            pdfauthor={Zou Haixiang,P\&LRC,<zou.mono@gmail.com>}}



