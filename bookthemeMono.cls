\NeedsTeXFormat{LaTeX2e}[1994/12/01]
\ProvidesPackage{bookthemeMono}[2018/09/04]

%\RequirePackage[T1]{fontenc}
%中文CTEX包，字号，行间距，页面尺寸 
\LoadClass[a4paper, zihao=-4, linespread=1.5, heading=true]{ctexbook} 

\RequirePackage{bbding}
\RequirePackage{afterpage}
% 最小行间间距设定
\setlength{\lineskiplimit}{3pt} 
\setlength{\lineskip}{3pt}

\newcommand{\cyear}{2018}  %仿真更新项目的当前年份
\newcommand{\pyear}{2017}  %仿真更新项目的上一个年份
\newcommand{\ppyear}{2016}  %仿真更新项目的上上一个年份
%\newcommand{\wyear}{2018}  %仿真更新项目作业年份

\renewcommand\contentsname{\ziju{1}目录}
\renewcommand\listfigurename{插图目录}
\renewcommand\listtablename{表格目录}

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

% \setmainfont{SourceHanSerifCN}[
% Path=/home/mono/.fonts/,
% UprightFont=*-Regular,
% BoldFont=*-Bold,
% Extension=.otf
% ]

%\xeCJKsetup{AutoFakeSlant=true} %允许用斜体
\setCJKmainfont[BoldFont=黑体,ItalicFont=楷体]{宋体} %不允许用斜体，斜体用楷体代替
%\setCJKmainfont[BoldFont=黑体]{宋体}
\setCJKsansfont{黑体}
\setCJKmonofont{仿宋}%中文等宽字体
\xeCJKsetup{CJKmath=true}
\setCJKmathfont{KaiTi}  % 数学环境中使用楷体
\newCJKfontfamily[zhxinwei]\xinwei{STXinwei} % 定义新字体

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
%\titleformat{\subsubsection}[hang]{\bfseries\large}{\rule{1.5ex}{1.5ex}}{0.5em}{}
\ctexset{
    chapter/name = {第,章},
    chapter/number = \arabic{chapter},
    section/name = {\S}}   %标题前面加标记

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 页眉和页脚样式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{fancyhdr}
\usepackage{perpage} %页脚每页重新从1开始编号
\MakePerPage{footnote}
\usepackage{tablefootnote} %表格内部的页脚引用

\fancypagestyle{mainhdr}{
    \fancyhf{}
    \fancyhead[EC]{\textnormal{\kaishu\leftmark}}
    \fancyhead[OC]{\textnormal{\kaishu\@title}}
    \fancyhead[EL,OR]{--\ \thepage\ --}
    \fancyfoot[F]{\kaishu}}

\fancypagestyle{tochdr}{
    \fancyhf{}
    \fancyhead[EC]{\textnormal{\kaishu\contentsname}}
    \fancyhead[OC]{\textnormal{\kaishu\@title}}
    \fancyhead[EL,OR]{--\ \thepage\ --}}
    % \fancyfoot{}}

\fancypagestyle{lofhdr}{
    \fancyhf{}
    \fancyhead[EC]{\textnormal{\kaishu\listfigurename}}
    \fancyhead[OC]{\textnormal{\kaishu\@title}}
    \fancyhead[EL,OR]{--\ \thepage\ --}}
    % \fancyfoot{}}

\fancypagestyle{lothdr}{
    \fancyhf{}
    \fancyhead[EC]{\textnormal{\kaishu\listtablename}}
    \fancyhead[OC]{\textnormal{\kaishu\@title}}
    \fancyhead[EL,OR]{--\ \thepage\ --}}
    % \fancyfoot{}}

\pagestyle{mainhdr}

% \newcommand{\clearemptydoublepage}{% 
% \clearpage {\pagestyle{empty}
% \origdoublepage}}

%\pagestyle{fancy}

