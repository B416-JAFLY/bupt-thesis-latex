%% -----------------------------------------------------------------
%% 北京邮电大学研究生学位论文 LaTeX 模板 - 文档类文件
%% 适配标准：北京邮电大学研究生院《学位论文写作与制作规范》（2025年1月15日修订）
%% 适用对象：学术型硕士、专业型硕士、学术型博士、专业型博士学位论文
%% -----------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{buptthesis}
  [2025/01/15 v1.0 Beijing University of Posts and Telecommunications (BUPT) Thesis Class]

%% -----------------------------------------------------------------
%% 1. 文档类选项定义与处理
%% -----------------------------------------------------------------
\newif\ifBUPT@option@phd             \BUPT@option@phdfalse
\newif\ifBUPT@option@master          \BUPT@option@mastertrue
\newif\ifBUPT@option@phil            \BUPT@option@philtrue
\newif\ifBUPT@option@eng             \BUPT@option@engfalse
\newif\ifBUPT@option@fulltime        \BUPT@option@fulltimetrue
\newif\ifBUPT@option@parttime        \BUPT@option@parttimefalse
\newif\ifBUPT@option@electronic      \BUPT@option@electronictrue
\newif\ifBUPT@option@print           \BUPT@option@printfalse
\newif\ifBUPT@option@draftcls        \BUPT@option@draftclsfalse
\newif\ifBUPT@option@cenhdr          \BUPT@option@cenhdrtrue
\newif\ifBUPT@option@txmath          \BUPT@option@txmathfalse

%% 学位级别：硕士 / 博士
\DeclareOption{master}{%
  \BUPT@option@mastertrue%
  \BUPT@option@phdfalse}
\DeclareOption{phd}{%
  \BUPT@option@masterfalse%
  \BUPT@option@phdtrue}

%% 学位类别：学术学位 (phil) / 专业学位 (eng)
\DeclareOption{phil}{%
  \BUPT@option@philtrue%
  \BUPT@option@engfalse}
\DeclareOption{eng}{%
  \BUPT@option@philfalse%
  \BUPT@option@engtrue}

%% 培养方式：全日制 / 非全日制
\DeclareOption{fulltime}{%
  \BUPT@option@fulltimetrue%
  \BUPT@option@parttimefalse}
\DeclareOption{parttime}{%
  \BUPT@option@fulltimefalse%
  \BUPT@option@parttimetrue}

%% 输出模式：电子版 (electronic) / 印刷双面版 (print) / 草稿版 (draftcls)
\DeclareOption{electronic}{%
  \BUPT@option@electronictrue%
  \BUPT@option@printfalse%
  \BUPT@option@draftclsfalse}
\DeclareOption{print}{%
  \BUPT@option@electronicfalse%
  \BUPT@option@printtrue%
  \BUPT@option@draftclsfalse}
\DeclareOption{draftcls}{%
  \BUPT@option@electronicfalse%
  \BUPT@option@printfalse%
  \BUPT@option@draftclstrue}

%% 页眉居中选项（2025规范明确要求居中，默认开启）
\DeclareOption{cenhdr}{\BUPT@option@cenhdrtrue}

%% 数学字体选项
\DeclareOption{txmath}{\BUPT@option@txmathtrue}

%% 传递其他参数给底层宏包
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}

%% 默认选项：硕士、学术学位、全日制、电子版、页眉居中
\ExecuteOptions{master,phil,fulltime,electronic,cenhdr}
\ProcessOptions\relax

%% -----------------------------------------------------------------
%% 2. 载入 ctexbook 文档类
%% -----------------------------------------------------------------
\PassOptionsToPackage{no-math}{fontspec}

\ifBUPT@option@print
  \LoadClass[
    UTF8,
    a4paper,
    zihao=-4,
    scheme=chinese,
    twoside,
    openright
  ]{ctexbook}
\else
  \LoadClass[
    UTF8,
    a4paper,
    zihao=-4,
    scheme=chinese,
    oneside
  ]{ctexbook}
  %% 电子版消除空白页，便于格式检测与屏幕阅读
  \let\cleardoublepage\clearpage
\fi

%% -----------------------------------------------------------------
%% 3. 基础依赖宏包载入
%% -----------------------------------------------------------------
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{titletoc}
\RequirePackage{graphicx}
\RequirePackage{caption}
\RequirePackage{bicaption}
\RequirePackage{booktabs}
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{makecell}
\RequirePackage{multirow}
\RequirePackage{mathtools}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{enumitem}
\RequirePackage{xcolor}
\RequirePackage{url}
\RequirePackage{pdfpages}
\RequirePackage{siunitx}
\DeclareSIUnit{\dBm}{dBm}
\DeclareSIUnit{\dBW}{dBW}
\DeclareSIUnit{\dBi}{dBi}
\DeclareSIUnit{\bps}{bps}
\DeclareSIUnit{\Gbps}{Gbps}
\DeclareSIUnit{\Mbps}{Mbps}
\DeclareSIUnit{\kbps}{kbps}
\RequirePackage{subcaption}

%% 参考文献宏包 GB/T 7714-2015
\RequirePackage[sort]{gbt7714}

%% 超链接配置
\RequirePackage{hyperref}
\hypersetup{
  colorlinks=true,
  linkcolor=black,
  citecolor=black,
  filecolor=black,
  urlcolor=black,
  bookmarksnumbered=true,
  bookmarksopen=true,
  pdfstartview={FitH}
}

%% -----------------------------------------------------------------
%% 4. 页面尺寸与边距设置（严格遵照2025年1月15日规范）
%% 规范要求：上 2.54cm，下 2.54cm，左 3.17cm，右 3.17cm
%%           页眉边距 1.5cm，页脚边距 1.75cm，装订线 0cm
%% -----------------------------------------------------------------
\geometry{
  a4paper,
  left=3.17cm,
  right=3.17cm,
  top=2.54cm,
  bottom=2.54cm,
  headheight=15pt,
  headsep=0.51cm,    % 2.54cm - 1.5cm - 0.53cm = 0.51cm (顶端距页眉顶部约1.5cm)
  footskip=0.79cm    % 2.54cm - 1.75cm = 0.79cm (页脚底端距页面底部约1.75cm)
}

