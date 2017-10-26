" Last modified: 20170313

" Don't add space before or after '='!
"==============================================================
"               Vundle Settings
"==============================================================
" NOTICE: comment out 'Plugin xxx' will disable the plugin such as c.vim!

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
"--------------------------------------------------
Plugin 'vim-scripts/indentpython.vim'   " for python, 2017.10.24
" plugin on GitHub repo
"Plugin 'wincent/command-t'      " fast file navigation. Need ruby, not working
Plugin 'tpope/vim-fugitive'     " Git wrapper
" select increasingly larger regions of text using the same key combination
Plugin 'terryma/vim-expand-region'
Plugin 'Valloric/YouCompleteMe'    " require VIM 7.4.143+. updated to vim 8.0 on 2017.10.24

" plugin from http://vim-scripts.org/vim/scripts.html
" or, https://github.com/vim-scripts/
" (Actually it's the same to call ':PluginInstall' and to clone the repo in directory /bundle.)
Plugin 'L9'                     " Vim-script library

"Plugin 'bufexplorer.zip'
Plugin 'minibufexpl.vim'    " problem: takes a lot of screen space when dealing with a lot of files(more than 8-10)
Plugin 'FuzzyFinder'        " buffer/file/command/tag/etc explorer with fuzzy matching

Plugin 'tagbar'
Plugin 'taglist.vim'       " tagbar is better than taglist
Plugin 'cscope.vim'

Plugin 'a.vim'
" should be a good plugin, if with some modification... Function template is ugly.
" It uses <F9> to compile, conflicting with tagbar
"Plugin 'c.vim'             
Plugin 'grep.vim'
Plugin 'matrix.vim'
Plugin 'OmniCppComplete'
Plugin 'The-NERD-Commenter'
"Plugin 'The-NERD-tree'
Plugin 'winmanager'

" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

"--------------------------------------------------
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"==============================================================
"               VIM Settings
"==============================================================
map ee :e ~/.vimrc<cr>
map eg :e /etc/vim/gvimrc<CR>
map em :e makefile<cr>
map ma :!make<cr>
nnoremap <CR> G         " jump to a certain line more comfortably

set go+=a               " automatically copy to clipboard when selecting some texts
set clipboard=unnamed   " use system clipboard

" Secrets of tabs in vim. http://tedlogan.com/techblog3.html
" set tab to 4 spaces
set tabstop=4   	" how many columns a tab counts for. (or: ts)
set shiftwidth=4    " how many columns text is indented with the reindent operations(<<, >>) and automatic C0style indentation
set cindent         " automatic C-style indentation
set expandtab       " hitting Tab in insert mode will produce the appropriate number of spaces. Autonym:noexpandtab
set softtabstop=4   " how many columns vim uses when you hit Tab in insert mode

set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp936
set nu			    " display line numbers
set hlsearch		" highlight search results
set incsearch		" incremental search

"==================== tips from http://www.tuicool.com/articles/f6feae
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
" 跳转至左方的窗口
nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
nnoremap <Leader>jw <C-W>j
" 定义快捷键在结对符之间跳转，助记pair
nmap <Leader>pa %

set splitright "prefer the new window on the right instead of the left.

"==================== colorscheme ====================
colorscheme default
set bg=light	" dark时文本颜色几乎一样,都是灰色.
set t_Co=256
"colorscheme molokai
"solarized,github,distinguished,codeschool
" blue(亮蓝); darkblue(黑底); delek(类似默认,红注释);desert(蓝注释);elflord;evening(高对比度);
" koehler;morning(灰底，对比度较好);murphy(黑底绿代码红注释);pablo/slate(默认底，几乎纯白字);
"peachpuff(注释完全看不清); ron(ok); shine(灰底一般); solarized(bad)

"==============================================================
"               Plugin Settings
"==============================================================

"==================== vim-expand-region ====================
" Usage:
"       Press '+' to expand the visual selection and '_' to shrink it.
" Mappings:
"map K <Plug>(expand_region_expand)
"map J <Plug>(expand_region_shrink)
" Default settings. (NOTE: Remove comments in dictionary before sourcing)
" NOTE: 'i''' is correct, don't edit!
let g:expand_region_text_objects = {
            \ 'iw' : 0,
            \ 'iW' : 0,
            \ 'i"' : 1,
            \ 'i''': 1,
            \ 'i]' : 1,
            \ 'ib' : 1,
            \ 'iB' : 1,
            \ 'il' : 0,
            \ 'ip' : 0,
            \ 'ie' : 0
            \ }

