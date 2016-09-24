map ee :e ~/.vimrc<cr>
map eg :e /etc/vim/gvimrc<CR>
map em :e makefile<cr>
map ma :!make<cr>

" tab设置为4个空格
set tabstop=4   	" ts for tabstop
set softtabstop=4
set shiftwidth=4    " 缩进的空格数
set cindent         " 使用C/C++的自动缩进方式
set expandtab	" 非空格:noexpandtab

colorscheme default
set bg=light	" dark时文本颜色几乎一样,都是灰色.
"colorscheme molokai
set t_Co=256
"solarized,github,distinguished,codeschool
" blue(亮蓝); darkblue(黑底); delek(类似默认,红注释);desert(蓝注释);elflord;evening(高对比度);
" koehler;morning(灰底，对比度较好);murphy(黑底绿代码红注释);pablo/slate(默认底，几乎纯白字);
"peachpuff(注释完全看不清); ron(ok); shine(灰底一般); solarized(bad)

"=========tags & cscope=======================================
"set tags,只用一个tags则用=；使用多个tags时用+=
"set tags+=~/Documents/ardupilot/tags
set tags=./tags;	"向上级目录递归查找tags文件
cs reset
"if has("cscope")
"	set csprg=/usr/bin/cscope  "指定我们加载cscope.out的程序！
"	set csto=0
"	set cst
"	set nocsverb
"	" add any database in current directory
"	if filereadable("cscope.out")
"		cs add cscope.out    "用前面指定的cscope加载cscope.out
"		" else add database pointed to by environment
"	elseif $CSCOPE_DB != ""
"		cs add $CSCOPE_DB
"	endif
"	set csverb
"endif
"
cs add ~/Github/ardupilot/cscope.out ~/Github/ardupilot
cs add ~/Github/Flying-PCB/cscope.out
"===============================================================
"
" An example for a vimrc file.
"
" Maintainer: Bram Moolenaar <Bram@vim.org>
" Last change: 2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"    for OpenVMS:  sys$login:.vimrc


" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif


" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible


" allow backspacing over everything in insert mode
set backspace=indent,eol,start


if has("vms")
  set nobackup " do not keep a backup file, use versions instead
else
  set backup " keep a backup file
endif
set history=50 " keep 50 lines of command line history
set ruler " show the cursor position all the time
set showcmd " display incomplete commands
set incsearch " do incremental searching


" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")


" Don't use Ex mode, use Q for formatting
map Q gq


" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>


" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif


" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif


" Only do this part when compiled with support for autocommands.
if has("autocmd")


  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on


  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!


  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78


  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif


  augroup END


else


  set autoindent " always set autoindenting on


endif " has("autocmd")


" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
 \ | wincmd p | diffthis
endif

set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp936
set nu			"显示行号
set hlsearch		"高亮显示搜索结果
set incsearch		"搜索时输入的同时进行匹配




"============ctags设定========================================
:set cscopequickfix=s-,c-,d-,i-,t-,e-
"这个是设定是否使用 quickfix 窗口来显示 cscope 结果

nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>
"想加一个替代ctags，不管用？。。。
"nmap <Leader>] :cs find g <C-R>=expand("<cword>")<CR><CR>


"========QuickFix设定(:cw调出)===============================
nmap <F6> :cn<cr>	"切换到下一个结果
nmap <F7> :cp<cr>	"切换到上一个结果


"============taglist的相关设置================================= 
"TlistUpdate可以更新tags 
map <F3> :silent! Tlist<CR>	"按下F3就可以呼出了
let Tlist_Show_One_File=1     "不同时显示多个文件的tag，只显示当前文件的    
let Tlist_Exit_OnlyWindow=1   "如果taglist窗口是最后一个窗口，则退出vim   
let Tlist_Ctags_Cmd="/usr/bin/ctags" "将taglist与ctags关联
let Tlist_Use_SingleClick=1	"单击tag就跳到该tag定义的位置，默认为双击
let Tlist_Auto_Open=0		"1:在启动VIM后，自动打开taglist窗口
let Tlist_File_Fold_Auto_Close=1
"当同时显示多个文件中的tag时，设置Tlist_File_Fold_Auto_Close为１，可使taglist只显示当前文件tag，其它文件的tag都被折叠起来。

"- Tlist_Ctags_Cmd选项用于指定你的Exuberant ctags程序的位置，如果它没在你PATH变量所定义的路径中，需要使用此选项设置一下；

"- 如果你不想同时显示多个文件中的tag，设置Tlist_Show_One_File为1。缺省为显示多个文件中的tag；

"- 设置Tlist_Sort_Type为”name”可以使taglist以tag名字进行排序，缺省是按tag在文件中出现的顺序进行排序。按tag出现的范围（即所属的namespace或class）排序，已经加入taglist的TODO List，但尚未支持；