%% -----------------------------------------------------------------
%% 5. 字体与行距配置
%% 规范要求：所有英文字母、阿拉伯数字、半角标点用 Times New Roman
%%           正文宋体小四号，固定值20磅
%% -----------------------------------------------------------------
\RequirePackage{fontspec}
\setmainfont{Times New Roman}

%% 数学字体
\ifBUPT@option@txmath
  \RequirePackage{newtxmath}
\fi

%% 楷体字体配置（优先使用自带国标楷体资源，兼容 Linux/Overleaf/Mac/Windows）
\IfFileExists{resources/gbkai-Regular.ttf}{
  \setCJKfamilyfont{gbkt}[Path=resources/]{gbkai-Regular.ttf}
  \newcommand{\gbkai}{\CJKfamily{gbkt}}
}{
  \newcommand{\gbkai}{\kaishu}
}

%% 行距与段落间距
%% 小四号为12bp，固定值20磅对应基线距离20bp (20/12/1.33 ≈ 1.25)
\linespread{1.25}\selectfont
\setlength{\parskip}{0pt}
\setlength{\parindent}{2\ccwd}

%% 列表间距压缩
\setlist{nosep}

%% -----------------------------------------------------------------
%% 6. 章节与各级标题格式（严格对齐2025规范）
%% 规范要求：
%% 章标题：黑体三号，居中，段前0行，段后2行，单倍行距，空两格
%% 二级标题：黑体四号，左对齐，段前0.5行，段后0.5行，单倍行距，空两格
%% 三级标题：黑体小四号，左对齐，段前0行，段后0行，固定值20磅，空两格
%% 四级标题：宋体小四号，首行缩进2字符，段前0行，段后0行，固定值20磅，空两格
%% -----------------------------------------------------------------
\setcounter{secnumdepth}{4}

\ctexset{
  chapter = {
    name = {第,章},
    number = \chinese{chapter},
    format = \heiti\zihao{3}\centering,
    beforeskip = 0pt,
    afterskip = 32pt,     % 段后2行单倍行距（约32pt）
    aftername = \hspace{1em},
    pagestyle = BUPThdrstyle,
  },
  section = {
    format = \heiti\zihao{4}\raggedright,
    beforeskip = 8pt,     % 段前0.5行
    afterskip = 8pt,      % 段后0.5行
    aftername = \hspace{1em},
  },
  subsection = {
    format = \heiti\zihao{-4}\raggedright,
    beforeskip = 0pt,     % 段前0行
    afterskip = 0pt,      % 段后0行
    aftername = \hspace{1em},
  },
  subsubsection = {
    format = \songti\zihao{-4}\raggedright,
    beforeskip = 0pt,     % 段前0行
    afterskip = 0pt,      % 段后0行
    indent = 2\ccwd,      % 首行缩进2字符
    aftername = \hspace{1em},
  },
}

%% -----------------------------------------------------------------
%% 7. 页眉页脚配置（严格遵照2025规范）
%% 规范要求：
%% 偶数页页眉：“北京邮电大学硕士学位论文”或“北京邮电大学博士学位论文”
%% 奇数页页眉：本章标题（如“第一章  绪论”）
%% 宋体小五号居中书写，页眉下横线为单实线
%% 页码位于底端中央，Times New Roman五号居中，两侧不加“-”等修饰线
%% 摘要至正文前用罗马数字 (I, II, III...)，第一章起用阿拉伯数字 (1, 2, 3...)
%% -----------------------------------------------------------------
%% 载入配置文件
\InputIfFileExists{config/buptthesis.cfg}{}{}

%% 学位与论文类别值设定
\ifBUPT@option@phd
  \def\BUPT@value@degree{\BUPT@label@phddegree}
  \def\BUPT@value@degreeEN{\BUPT@label@phddegreeEN}
  \def\BUPT@value@thesisEN{\BUPT@label@phdthesisEN}
  \def\BUPT@value@headerthesis{博士学位论文}
\else
  \def\BUPT@value@degree{\BUPT@label@masterdegree}
  \def\BUPT@value@degreeEN{\BUPT@label@masterdegreeEN}
  \def\BUPT@value@thesisEN{\BUPT@label@masterthesisEN}
  \def\BUPT@value@headerthesis{硕士学位论文}
\fi

\ifBUPT@option@phil
  \def\BUPT@value@degreemode{\BUPT@label@philmode}
  \def\BUPT@value@degreemodeEN{\BUPT@label@philmodeEN}
\else
  \def\BUPT@value@degreemode{\BUPT@label@engmode}
  \def\BUPT@value@degreemodeEN{\BUPT@label@engmodeEN}
\fi

\ifBUPT@option@fulltime
  \def\BUPT@value@trainingmode{\BUPT@label@fulltime}
  \def\BUPT@value@trainingmodeEN{\BUPT@label@fulltimeEN}
\else
  \def\BUPT@value@trainingmode{\BUPT@label@parttime}
  \def\BUPT@value@trainingmodeEN{\BUPT@label@parttimeEN}
\fi

%% 定义页眉页脚样式
\fancypagestyle{BUPThdrstyle}{%
  \fancyhf{}%
  \fancyhead[OC]{\songti\zihao{-5}\nouppercase{\leftmark}}%
  \fancyhead[EC]{\songti\zihao{-5}\BUPT@label@university\BUPT@value@headerthesis}%
  \fancyfoot[C]{\rmfamily\zihao{5}\thepage}%
  \renewcommand{\headrulewidth}{0.75pt}%
  \renewcommand{\footrulewidth}{0pt}%
}

%% 重新定义 plain 页样式，使得章首页同样包含规范页眉页脚
\fancypagestyle{plain}{%
  \fancyhf{}%
  \fancyhead[OC]{\songti\zihao{-5}\nouppercase{\leftmark}}%
  \fancyhead[EC]{\songti\zihao{-5}\BUPT@label@university\BUPT@value@headerthesis}%
  \fancyfoot[C]{\rmfamily\zihao{5}\thepage}%
  \renewcommand{\headrulewidth}{0.75pt}%
  \renewcommand{\footrulewidth}{0pt}%
}