"==================== ctags & cscope ====================
map <C-F12> :!ctags -R --c++-kinds=+p --fileds=+iaS --extra=+q --languages-force=c++ .<cr>
"set tags+=~/Documents/ardupilot/tags
set tags=./tags;	" search for tags file to parent directory recursively
set tags+=~/.vim/tags/opencv_tags
set tags+=~/.vim/tags/cpp_tags

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

"==================== cscope ====================
" Use quickfix window to display cscope result
:set cscopequickfix=s-,c-,d-,i-,t-,e-

nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR> " find this C symbol
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR> " find this global definition
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR> " find functions called by this function
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR> " find functions calling this function
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR> " find this text string
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR> " change this text string
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR> " find this file
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR> " file files #including this file
" This is just like ctags
nmap <Leader>] :cs find g <C-R>=expand("<cword>")<CR><CR>

"==================== QuickFix ====================
" Usage: too many commands... use ":help quickfix" for details
" 1. quickfix commands
" :[count] c/l(display on quickfix list/current window?) + n/N/p/r/fir/la/q(next/previous/rewind/first/last/quit?) + [f[ile]][!]
" [!]: Without [!] this doesn't work when jumping to another buffer, the current buffer has been changed,
"      there is the only window for the buffer, and both 'hidden' and 'autowrite' are off.
"
"       :cc[!][nr]  : Display error. If [nr(number)] is omitted, the same error is displayed again
"       :ll[!][nr]  : Same as 'cc', except the location list for the current
"                     window is used instead of the quickfix list
"       :[count]cn[est][!] : Display the [count] next error in the list that includes a file name
"       :[count]lne[ext][!]: Same as 'cnext', except the location list for the
"                            current window is used instead of the quickfix list
"       :[count]cNext][!]
"       :[count]cp[revious] : Display the previous error in the list that includes a file name
"       :[count]cnf[ile][!] : Display the first error in the [count] next file
"                             in the list that includes a file name
"       :cr[ewind][!] [nr]  : Display error [nr]. If [nr] is omitted, the first error is displayed
"       :cf[ile] [errorfile]: Read the error file and jump to the first error
"       :cg[etfile] [errorfile]: Read the error file but don't jump to the first error
"       :caddf[ile] [errorfile]: Read the error file and add the errors from
"                                the errorfile to the current quickfix list
"       :cb[buffer] [buffnr] : Read the error list from the buffer
"       :cl[ist] [from] [, [to]]: List all errors
" 2. quickfix window
"       :cop[n] [height]    : Open a window to show the current list of errors
"       :ccl[ose]           : Close the quickfix window
"       :cw[indow] [height] : Open the quickfix window when there are recognized errors
nmap <F5> :cw<cr>
nmap <F6> :cn<cr>
nmap <F7> :cp<cr>