"- 如果你在想taglist窗口是最后一个窗口时退出VIM，设置Tlist_Exit_OnlyWindow为１；

"- 如果你想taglist窗口出现在右侧，设置Tlist_Use_Right_Window为１。缺省显示在左侧。

"- 在gvim中，如果你想显示taglist菜单，设置Tlist_Show_Menu为１。你可以使用Tlist_Max_Submenu_Items和Tlist_Max_Tag_Length来控制菜单条目数和所显示tag名字的长度；

"- 缺省情况下，在双击一个tag时，才会跳到该tag定义的位置，如果你想单击tag就跳转，设置Tlist_Use_SingleClick为１；

"- 如果你想在启动VIM后，自动打开taglist窗口，设置Tlist_Auto_Open为1；

"- 如果你希望在选择了tag后自动关闭taglist窗口，设置Tlist_Close_On_Select为1；

"- 当同时显示多个文件中的tag时，设置Tlist_File_Fold_Auto_Close为１，可使taglist只显示当前文件tag，其它文件的tag都被折叠起来。

"- 在使用:TlistToggle打开taglist窗口时，如果希望输入焦点在taglist窗口中，设置Tlist_GainFocus_On_ToggleOpen为1；

"- 如果希望taglist始终解析文件中的tag，不管taglist窗口有没有打开，设置Tlist_Process_File_Always为1；

"- Tlist_WinHeight和Tlist_WinWidth可以设置taglist窗口的高度和宽度。Tlist_Use_Horiz_Window为１设置taglist窗口横向显示；
"================================================================

"=============omnicppcomplete配置===============================
set nocp
filetype plugin on
let OmniCpp_NamespaceSearch = 1 " 命名空间查找控制。
" 0 : 禁止查找命名空间 1 : 查找当前文件缓冲区内的命名空间(缺省)
" 2 : 查找当前文件缓冲区和包含文件中的命名空间
let OmniCpp_DisplayMode = 0 " 类成员显示控制(是否显示全部公有(public)私有(private)保护(protected)成员)。
" 0 : 自动 1 : 显示所有成员
let OmniCpp_GlobalScopeSearch = 1 " 全局查找控制。0:禁止；1:允许(缺省)
let OmniCpp_ShowAccess = 1	" 是否显示访问控制信息('+', '-', '#')。0/1, 缺省为1(显示).
let OmniCpp_ShowPrototypeInAbbr = 1 " 显示函数参数列表
let OmniCpp_MayCompleteDot = 1   " 输入 .  后自动补全.0/1, 缺省为1
let OmniCpp_MayCompleteArrow = 1 " 输入 -> 后自动补全.0/1, 缺省为1
let OmniCpp_MayCompleteScope = 1 " 输入 :: 后自动补全.0/1, 缺省为1
let OmniCpp_SelectFirstItem = 0 " 是否自动选择第一个匹配项。仅当"completeopt"不为"longest"时有效。
" 0 : 不选择第一项(缺省) 1 : 选择第一项并插入到光标位置 2 : 选择第一项但不插入光标位置

let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"] " 默认命名空间列表，项目间使用','隔开。
" 自动关闭补全窗口
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest 

" 改变自动补全窗口的配色.Pmenu 是所有项的配色，PmenuSel 是选中项的配色，
" guibg 和 guifg 分别对应背景色和前景色
highlight Pmenu guibg=darkgrey  guifg=black
highlight PmenuSel guibg=lightgrey guifg=black
"===============================================================
"
"================auto complete<C-X><C-O>=======================
" mapping
inoremap <expr> <CR>       pumvisible()?"\<C-Y>":"\<CR>"
"inoremap <expr> <C-J>      pumvisible()?"\<PageDown>\<C-N>\<C-P>":"\<C-X><C-O>"
inoremap <expr> <C-J>      pumvisible()?"<C-N>":"\<C-X><C-O>"
"inoremap <expr> <C-K>      pumvisible()?"\<PageUp>\<C-P>\<C-N>":"\<C-K>"
inoremap <expr> <C-K>      pumvisible()?"<C-P>":"\<C-K>"
inoremap <expr> <C-U>      pumvisible()?"\<C-E>":"\<C-U>" 
"     如果下拉菜单弹出，回车映射为接受当前所选项目，否则，仍映射为回车；
"     如果下拉菜单弹出，CTRL-J映射为在下拉菜单中向下翻页。否则映射为CTRL-X CTRL-O；
"     如果下拉菜单弹出，CTRL-K映射为在下拉菜单中向上翻页，否则仍映射为CTRL-K；
"     如果下拉菜单弹出，CTRL-U映射为CTRL-E，即停止补全，否则，仍映射为CTRL-U；
"
"=============WinManager=======================================
" 设置winmanager
" 设置界面分割
"let g:winManagerWindowLayout = "FileExplorer|TagList"
"设置winmanager的宽度，默认为25
let g:winManagerWidth = 30
"定义打开关闭winmanager快捷键为F8
nmap <silent> <F8> :WMToggle<cr>
"在进入vim时自动打开winmanager
let g:AutoOpenWinManager = 1
nmap wm :WMToggle<cr>	"F8挺好的，这个麻烦
"==============================================================