%% 前言与正文页码划分
\let\BUPT@orig@frontmatter\frontmatter
\renewcommand{\frontmatter}{%
  \BUPT@orig@frontmatter
  \pagenumbering{Roman}%
  \pagestyle{BUPThdrstyle}%
}

\let\BUPT@orig@mainmatter\mainmatter
\renewcommand{\mainmatter}{%
  \BUPT@orig@mainmatter
  \pagenumbering{arabic}%
  \setcounter{page}{1}%
  \pagestyle{BUPThdrstyle}%
}

\AtBeginDocument{%
  \pagestyle{empty}%
}

%% -----------------------------------------------------------------
%% 8. 目录格式设置（严格遵照2025规范）
%% 规范要求：
%% “目录”标题黑体三号居中，单倍行距，段前0，段后2行
%% 一级目录项：黑体小四号，两端对齐，左缩进0字符，固定值20磅
%% 二级目录项：宋体小四号，两端对齐，左缩进2字符，固定值20磅
%% 三级目录项：宋体小四号，两端对齐，左缩进4字符，固定值20磅
%% 点线导引符，页码右对齐
%% -----------------------------------------------------------------
\ctexset{
  contentsname = {目\quad 录}
}

\setcounter{tocdepth}{2}

\titlecontents{chapter}[0em]
  {\heiti\zihao{-4}\vspace{0pt}}
  {\thecontentslabel\hspace{1em}}
  {}
  {\titlerule*[0.5em]{.}\contentspage}

\titlecontents{section}[2\ccwd]
  {\songti\zihao{-4}\vspace{0pt}}
  {\thecontentslabel\hspace{1em}}
  {}
  {\titlerule*[0.5em]{.}\contentspage}

\titlecontents{subsection}[4\ccwd]
  {\songti\zihao{-4}\vspace{0pt}}
  {\thecontentslabel\hspace{1em}}
  {}
  {\titlerule*[0.5em]{.}\contentspage}

%% -----------------------------------------------------------------
%% 9. 图、表、公式与算法格式设置（严格对齐2025规范）
%% 规范要求：
%% 图题居中置于图下方，楷体五号，固定值20磅，图序与图名空一格，无句末标点
%% 表题居中置于表上方，楷体五号，固定值20磅，表序与表名空一格，无句末标点
%% 图注/表注：宋体五号，首行缩进2字符，固定值20磅
%% 公式居中横排，按章编号右端对齐如 (1-1)
%% -----------------------------------------------------------------
\DeclareCaptionFont{gbkai}{\gbkai}
\captionsetup{
  format=plain,
  labelformat=simple,
  labelsep=space,
  justification=centering,
  font={small,gbkai}
}
\captionsetup[sub]{font={small,gbkai}}
\captionsetup[figure][bi-second]{name=Figure}
\captionsetup[table][bi-second]{name=Table}

\renewcommand{\thefigure}{\thechapter-\arabic{figure}}
\renewcommand{\thetable}{\thechapter-\arabic{table}}
\renewcommand{\theequation}{\thechapter-\arabic{equation}}

\setlength{\abovecaptionskip}{4pt}
\setlength{\belowcaptionskip}{4pt}
\setlength{\intextsep}{8pt}