"==================== tagbar ====================
nmap <F9> :TagbarToggle<CR> 
let g:tagbar_autoclose=0
let g:tagbar_autofocus=1
let g:tagbar_sort=0
let g:tagbar_compact=1
let g:tagbar_foldlevel=1
let g:tagbar_type_arduino={
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

"==================== taglist ====================
" https://github.com/vim-scripts/taglist.vim
map <F10> :silent! Tlist<CR>         " TlistOpen; TlistClose; TlistToggle

let Tlist_Auto_Highlight_Tag=1       " Automatically highlight the current tag in the taglist
let Tlist_Auto_Open=0                " Automatically open taglist window on Vim startup
let Tlist_Auto_Update=1              " Automatically update the taglist to include newly edited files
let Tlist_Close_On_Select=0          " Automatically close the taglist window when a tag or file is selected
let Tlist_Compact_Format=0           " Remove extra information and blank lines from the taglist window
let Tlist_Ctags_Cmd="/usr/local/bin/ctags" " Specify the path to the ctags utility.
" changed from "/usr/bin" on 2017.10.24 due to some error
let Tlist_Display_Prototype=1        " Show prototypes instead of the tag names in the taglist window
let Tlist_Display_Tag_Scope=1        " Show tag scope next to the tag name
let Tlist_Enable_Fold_Column=1       " Show the fold indicator column in the taglist window
let Tlist_Exit_OnlyWindow=1          " Close Vim if the taglist is the only window
let Tlist_File_Fold_Auto_Close=1     " Close tag folds for inactive buffers
let Tlist_GainFocus_On_ToggleOpen=0  " Jump to taglist window on open
let Tlist_Highlight_Tag_On_TogleOpen=0 " On entering a buffer, automatically highlight the current tag
let Tlist_Inc_Winwidth=0             " Increase the Vim window to accommodate the taglist window
let Tlist_Process_File_Always=1      " Process files even when the taglist window is closed
let Tlist_Show_One_File=1            " Show tags for the current buffer only
let Tlist_Sort_Type="order"          " Sort method used for arranging the tags(name/order)
let Tlist_Use_Horiz_Window=0         " Use a horizontally split taglist window
let Tlist_Use_Right_Window=1         " Place the taglist window on the right side
let Tlist_Use_SingleClick=1	         " Jump to a tag on a single mouse click. default is double click.
"let Tlist_WinHeight=                " Horizontally split taglist window height
"let Tlist_WinWidth=                 " Vertically split taglist window width

let Tlist_Show_Menu=1                " Display the tags menu(GVim)
"let Tlist_Max_Submenu_Items=         " Maximum number of items in a tags sub-menu
"let Tlist_Max_Tag_Length=            " Maximum tag length used in a tag menu entry

"================================================================

"==================== omnicppcomplete ====================
" Usage:
"       ctrl+P: switch to previous option;
"       ctrl+N: switch to next option;
"       ctrl+E: exit the drop-down list;
"       ctrl+Y: accept current option and exit the drop-down list.
set nocp
filetype plugin on
" Global scope search toggle. 0=disabled, 1=enabled[default]
let OmniCpp_GlobalScopeSearch=1

" Namespace search method
" 0 = namespaces disabled
" 1 = search namespaces in the current buffer[default]
" 2 = search namespaces in the current buffer and in included files
let OmniCpp_NamespaceSearch=2
let OmniCpp_DefaultNamespaces=["std", "_GLIBCXX_STD"]


" Class scope completion mode
" 0 = auto[default]; 1 = always show all members
let OmniCpp_DisplayMode=0

" Show scope in abbreviation[default=0]
let OmniCpp_ShowScopeInAbbr=0

" Show prototype in abbreviation[default=0]
let OmniCpp_ShowPrototypeInAbbr=1

" Show access[default=1]
let OmniCpp_ShowAccess=1


" May complete behaviour
let OmniCpp_MayCompleteDot=1 "[default=1]
let OmniCpp_MayCompleteArrow=1 "[default=1]
let OmniCpp_MayCompleteScope=1 "[default=0]

" Select/Don't select first popup item. Only used when "completeopt" does not contain "longest".
" 0 = don't select first popup item[default]
" 1 = select first popup item (inserting it to the text)
" 2 = select first popup item (without inserting it to the text)
let OmniCpp_SelectFirstItem=0

" Close complete window automatically
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest 

" Change color scheme of the autocomplete window
" Pmenu: color of all items; PmenuSel: color of selected item
" guibg/guifg: background/foreground color
highlight Pmenu guibg=darkgrey  guifg=black
highlight PmenuSel guibg=lightgrey guifg=black
"==============================================================

"================auto complete<C-X><C-O>=======================
" ctrl+X ctrl+L     :整行补全;
" ctrl+X Ctrl+N     :根据当前文件里关键字补全;
" ctrl+X ctrl+T     :根据同义词字典补全;
" ctrl+X ctrl+I     :根据头文件内关键字补全;
" ctrl+X ctrl+]     :根据标签补全;
" ctrl+X ctrl+F     :补全文件名;
" ctrl+X ctrl+D     :补全宏定义;
" ctrl+X ctrl+V     :补全vim命令;
" ctrl+X ctrl+U     :用户自定义补全方式;
" ctrl+X ctrl+S     :拼写建议.

inoremap <expr> <CR>       pumvisible()?"\<C-Y>":"\<CR>"
"inoremap <expr> <C-J>      pumvisible()?"\<PageDown>\<C-N>\<C-P>":"\<C-X><C-O>"
inoremap <expr> <C-J>      pumvisible()?"<C-N>":"\<C-X><C-O>"
"inoremap <expr> <C-K>      pumvisible()?"\<PageUp>\<C-P>\<C-N>":"\<C-K>"
inoremap <expr> <C-K>      pumvisible()?"<C-P>":"\<C-K>"
inoremap <expr> <C-U>      pumvisible()?"\<C-E>":"\<C-U>" 
" 如果下拉菜单弹出，回车映射为接受当前所选项目，否则，仍映射为回车；
" 如果下拉菜单弹出，CTRL-J映射为在下拉菜单中向下翻页。否则映射为CTRL-X CTRL-O；
" 如果下拉菜单弹出，CTRL-K映射为在下拉菜单中向上翻页，否则仍映射为CTRL-K；
" 如果下拉菜单弹出，CTRL-U映射为CTRL-E，即停止补全，否则，仍映射为CTRL-U；
"==============================================================

"==================== miniBufExpr ====================
" usage: ctrl+Tab, switch to previous buffer;
"        ctrl+shift+Tab: switch to next buffer;
"        ctrl+arrows/h,j,k,l: switch to a certain window.
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplMapWindowNavVim=1
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplModSelTarget=1
"==============================================================

"==================== FuzzyFinder ====================
" https://github.com/vim-scripts/FuzzyFinder
"Usage: You can launch FuzzyFinder by the following commands:

    "Command           Mode ~
    "|:FufBuffer|       - Buffer mode (|fuf-buffer-mode|)
    "|:FufFile|         - File mode (|fuf-file-mode|)
    "|:FufCoverageFile| - Coverage-File mode (|fuf-coveragefile-mode|)
    "|:FufDir|          - Directory mode (|fuf-dir-mode|)
    "|:FufMruFile|      - MRU-File mode (|fuf-mrufile-mode|)
    "|:FufMruCmd|       - MRU-Command mode (|fuf-mrucmd-mode|)
    "|:FufBookmarkFile| - Bookmark-File mode (|fuf-bookmarkfile-mode|)
    "|:FufBookmarkDir|  - Bookmark-Dir mode (|fuf-bookmarkdir-mode|)
    "|:FufTag|          - Tag mode (|fuf-tag-mode|)
    "|:FufBufferTag|    - Buffer-Tag mode (|fuf-buffertag-mode|)
    "|:FufTaggedFile|   - Tagged-File mode (|fuf-taggedfile-mode|)
    "|:FufJumpList|     - Jump-List mode (|fuf-jumplist-mode|)
    "|:FufChangeList|   - Change-List mode (|fuf-changelist-mode|)
    "|:FufQuickfix|     - Quickfix mode (|fuf-quickfix-mode|)
    "|:FufLine|         - Line mode (|fuf-line-mode|)
    "|:FufHelp|         - Help mode (|fuf-help-mode|)
" It is recommended to map these commands.
nnoremap <leader>ff :FufFile<CR>
nnoremap <leader>fb :FufBuffer<CR>
nnoremap <leader>fd :FufDir<CR>
nnoremap <leader>ft :FufTag<CR>

" Typing <C-w> deletes one block of an entered pattern before the cursor, like
" a directory name.
"
" with <C-s> (|g:fuf_keyPrevPattern|) and <C-^> (|g:fuf_keyNextPattern|), You
" can recall patterns which have been entered before from history.
"
" You can open a selected item in various ways:
"
"         <CR>  (|g:fuf_keyOpen|)        - opens in a previous window.
"         <C-j> (|g:fuf_keyOpenSplit|)   - opens in a split window.
"         <C-k> (|g:fuf_keyOpenVsplit|)  - opens in a vertical-split window.
"         <C-l> (|g:fuf_keyOpenTabpage|) - opens in a new tab page.
"
" To cancel and return to previous window, just leave Insert mode.
"
" With <C-\><C-\> (|g:fuf_keySwitchMatching|), You can switch search method
" between fuzzy matching and partial matching.
"
" With <C-t> (|g:fuf_keyNextMode|) and <C-y> (|g:fuf_keyPrevMode|), You can
"switch current mode without leaving Insert mode .
"==============================================================

"==================== WinManager ====================
" Usage:
"       <F1> help; <cr>: enter directory or open file;
"       -: return to parent directory;
"       d: make directory;(not working)
"       D: delete dir/file;
"       i: switch display mode(display detailed info or not);
"       R: rename dir/file;
"       s: switch sorting mode(sorted by name/size/time);
"       x: open file with specified program(not working)

" Window layout. WinManager only recognizes plugins whose name appears in this variable
"let g:winManagerWindowLayout="FileExplorer|TagList"

" The width of the explorer areas.[default=25]
let g:winManagerWidth=30

nmap <silent> <F8> :WMToggle<cr>
"==============================================================

"==================== NERD_commenter ====================
let NERDShutUp=1
" \代表<leader>
" \ca，在可选的注释方式之间切换，比如C/C++ 的块注释/* */和行注释//
" \cc，注释当前行
" \c，切换注释/非注释状态
" \cs，以”性感”的方式注释 (宽松格式的块注释)
" \cA，在当前行尾添加注释符，并进入Insert模式
" \cu，取消注释
" \c<空格>,如果被选区域有部分被注释，则对被选区域执行取消注释操作，其它情况执行反转注释操作
" \cm 对被选区域用一对注释符进行注释，前面的注释对每一行都会添加注释
" \cy 添加注释，并复制被添加注释的部分
" \c$ 注释当前光标到该行结尾的内容	(只能是/**/格式!)
" \cl \cb 左对齐和左右对齐，左右对齐主要针对/**/ 
" Normal模式下，几乎所有命令前面都可以指定行数
" Visual模式下执行命令，会对选中的特定区块进行注释/反注释
"==============================================================

"==================== SuperTab加速补全 ====================
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
"==================== Alternate Files quickly(.c->.h etc) ======================
" https://github.com/vim-scripts/a.vim
" Usage:
"       :A switches to the header file corresponding to the current file being edited (or vise versa)
"       :AS splits and switches
"       :AV vertical splits and switches
"       :AT new tab and switches(not a terminal tab, similar to a buffer).
"       :AN cycles through matches
"       :IH switches to file under cursor
"       :IHS splits and switches
"       :IHV vertical splits and switches
"       :IHT new tab and switches
"       :IHN cycles through matches
"       <Leader>ih switches to file under cursor
"       <Leader>is switches to the alternate file of file under cursor (e.g. on <foo.h> switches to foo.cpp)
"       <Leader>ihn cycles through matches
nnoremap <silent> <F12> :A<CR>
"=============================================================

"==================== Grep ====================
" https://github.com/vim-scripts/grep.vim
" Usage:
"       :Grep       :search for the specified pattern in the specified files;
"       :Rgrep      :run recursive grep;
"       :GrepBuffer :search for a pattern on all open buffers;
"       :Bgrep      :ditto(same as above);
"       :Fgrep; :Rfgre; :Egrep; :Regrep; :Agrep; :Ragrep.
"
"       :Grep [<grep_options>] [<search_pattern> [<file_name(s)>]]
"       :GrepBuffer [<grep_options>] [<search_pattern>]
"       options: -i(ignore case); -w(search for a word)
nnoremap <silent> <F3> :Grep<CR>

"==================== pde语法高亮(arduino.vim) ====================
 autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino
"语法高亮文件是/usr/share/vim/vim74/arduino.vim
"直接把文件名改成pdf是不是就不需要这句设置了？

"==================== fold ====================
"/usr/share/vim/vim74/doc/fold.txt
"usr/share/vim/vim74/doc/usr_28.txt
set foldmethod=syntax
" FOLDLEVEL: The higher the more folded regions are open.
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
" let &guioptions=substitute(&guioptions, "t", "", "g")


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
"===============================================================
" python config 2017.10.24

"" python indent, PEP8 style
"au BufNewFile,BufRead *.py
            "\ set tabstop=4 |
            "\ set softtabstop=4 |
            "\ set shiftwidth=4 |
            "\ set textwidth=79 |
            "\ set expandtab |
            "\ set autoindent |
            "\ set fileformat=unix |
"" set indent for different files for full stack development
au BufNewFile,BufRead *.js, *.html, *.css |
            \ set tabstop=2 |
            \ set softtabstop=2 |
            \ set shiftwidth=2 |

" python with virtualenv support
py << EOF
import os.path
import sys
import vim
if 'VIRTUA_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir,'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

"ignore files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']

 "I don't like swap files
 set noswapfile
 "------------Start Python PEP 8 stuff----------------
 " Number of spaces that a pre-existing tab is equal to.
 au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

 "spaces for indents
 au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
 au BufRead,BufNewFile *.py,*.pyw set expandtab
 au BufRead,BufNewFile *.py set softtabstop=4

 " Use the below highlight group when displaying bad whitespace is desired.
 highlight BadWhitespace ctermbg=red guibg=red

 " Display tabs at the beginning of a line in Python mode as bad.
 au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
 " Make trailing whitespace be flagged as bad.
 au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

 " Wrap text after a certain number of characters
 au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

 " Use UNIX (\n) line endings.
 au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

 " For full syntax highlighting:
 let python_highlight_all=1
 syntax on

 " Keep indentation level from previous line:
 autocmd FileType python set autoindent

 " make backspaces more powerfull
 set backspace=indent,eol,start


 "Folding based on indentation:
 autocmd FileType python set foldmethod=indent
 "use space to open folds
 nnoremap <space> za
 "----------Stop python PEP 8 stuff--------------