"=============NERD_commenter===================================
let NERDShutUp=1
" \是<leader>
"    \ca，在可选的注释方式之间切换，比如C/C++ 的块注释/* */和行注释//
"    \cc，注释当前行
"    \c，切换注释/非注释状态
"    \cs，以”性感”的方式注释 (宽松格式的块注释)
"    \cA，在当前行尾添加注释符，并进入Insert模式
"    \cu，取消注释
"    \c<空格>,如果被选区域有部分被注释，则对被选区域执行取消注释操作，其它情况执行反转注释操作
"    \cm 对被选区域用一对注释符进行注释，前面的注释对每一行都会添加注释
"    \cy 添加注释，并复制被添加注释的部分
"    \c$ 注释当前光标到该行结尾的内容	(只能是/**/格式!)
"    \cl \cb 左对齐和左右对齐，左右对齐主要针对/**/ 
"    Normal模式下，几乎所有命令前面都可以指定行数
"    Visual模式下执行命令，会对选中的特定区块进行注释/反注释
"==============================================================

"=============SuperTab加速补全=================================
" let g:SuperTabDefaultCompletionType="<C-X><C-O>"
" 设置按下<Tab>后默认的补全方式, 默认是<C-P>,
" 现在改为<C-X><C-O>. 关于<C-P>的补全方式,
" 还有其他的补全方式, 你可以看看下面的一些帮助:
" :help ins-completion
" :help compl-omni
" let g:SuperTabRetainCompletionType=2
" 0 - 不记录上次的补全方式
" 1 - 记住上次的补全方式,直到用其他的补全命令改变它
" 2 - 记住上次的补全方式,直到按 ESC 退出插入模式为止
" ============================================================
"
"==============A插件（源文件头文件切换）======================
nnoremap <silent> <F12> :A<CR>
"=============================================================
"
nnoremap <silent> <F3> :Grep<CR>



set splitright "prefer the new window on the right instead of the left.

"========================================http://www.tuicool.com/articles/f6feae
" 定义快捷键的前缀，即<Leader>
let mapleader=";"
" 定义快捷键到行首和行尾
nmap lb 0
nmap le $
" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p
" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>
" 依次遍历子窗口
nnoremap nw <C-W><C-W>
" 跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
" 跳转至方的窗口
nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
nnoremap <Leader>jw <C-W>j
" 定义快捷键在结对符之间跳转，助记pair
nmap <Leader>pa %

"====pde语法高亮(arduino.vim)===========
 autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino
"语法高亮文件是/usr/share/vim/vim74/arduino.vim
"直接把文件名改成pdf是不是就不需要这句设置了？
"================================================

"===============fold=============================
"/usr/share/vim/vim74/doc/fold.txt
"usr/share/vim/vim74/doc/usr_28.txt
set foldmethod=syntax
"FOLDLEVEL: The higher the more folded regions are open.
set foldlevel=99
"怎么设置刚打开文件是全展开？
set foldenable "doesn't work
"下面这句的效果：光标移到收起的部分，自动将其展开
"set foldopen=all
"设置颜色怎么不管用？
highlight Folded guibg=grey guifg=blue
highlight FoldColumn guibg=darkgrey guifg=white
"sets the width for a column on the side of the window to indicate folds.
"set foldcolumn=3	"foldcolumn的白条实在是太丑了。。
"
"
"=============tagbar============
nmap <F9> :TagbarToggle<CR> 
let g:tagbar_autoclose = 0
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1
let g:tagbar_foldlevel = 1
let g:tagbar_type_arduino = {
    \ 'ctagstype' : 'c++',
    \ 'kinds'     : [
        \ 'd:macros:1:0',
        \ 'p:prototypes:1:0',
        \ 'g:enums',
        \ 'e:enumerators:0:0',
        \ 't:typedefs:0:0',
        \ 'n:namespaces',
        \ 'c:classes',
        \ 's:structs',
        \ 'u:unions',
        \ 'f:functions',
        \ 'm:members:0:0',
        \ 'v:variables:0:0'
    \ ],
    \ 'sro'        : '::',
    \ }