%% 图注与表注专用命令
\newcommand{\fignote}[1]{%
  \vspace{2pt}%
  \parbox{\linewidth}{\songti\zihao{5}\setlength{\parindent}{2\ccwd}\indent #1\par}%
}
\newcommand{\tablenote}[1]{%
  \vspace{2pt}%
  \parbox{\linewidth}{\songti\zihao{5}\setlength{\parindent}{2\ccwd}\indent #1\par}%
}

%% -----------------------------------------------------------------
%% 10. 扉页与元数据宏定义及多行下划线自适应折行算法
%% -----------------------------------------------------------------
\RequirePackage{keyval}

\newlength{\BUPT@value@titlewidth}
\newlength{\BUPT@value@titlewidthEN}
\newlength{\BUPT@value@infowidth}
\newlength{\BUPT@value@infowidthEN}
\setlength{\BUPT@value@titlewidth}{11.5cm}
\setlength{\BUPT@value@titlewidthEN}{13.5cm}
\setlength{\BUPT@value@infowidth}{8.2cm}
\setlength{\BUPT@value@infowidthEN}{8.8cm}

\ExplSyntaxOn
\seq_new:N \l_bupt_chunks_seq
\seq_new:N \l_bupt_words_seq
\seq_new:N \l_bupt_final_seq
\tl_new:N \l_bupt_curr_tl
\box_new:N \l_bupt_measure_box

\cs_generate_variant:Nn \seq_set_split:Nnn { Nno, Nnx }
\cs_generate_variant:Nn \tl_range:nnn { Vnn }
\cs_generate_variant:Nn \tl_item:nn { Vn }
\cs_generate_variant:Nn \tl_count:n { V }

%% -----------------------------------------------------------------
%% 通用自适应断行核心函数
%% -----------------------------------------------------------------
\cs_new_protected:Npn \bupt_auto_wrap_text:nnn #1#2#3
% #1: 目标宽度, #2: 字体设置, #3: 待处理纯文本片段
{
  % 1. 首先检测是否能单行放下
  \hbox_set:Nn \l_bupt_measure_box { #2 #3 }
  \dim_compare:nTF { \box_wd:N \l_bupt_measure_box <= #1 }
  {
    \seq_put_right:Nn \l_bupt_final_seq { #3 }
  }
  {
    % 2. 放不下，检测是否有空格（英文或带空格中文）
    \seq_set_split:Nno \l_bupt_words_seq { ~ } { #3 }
    \int_compare:nNnTF { \seq_count:N \l_bupt_words_seq } > { 1 }
    {
      % 按单词贪心断行
      \tl_clear:N \l_bupt_curr_tl
      \seq_map_inline:Nn \l_bupt_words_seq
      {
        \tl_if_empty:nTF { \l_bupt_curr_tl }
        {
          \tl_set:Nn \l_bupt_curr_tl { ##1 }
        }
        {
          \hbox_set:Nn \l_bupt_measure_box { #2 \l_bupt_curr_tl ~ ##1 }
          \dim_compare:nNnTF { \box_wd:N \l_bupt_measure_box } > {#1}
          {
            \seq_put_right:NV \l_bupt_final_seq \l_bupt_curr_tl
            \tl_set:Nn \l_bupt_curr_tl { ##1 }
          }
          {
            \tl_put_right:Nn \l_bupt_curr_tl { ~ ##1 }
          }
        }
      }
      \tl_if_empty:nF { \l_bupt_curr_tl }
      {
        \seq_put_right:NV \l_bupt_final_seq \l_bupt_curr_tl
      }
    }
    {
      % 3. 中文无空格，按字符贪心断行
      \tl_clear:N \l_bupt_curr_tl
      \tl_map_inline:nn { #3 }
      {
        \tl_if_empty:nTF { \l_bupt_curr_tl }
        {
          \tl_set:Nn \l_bupt_curr_tl { ##1 }
        }
        {
          \hbox_set:Nn \l_bupt_measure_box { #2 \l_bupt_curr_tl ##1 }
          \dim_compare:nNnTF { \box_wd:N \l_bupt_measure_box } > {#1}
          {
            \tl_set:Nn \l_tmpa_tl { ##1 }
            \bool_set_false:N \l_tmpa_bool
            \tl_if_in:NnT \l_tmpa_tl { ， } { \bool_set_true:N \l_tmpa_bool }
            \tl_if_in:NnT \l_tmpa_tl { 、 } { \bool_set_true:N \l_tmpa_bool }
            \tl_if_in:NnT \l_tmpa_tl { ） } { \bool_set_true:N \l_tmpa_bool }
            \tl_if_in:NnT \l_tmpa_tl { ； } { \bool_set_true:N \l_tmpa_bool }
            \tl_if_in:NnT \l_tmpa_tl { ： } { \bool_set_true:N \l_tmpa_bool }
            \tl_if_in:NnT \l_tmpa_tl { 。 } { \bool_set_true:N \l_tmpa_bool }
            
            \bool_if:NTF \l_tmpa_bool
            {
              \tl_put_right:Nn \l_bupt_curr_tl { ##1 }
              \seq_put_right:NV \l_bupt_final_seq \l_bupt_curr_tl
              \tl_clear:N \l_bupt_curr_tl
            }
            {
              \seq_put_right:NV \l_bupt_final_seq \l_bupt_curr_tl
              \tl_set:Nn \l_bupt_curr_tl { ##1 }
            }
          }
          {
            \tl_put_right:Nn \l_bupt_curr_tl { ##1 }
          }
        }
      }
      \tl_if_empty:nF { \l_bupt_curr_tl }
      {
        \seq_put_right:NV \l_bupt_final_seq \l_bupt_curr_tl
      }
    }
  }
}

%% -----------------------------------------------------------------
%% 支持 \\ 强制换行分割的处理函数（个人信息等常规表单字段）
%% -----------------------------------------------------------------
\cs_new_protected:Npn \bupt_process_field_lines:nnn #1#2#3
% #1: 目标宽度, #2: 字体设置, #3: 用户输入内容
{
  \seq_clear:N \l_bupt_final_seq
  \seq_set_split:Nno \l_bupt_chunks_seq { \\ } { #3 }
  \seq_map_inline:Nn \l_bupt_chunks_seq
  {
    \bupt_auto_wrap_text:nnn {#1} {#2} { ##1 }
  }
}

%% -----------------------------------------------------------------
%% 中文题目自适应折行算法（支持显式 \\ 与超长平衡平分）
%% -----------------------------------------------------------------
\cs_new_protected:Npn \bupt_process_title_cn:n #1
{
  \seq_clear:N \l_bupt_final_seq
  \seq_set_split:Nno \l_bupt_chunks_seq { \\ } { #1 }
  \int_compare:nNnTF { \seq_count:N \l_bupt_chunks_seq } > { 1 }
  {
    % 用户显式指定了换行 \\
    \seq_map_inline:Nn \l_bupt_chunks_seq
    {
      \bupt_auto_wrap_text:nnn { \BUPT@value@titlewidth } { \songti\zihao{-2}\bfseries } { ##1 }
    }
  }
  {
    % 单行输入：检测是否能单行容纳
    \hbox_set:Nn \l_bupt_measure_box { \songti\zihao{-2}\bfseries #1 }
    \dim_compare:nTF { \box_wd:N \l_bupt_measure_box <= \BUPT@value@titlewidth }
    {
      \seq_put_right:Nn \l_bupt_final_seq { #1 }
    }
    {
      % 超过单行宽度，按中点平衡拆分为2行，并避让行首标点
      \tl_set:No \l_tmpc_tl { #1 }
      \int_set:Nn \l_tmpa_int { \tl_count:V \l_tmpc_tl }
      \int_set:Nn \l_tmpb_int { \int_div_truncate:nn { \l_tmpa_int + 1 } { 2 } }
      \tl_set:Nx \l_tmpa_tl { \tl_item:Vn \l_tmpc_tl { \l_tmpb_int + 1 } }
      \tl_if_in:NnT \l_tmpa_tl { ， } { \int_incr:N \l_tmpb_int }
      \tl_if_in:NnT \l_tmpa_tl { 、 } { \int_incr:N \l_tmpb_int }
      \tl_if_in:NnT \l_tmpa_tl { ） } { \int_incr:N \l_tmpb_int }
      \tl_if_in:NnT \l_tmpa_tl { ； } { \int_incr:N \l_tmpb_int }
      \tl_if_in:NnT \l_tmpa_tl { ： } { \int_incr:N \l_tmpb_int }
      \tl_if_in:NnT \l_tmpa_tl { 。 } { \int_incr:N \l_tmpb_int }
      
      \tl_set:Nx \l_bupt_curr_tl { \tl_range:Vnn \l_tmpc_tl { 1 } { \l_tmpb_int } }
      \seq_put_right:NV \l_bupt_final_seq \l_bupt_curr_tl
      \tl_set:Nx \l_bupt_curr_tl { \tl_range:Vnn \l_tmpc_tl { \l_tmpb_int + 1 } { -1 } }
      \seq_put_right:NV \l_bupt_final_seq \l_bupt_curr_tl
    }
  }
}

%% -----------------------------------------------------------------
%% 英文题目自适应折行算法
%% -----------------------------------------------------------------
\cs_new_protected:Npn \bupt_process_title_en:n #1
{
  \seq_clear:N \l_bupt_final_seq
  \seq_set_split:Nno \l_bupt_chunks_seq { \\ } { #1 }
  \int_compare:nNnTF { \seq_count:N \l_bupt_chunks_seq } > { 1 }
  {
    \seq_map_inline:Nn \l_bupt_chunks_seq
    {
      \bupt_auto_wrap_text:nnn { \BUPT@value@titlewidthEN } { \rmfamily\zihao{-2}\bfseries } { ##1 }
    }
  }
  {
    \hbox_set:Nn \l_bupt_measure_box { \rmfamily\zihao{-2}\bfseries #1 }
    \dim_compare:nTF { \box_wd:N \l_bupt_measure_box <= \BUPT@value@titlewidthEN }
    {
      \seq_put_right:Nn \l_bupt_final_seq { #1 }
    }
    {
      \bupt_auto_wrap_text:nnn { \BUPT@value@titlewidthEN } { \rmfamily\zihao{-2}\bfseries } { #1 }
    }
  }
}

%% -----------------------------------------------------------------
%% 渲染中文题目（表格排版，多行对齐下划线）
%% -----------------------------------------------------------------
\cs_new_protected:Npn \bupt_render_cn_title:n #1
{
  \bupt_process_title_cn:n { #1 }
  \parbox[t]{\linewidth}{%
    \centering
    \begin{tabular}[t]{@{}l@{\hspace{0pt}}l@{}}
      \songti\zihao{-2}\bfseries \BUPT@label@title &
      \underline{\makebox[\BUPT@value@titlewidth][c]{\songti\zihao{-2}\bfseries \seq_item:Nn \l_bupt_final_seq { 1 }}}
      \int_step_inline:nnn { 2 } { \seq_count:N \l_bupt_final_seq }
      {
        \\ \noalign{\vspace{6pt}}
        & \underline{\makebox[\BUPT@value@titlewidth][c]{\songti\zihao{-2}\bfseries \seq_item:Nn \l_bupt_final_seq {##1}}}
      }
    \end{tabular}%
  }
}

%% -----------------------------------------------------------------
%% 渲染英文题目（表格居中排版，多行对齐下划线）
%% -----------------------------------------------------------------
\cs_new_protected:Npn \bupt_render_en_title:n #1
{
  \bupt_process_title_en:n { #1 }
  \parbox[t]{\linewidth}{%
    \centering
    \begin{tabular}[t]{@{}c@{}}
      \underline{\makebox[\BUPT@value@titlewidthEN][c]{\rmfamily\zihao{-2}\bfseries \seq_item:Nn \l_bupt_final_seq { 1 }}}
      \int_step_inline:nnn { 2 } { \seq_count:N \l_bupt_final_seq }
      {
        \\ \noalign{\vspace{6pt}}
        \underline{\makebox[\BUPT@value@titlewidthEN][c]{\rmfamily\zihao{-2}\bfseries \seq_item:Nn \l_bupt_final_seq {##1}}}
      }
    \end{tabular}%
  }
}

%% -----------------------------------------------------------------
%% 渲染个人信息表单字段（支持自动折行与\\断行，每行独立下划线）
%% -----------------------------------------------------------------
\cs_new_protected:Npn \bupt_render_info_field:nnn #1#2#3
{
  \bupt_process_field_lines:nnn {#1} {#2} { #3 }
  \parbox[t]{#1}{%
    \seq_map_inline:Nn \l_bupt_final_seq
    {%
      \underline{\makebox[#1][c]{#2 ##1}}\par\vspace{3pt}%
    }%
  }%
}

\cs_set_eq:NN \BUPTRenderCnTitle \bupt_render_cn_title:n
\cs_set_eq:NN \BUPTRenderEnTitle \bupt_render_en_title:n
\cs_set_eq:NN \BUPTRenderField \bupt_render_info_field:nnn
\ExplSyntaxOff

\def\BUPTdateOptions#1{\setkeys{BUPTdate}{#1}}
\define@key{BUPTdate}{pageYear}{\def\BUPT@value@pageYear{#1}}
\define@key{BUPTdate}{pageMonth}{\def\BUPT@value@pageMonth{#1}}
\define@key{BUPTdate}{pageDay}{\def\BUPT@value@pageDay{#1}}
\define@key{BUPTdate}{dissertationYear}{\def\BUPT@value@dissertationYear{#1}}
\define@key{BUPTdate}{dissertationMonth}{\def\BUPT@value@dissertationMonth{#1}}
\define@key{BUPTdate}{dissertationDay}{\def\BUPT@value@dissertationDay{#1}}

\def\BUPTthesiscntitlepage#1{\setkeys{BUPTcntitle}{#1}}
\define@key{BUPTcntitle}{confidential}{\def\BUPT@value@confidential{#1}}
\define@key{BUPTcntitle}{title}{\def\BUPT@value@title{#1}}
\define@key{BUPTcntitle}{studentid}{\def\BUPT@value@studentid{#1}}
\define@key{BUPTcntitle}{name}{\def\BUPT@value@name{#1}}
\define@key{BUPTcntitle}{major}{\def\BUPT@value@major{#1}}
\define@key{BUPTcntitle}{trainingmode}{\def\BUPT@value@trainingmode{#1}}
\define@key{BUPTcntitle}{supervisor}{\def\BUPT@value@supervisor{#1}}
\define@key{BUPTcntitle}{institute}{\def\BUPT@value@institute{#1}}

\def\BUPTthesisentitlepage#1{\setkeys{BUPTentitle}{#1}}
\define@key{BUPTentitle}{confidentialEN}{\def\BUPT@value@confidentialEN{#1}}
\define@key{BUPTentitle}{titleEN}{\def\BUPT@value@titleEN{#1}}
\define@key{BUPTentitle}{studentidEN}{\def\BUPT@value@studentidEN{#1}}
\define@key{BUPTentitle}{nameEN}{\def\BUPT@value@nameEN{#1}}
\define@key{BUPTentitle}{majorEN}{\def\BUPT@value@majorEN{#1}}
\define@key{BUPTentitle}{supervisorEN}{\def\BUPT@value@supervisorEN{#1}}
\define@key{BUPTentitle}{instituteEN}{\def\BUPT@value@instituteEN{#1}}

%% 下划线辅助命令
\newcommand{\BUPTunderline}[2]{\underline{\makebox[#1][c]{#2}}}

%% -----------------------------------------------------------------
%% 11. 中文扉页生成（内封）
%% -----------------------------------------------------------------
\newcommand{\makechinesetitle}{%
  \cleardoublepage
  \thispagestyle{empty}%
  \begin{flushright}
    {\songti\zihao{4}\bfseries \BUPT@label@confidential\BUPT@value@confidential\hspace{1em}}
  \end{flushright}
  \vspace{0.3cm}
  \begin{center}
    \includegraphics[width=12.67cm]{\BUPT@value@schoolname}\\[1.0cm]
    {\heiti\fontsize{32bp}{38bp}\selectfont\bfseries \BUPT@value@degree\BUPT@label@thesis（\BUPT@value@degreemode）}\\[0.8cm]
    \includegraphics[width=3.4cm]{\BUPT@value@schoollogo}\\[1.0cm]
    \BUPTRenderCnTitle{\BUPT@value@title}\\[1.2cm]
    {\songti\zihao{4}\bfseries
      \renewcommand{\arraystretch}{1.6}
      \begin{tabular}{r@{\hspace{0.5em}}l}
        \BUPT@label@studentid    & \BUPTRenderField{\BUPT@value@infowidth}{\songti\zihao{4}\bfseries}{\BUPT@value@studentid}    \\
        \BUPT@label@name         & \BUPTRenderField{\BUPT@value@infowidth}{\songti\zihao{4}\bfseries}{\BUPT@value@name}         \\
        \BUPT@label@major        & \BUPTRenderField{\BUPT@value@infowidth}{\songti\zihao{4}\bfseries}{\BUPT@value@major}        \\
        \BUPT@label@trainingmode & \BUPTRenderField{\BUPT@value@infowidth}{\songti\zihao{4}\bfseries}{\BUPT@value@trainingmode} \\
        \BUPT@label@supervisor   & \BUPTRenderField{\BUPT@value@infowidth}{\songti\zihao{4}\bfseries}{\BUPT@value@supervisor}   \\
        \BUPT@label@institute    & \BUPTRenderField{\BUPT@value@infowidth}{\songti\zihao{4}\bfseries}{\BUPT@value@institute}
      \end{tabular}%
    }\\[1.5cm]
    {\songti\zihao{4}\bfseries \BUPT@value@pageYear~年~\BUPT@value@pageMonth~月~\BUPT@value@pageDay~日}
  \end{center}
  \cleardoublepage
}

%% -----------------------------------------------------------------
%% 12. 英文扉页生成
%% -----------------------------------------------------------------
\newcommand{\makeenglishtitle}{%
  \cleardoublepage
  \thispagestyle{empty}%
  \begin{flushright}
    {\rmfamily\zihao{4}\bfseries \BUPT@label@confidentialEN\BUPT@value@confidentialEN\hspace{1em}}
  \end{flushright}
  \vspace{0.3cm}
  \begin{center}
    \includegraphics[width=14.5cm]{\BUPT@value@schoolen}\\[1.0cm]
    {\rmfamily\zihao{-1}\bfseries \BUPT@value@thesisEN}\\[1.0cm]
    \BUPTRenderEnTitle{\BUPT@value@titleEN}\\[1.2cm]
    {\rmfamily\zihao{4}\bfseries
      \renewcommand{\arraystretch}{1.6}
      \begin{tabular}{r@{\hspace{0.5em}}l}
        \BUPT@label@studentidEN  & \BUPTRenderField{\BUPT@value@infowidthEN}{\rmfamily\zihao{4}\bfseries}{\BUPT@value@studentidEN}  \\
        \BUPT@label@nameEN       & \BUPTRenderField{\BUPT@value@infowidthEN}{\rmfamily\zihao{4}\bfseries}{\BUPT@value@nameEN}       \\
        \BUPT@label@majorEN      & \BUPTRenderField{\BUPT@value@infowidthEN}{\rmfamily\zihao{4}\bfseries}{\BUPT@value@majorEN}      \\
        \BUPT@label@supervisorEN & \BUPTRenderField{\BUPT@value@infowidthEN}{\rmfamily\zihao{4}\bfseries}{\BUPT@value@supervisorEN} \\
        \BUPT@label@instituteEN  & \BUPTRenderField{\BUPT@value@infowidthEN}{\rmfamily\zihao{4}\bfseries}{\BUPT@value@instituteEN}
      \end{tabular}%
    }\\[1.5cm]
    {\rmfamily\zihao{4}\bfseries \BUPT@value@pageMonth,~\BUPT@value@pageYear}
  \end{center}
  \cleardoublepage
}

%% -----------------------------------------------------------------
%% 13. 答辩委员会名单生成
%% 规范要求：另起一页，黑体三号居中，单倍行距
%% -----------------------------------------------------------------
\def\BUPTdissertationcommitteepage#1{\setkeys{BUPTcommittee}{#1}}
\define@key{BUPTcommittee}{chairName}{\def\BUPT@value@committeeChairName{#1}}
\define@key{BUPTcommittee}{chairTitle}{\def\BUPT@value@committeeChairTitle{#1}}
\define@key{BUPTcommittee}{chairOrgan}{\def\BUPT@value@committeeChairOrgan{#1}}
\define@key{BUPTcommittee}{memberAName}{\def\BUPT@value@committeeMemberFirstName{#1}}
\define@key{BUPTcommittee}{memberATitle}{\def\BUPT@value@committeeMemberFirstTitle{#1}}
\define@key{BUPTcommittee}{memberAOrgan}{\def\BUPT@value@committeeMemberFirstOrgan{#1}}
\define@key{BUPTcommittee}{memberBName}{\def\BUPT@value@committeeMemberSecondName{#1}}
\define@key{BUPTcommittee}{memberBTitle}{\def\BUPT@value@committeeMemberSecondTitle{#1}}
\define@key{BUPTcommittee}{memberBOrgan}{\def\BUPT@value@committeeMemberSecondOrgan{#1}}
\define@key{BUPTcommittee}{memberCName}{\def\BUPT@value@committeeMemberThirdName{#1}}
\define@key{BUPTcommittee}{memberCTitle}{\def\BUPT@value@committeeMemberThirdTitle{#1}}
\define@key{BUPTcommittee}{memberCOrgan}{\def\BUPT@value@committeeMemberThirdOrgan{#1}}
\define@key{BUPTcommittee}{memberDName}{\def\BUPT@value@committeeMemberFourthName{#1}}
\define@key{BUPTcommittee}{memberDTitle}{\def\BUPT@value@committeeMemberFourthTitle{#1}}
\define@key{BUPTcommittee}{memberDOrgan}{\def\BUPT@value@committeeMemberFourthOrgan{#1}}
\define@key{BUPTcommittee}{secretaryName}{\def\BUPT@value@committeeSecretaryName{#1}}
\define@key{BUPTcommittee}{secretaryTitle}{\def\BUPT@value@committeeSecretaryTitle{#1}}
\define@key{BUPTcommittee}{secretaryOrgan}{\def\BUPT@value@committeeSecretaryOrgan{#1}}

\newcommand{\makecommitteelist}{%
  \cleardoublepage
  \thispagestyle{empty}%
  \begin{center}
    {\heiti\zihao{3} \BUPT@label@committeelist}\\[1.5em]
    \renewcommand{\arraystretch}{1.5}
    \songti\zihao{5}
    \begin{tabular}{|>{\centering\arraybackslash}m{2.0cm}|>{\centering\arraybackslash}m{2.5cm}|>{\centering\arraybackslash}m{2.5cm}|>{\centering\arraybackslash}m{6.0cm}|}
      \hline
      职\quad 务 & 姓\quad 名 & 职\quad 称 & 工\quad 作\quad 单\quad 位 \\
      \hline
      主席 & \BUPT@value@committeeChairName & \BUPT@value@committeeChairTitle & \BUPT@value@committeeChairOrgan \\
      \hline
      委员 & \BUPT@value@committeeMemberFirstName & \BUPT@value@committeeMemberFirstTitle & \BUPT@value@committeeMemberFirstOrgan \\
      \hline
      委员 & \BUPT@value@committeeMemberSecondName & \BUPT@value@committeeMemberSecondTitle & \BUPT@value@committeeMemberSecondOrgan \\
      \hline
      委员 & \BUPT@value@committeeMemberThirdName & \BUPT@value@committeeMemberThirdTitle & \BUPT@value@committeeMemberThirdOrgan \\
      \hline
      委员 & \BUPT@value@committeeMemberFourthName & \BUPT@value@committeeMemberFourthTitle & \BUPT@value@committeeMemberFourthOrgan \\
      \hline
      秘书 & \BUPT@value@committeeSecretaryName & \BUPT@value@committeeSecretaryTitle & \BUPT@value@committeeSecretaryOrgan \\
      \hline
      答辩日期 & \multicolumn{3}{c|}{\BUPT@value@dissertationYear~年~\BUPT@value@dissertationMonth~月~\BUPT@value@dissertationDay~日} \\
      \hline
    \end{tabular}
  \end{center}
  \cleardoublepage
}

%% -----------------------------------------------------------------
%% 13. 独创性声明与授权使用说明生成（严格遵照2025年1月15日规范）
%% 规范要求：标题黑体三号居中，内容宋体小四号首行缩进2字符固定值20磅
%% -----------------------------------------------------------------
\newcommand{\statementpage}[1]{%
  \def\BUPT@value@statementscanfile{#1}%
}
\let\BUPT@value@statementscanfile\@empty

\newcommand{\makestatement}{%
  \cleardoublepage
  \thispagestyle{empty}%
  \ifx\BUPT@value@statementscanfile\@empty
    \begin{center}
      {\heiti\zihao{3} \BUPT@label@innovationtitle}\par
    \end{center}
    \vspace{1.0em}
    {\songti\zihao{-4}\setlength{\baselineskip}{20bp}\setlength{\parindent}{2\ccwd}%
      \BUPT@label@innovationparagraph\par
    }
    \vspace{2.5em}
    {\songti\zihao{-4}
      \BUPT@label@authorsignature\BUPTunderline{3.5cm}{}\hfill\BUPT@label@issuedate\BUPTunderline{3.5cm}{}
    }
    \vspace{4.0em}
    \begin{center}
      {\heiti\zihao{3} \BUPT@label@authorizationtitle}\par
    \end{center}
    \vspace{1.0em}
    {\songti\zihao{-4}\setlength{\baselineskip}{20bp}\setlength{\parindent}{2\ccwd}%
      \BUPT@label@authorizationparagraph\par
    }
    \vspace{2.5em}
    {\songti\zihao{-4}
      \BUPT@label@authorsignature\BUPTunderline{3.5cm}{}\hfill\BUPT@label@issuedate\BUPTunderline{3.5cm}{}\\[1.5em]
      \BUPT@label@supervisorsignature\BUPTunderline{3.5cm}{}\hfill\BUPT@label@issuedate\BUPTunderline{3.5cm}{}
    }
  \else
    \includepdf[pages={1}]{\BUPT@value@statementscanfile}
  \fi
  \cleardoublepage
}

%% -----------------------------------------------------------------
%% 14. 中文摘要环境（严格对齐2025规范）
%% 规范要求：
%% “摘要”标题黑体三号居中，段前0行，段后1行，单倍行距，中间空1个全角空格
%% 摘要内容：四号宋体，两端对齐，首行缩进2字符，段前0，段后0，固定值20磅
%% 关键词：“关键词：”黑体四号，其后宋体四号，全角分号隔开，末尾无标点
%% -----------------------------------------------------------------
\newenvironment{cnabstract}{%
  \cleardoublepage
  \markboth{\BUPT@label@abstract}{\BUPT@label@abstract}%
  \addcontentsline{toc}{chapter}{\BUPT@label@abstract}%
  \begin{center}
    {\heiti\zihao{3}\BUPT@label@abstract}\par
  \end{center}
  \vspace{1.0em}
  \songti\zihao{4}\setlength{\baselineskip}{20bp}\setlength{\parindent}{2\ccwd}%
}{%
  \par\cleardoublepage
}

\newcommand{\cnkeywords}[1]{%
  \vspace{1.0em}\par\noindent
  {\heiti\zihao{4}\BUPT@label@keywords}%
  {\songti\zihao{4}#1}%
}

%% -----------------------------------------------------------------
%% 15. 英文摘要环境（严格对齐2025规范）
%% 规范要求：
%% “ABSTRACT”标题 Times New Roman三号加粗居中，段前0行，段后2行，单倍行距
%% 摘要内容：四号字体，两端对齐，首行缩进2字符，固定值20磅
%% 关键词：“KEY WORDS:”四号加粗，其后四号，半角分号隔开，末尾无标点，段前2行
%% -----------------------------------------------------------------
\newenvironment{enabstract}{%
  \cleardoublepage
  \markboth{\BUPT@label@abstractEN}{\BUPT@label@abstractEN}%
  \addcontentsline{toc}{chapter}{\BUPT@label@abstractEN}%
  \begin{center}
    {\rmfamily\zihao{3}\bfseries\BUPT@label@abstractEN}\par
  \end{center}
  \vspace{1.5em}
  \rmfamily\zihao{4}\setlength{\baselineskip}{20bp}\setlength{\parindent}{2\ccwd}%
}{%
  \par\cleardoublepage
}

\newcommand{\enkeywords}[1]{%
  \vspace{2.0em}\par\noindent
  {\rmfamily\zihao{4}\bfseries\BUPT@label@keywordsEN~}%
  {\rmfamily\zihao{4}#1}%
}

%% -----------------------------------------------------------------
%% 16. 符号说明环境
%% 规范要求：黑体三号居中，段前0，段后2行，内容宋体小四号固定值20磅
%% -----------------------------------------------------------------
\newenvironment{nomenclature}{%
  \cleardoublepage
  \markboth{\BUPT@label@nomenclature}{\BUPT@label@nomenclature}%
  \addcontentsline{toc}{chapter}{\BUPT@label@nomenclature}%
  \begin{center}
    {\heiti\zihao{3}\BUPT@label@nomenclature}\par
  \end{center}
  \vspace{1.5em}
  \songti\zihao{-4}\setlength{\baselineskip}{20bp}%
}{%
  \par\cleardoublepage
}

%% -----------------------------------------------------------------
%% 17. 附录、致谢、创新成果、学习经历环境
%% -----------------------------------------------------------------
%% 附录
\renewcommand{\appendix}{%
  \cleardoublepage
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\thechapter{\Alph{chapter}}%
  \ctexset{
    chapter = {
      name = {附录,},
      number = \Alph{chapter},
      format = \heiti\zihao{3}\centering,
      beforeskip = 0pt,
      afterskip = 32pt,
      aftername = \hspace{1em},
    }
  }%
  \renewcommand{\thefigure}{\thechapter-\arabic{figure}}%
  \renewcommand{\thetable}{\thechapter-\arabic{table}}%
  \renewcommand{\theequation}{\thechapter-\arabic{equation}}%
}

%% 致谢
\newenvironment{acknowledgement}{%
  \cleardoublepage
  \markboth{\BUPT@label@acknowledgement}{\BUPT@label@acknowledgement}%
  \addcontentsline{toc}{chapter}{\BUPT@label@acknowledgement}%
  \begin{center}
    {\heiti\zihao{3}\BUPT@label@acknowledgement}\par
  \end{center}
  \vspace{1.5em}
  \songti\zihao{-4}\setlength{\baselineskip}{20bp}\setlength{\parindent}{2\ccwd}%
}{%
  \par\cleardoublepage
}

%% 创新成果目录（2025规范最新命名：攻读学位期间取得的创新成果目录）
\newenvironment{publication}{%
  \cleardoublepage
  \markboth{\BUPT@label@publications}{\BUPT@label@publications}%
  \addcontentsline{toc}{chapter}{\BUPT@label@publications}%
  \begin{center}
    {\heiti\zihao{3}\BUPT@label@publications}\par
  \end{center}
  \vspace{1.5em}
  \songti\zihao{-4}\setlength{\baselineskip}{20bp}%
}{%
  \par\cleardoublepage
}

%% 作者学习经历
\newenvironment{experience}{%
  \cleardoublepage
  \markboth{\BUPT@label@experience}{\BUPT@label@experience}%
  \addcontentsline{toc}{chapter}{\BUPT@label@experience}%
  \begin{center}
    {\heiti\zihao{3}\BUPT@label@experience}\par
  \end{center}
  \vspace{1.5em}
  \songti\zihao{-4}\setlength{\baselineskip}{20bp}%
}{%
  \par\cleardoublepage
}

%% -----------------------------------------------------------------
%% 18. 参考文献环境与样式适配
%% 规范要求：标题黑体三号居中，内容宋体五号固定值20磅，另起一页
%% -----------------------------------------------------------------
\renewcommand{\bibfont}{\songti\zihao{5}\setlength{\baselineskip}{20bp}}
\setlength{\bibsep}{0pt}

\let\BUPT@orig@bibliography\bibliography
\renewcommand{\bibliography}[1]{%
  \cleardoublepage
  \markboth{参考文献}{参考文献}%
  \addcontentsline{toc}{chapter}{参考文献}%
  \begin{center}
    {\heiti\zihao{3}参考文献}\par
  \end{center}
  \vspace{1.5em}
  \begingroup
    \renewcommand{\chapter}[2]{}%
    \BUPT@orig@bibliography{#1}%
  \endgroup
}

\endinput
%% End of file `buptthesis.cls`.