%\renewcommand\chaptermark[1]{\markright{\CTEXifname{\CTEXthechapter~~~}{}#1}}
%\renewcommand\chaptermark[1]{\markboth{\CTEXifname{\CTEXthechapter~~~}{}#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 前言样式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand\frontmatter{%
    \cleardoublepage
  \@mainmatterfalse
  %\thispagestyle{empty} 
  \pagenumbering{Roman}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 目录页样式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{titletoc}   % 用于目录
\titlecontents{chapter}[0em]{\zihao{4}}{\contentslabel{1.5em}\qquad}
     {\hspace*{-1.5em}}{\hfill\zihao{-4}\contentspage}
% \titlecontents{section}[2em]{\addvspace{0em}}{\contentslabel{1.8em}\hspace{1em}}
%      {\hspace*{-2.3em}}{\titlerule*[8pt]{$\cdot$}\contentspage}[\addvspace{0em}] %增加行间距
\titlecontents{section}[2em]{}{\contentslabel{1.8em}\hspace{1em}}
     {\hspace*{-2.3em}}{\titlerule*[8pt]{$\cdot$}\contentspage}
\titlecontents{subsection}[4em]{}{\contentslabel{1.8em}\hspace{1em}}
     {\hspace*{-2.3em}}{\titlerule*[8pt]{$\cdot$}\contentspage}

\newcommand{\tocformat}[1]{{\zihao{2}\bf#1}}
\renewcommand\tableofcontents{%
\if@openright\cleardoublepage\else\clearpage\fi 
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
\vspace*{12pt}
\section*{\tocformat{\contentsname}
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}
%\mbox{}\hfill{\tocformat{\contentsname}}\hfill\mbox{}
%\vspace{1pc}
\@starttoc{toc}
\if@restonecol\twocolumn\fi
\thispagestyle{tochdr}}

\renewcommand\listoffigures{%
\if@openright\cleardoublepage\else\clearpage\fi 
\vspace*{12pt}
\section*{\tocformat{\listfigurename}
        \@mkboth{%
           \MakeUppercase\listfigurename}{\MakeUppercase\listfigurename}}
%\mbox{}\hfill{\tocformat{\listfigurename}}\hfill\mbox{}
%\vspace{1pc}
\@starttoc{lof}
\thispagestyle{lofhdr}}

\renewcommand\listoftables{%
\if@openright\cleardoublepage\else\clearpage\fi 
\vspace*{12pt}
\section*{\tocformat{\listtablename}
        \@mkboth{%
           \MakeUppercase\listtablename}{\MakeUppercase\listtablename}}
%\vspace{1pc}
\@starttoc{lot}
\thispagestyle{lothdr}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 章节样式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand\chapter{%\if@openright\cleardoublepage\else\clearpage\fi   %如果不想出现偶数页空白可以把\cleardoublepage改成\clearpage
                    \if@openright\clearpage\else\clearpage\fi
                    \thispagestyle{mainhdr}% 
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 正文样式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% \renewcommand\mainmatter{%
%   \cleardoublepage
%   \@mainmattertrue
%   \thispagestyle{mainhdr} 
%   \pagenumbering{arabic}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 自定义环境
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[inline]{enumitem}
%\RequirePackage{paralist}
    \setlist[enumerate]{itemsep=0pt} %font是设置label的字体，不是所有文字
    %\setlist[itemize]{} %,
    \setlist[description]{font=\bfseries\uline}

\newenvironment{neae}{
    \begin{enumerate}[font=\bfseries,parsep=0pt,topsep=0pt,partopsep=0pt]}
    {\end{enumerate}} %数字enumerate
\newenvironment{para}{
    \begin{description}[itemsep=0pt,parsep=0pt,topsep=0pt,partopsep=0pt]}
    {\end{description}}
\newenvironment{feai}{
    \begin{itemize}[font=\bfseries,itemsep=0pt,topsep=0pt,partopsep=0pt,itemindent=2\ccwd,leftmargin=0pt]} %
    {\end{itemize}} %item文字缩进，换行后对齐左边线，配合indenttext使用
\newenvironment{cit}{
    \begin{itemize}[font=\bfseries,label=\PencilRight,itemsep=0pt,parsep=0pt,topsep=0pt,partopsep=0pt]} %
    {\end{itemize}} %自定义itemize
\newenvironment{nbeae}{
    \begin{enumerate}[wide=0pt,nosep,label=(\arabic*),itemsep=0pt,itemindent=2.5\ccwd, parsep=0pt,topsep=0pt,partopsep=0pt]}
    {\end{enumerate}} %带括号的数字enumerate,例如(1),(2)
\newenvironment{inlinee}
{\begin{enumerate*}[label=(\arabic*), font=\rmfamily, before=\unskip{：},itemjoin={{；}},itemjoin*={{，以及：}}]}
    {\end{enumerate*}。}


\newcommand{\smalltitle}[1]{{\noindent{\textbullet~\bfseries{#1}}}\par} %不缩进的标题行,label和左边线对齐
\newcommand{\indenttext}[1]{\setlength{\parindent}{2\ccwd}{\indent #1}\setlength{\parindent}{0pt}} %整块文字首行缩进

\newcommand{\qd}[1]{{\bfseries{#1}}}  % 强调
\newcommand{\charef}[1]{第\ref{#1}章}
\newcommand{\secref}[1]{第\ref{#1}节}
\newcommand{\pref}[1]{第\pageref{#1}页}
\newcommand{\fref}[1]{图\ref{#1}}
\newcommand{\tref}[1]{表\ref{#1}}

\RequirePackage[enhanced,many]{tcolorbox}
\tcbuselibrary{listings}
\tcbset{listing engine=listings}
\newtcblisting{scriptcode}{
    listing only,
    breakable,
    colback=white!75!black,
    colframe=black!75!white,
    fontupper=\bfseries\zihao{-4}}
\newtcblisting{examplecode}{
    listing only,
    breakable,
    colback=white,
    colframe=black,
    sharp corners=all,
    fontupper=\bfseries\zihao{-4}}
% \newtcbox{\iscriptcode}[1][orange!70!red]{on line,
%   before upper={\rule[-0.2ex]{0pt}{1ex}\ttfamily},
%   colback=white!75!black,
%   boxsep=0pt,left=1.5pt,right=1.5pt,top=1pt,bottom=1pt,
%   boxrule=1pt}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 图表样式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{booktabs}   % 三线表
\RequirePackage{caption}
\RequirePackage{longtable}
\RequirePackage{tabularx}
\RequirePackage{tabu}
\RequirePackage{multirow}
\RequirePackage{subfig}
\RequirePackage{placeins}
\RequirePackage{float}
\RequirePackage{makecell}

\graphicspath{{figures/}} %%图片文件路径

\captionsetup[figure]{font=bf}
\captionsetup[table]{font=bf, format=hang,singlelinecheck=false,justification=RaggedRight}  %修改表标题的格式
\captionsetup[subtable]{font={bf,small}, position=top, farskip=2pt,topadjust=0pt,captionskip=0pt,%
                        nearskip=5pt,margin=0pt}
\captionsetup[subfigure]{font={bf,small}, position=bottom, farskip=5pt,topadjust=0pt,captionskip=3pt,%
                        nearskip=5pt,margin=0pt}                                               

\newcommand{\PreserveBackslash}[1]{\let\temp=\\#1\let\\=\temp}
\newcolumntype{C}[1]{>{\centering\arraybackslash}m{#1}}
\newcolumntype{B}[1]{>{\centering\arraybackslash\baselineskip=14pt}m{#1}}
\newcolumntype{R}[1]{>{\PreserveBackslash\raggedleft}p{#1}}
\newcolumntype{L}[1]{>{\PreserveBackslash\raggedright}p{#1}}
\newcolumntype{e}{@{\extracolsep{\fill}}}
\newcolumntype{Y}{>{\centering\arraybackslash}X}

\newcommand{\minitab}[2][l]{\begin{tabular}{#1}#2\end{tabular}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 公式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\mathchardef\mhyphen="2D
% \AtBeginDocument{%
%   \expandafter\renewcommand\expandafter\subsection\expandafter{%
%     \expandafter\@fb@secFB\subsection
%   }%
% }
% \renewenvironment{longtabu}[2][c]{%
% \begin{longtabu}[#1]{#2}  
% }{\addtocounter{table}{-1}\end{longtabu}}

%\renewcommand\floatpagefraction{0.8} %% default value: 0.5
%\renewcommand\topfraction{0.8}       %% default value: 0.7

% \newlist{myprose}{enumerate}{1}
% \setlist[myprose,1]{
%   leftmargin=0pt,
%   label=(\alph*),
%   align=left,
%   itemindent=\dimexpr\parindent+\labelwidth+\labelsep\relax}

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
            pdftitle=main,
            hyperfootnotes,
            pdfauthor={Zou Haixiang,P\&LRC,<zou.mono@gmail.com>}}
\usepackage{lipsum}


