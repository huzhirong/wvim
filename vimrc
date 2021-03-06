set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"basic配置
set go= "设置没有GUI界面
set number "显示行号
set autoindent "使用对齐格式，也就是把当前行的的对齐格式应该到下一行。
set smartindent "依据上面的对齐格式，智能的选择对齐方式。
set tabstop=4 "设置tab键为4个空格。
set shiftwidth=4 "设置当行之间交错时使用4个空格。
set ruler "设置在编辑过程中，在右下角显示光标位置的状态行。
set showmatch "高亮显示匹配的括号。
syntax enable "开启语法
syntax on "高亮语法
set nobackup "设置没有备份文件。
set noswapfile "设置没有交换文件。
set hlsearch " 查找结果高亮度显示
set incsearch
"imap { {<CR>}<ESC>O
set cursorline "高亮当前行
set cursorcolumn "高亮当前列
set statusline=%h%=%-14.(%l,%c%V%)\ %<%p%%\ \ \ [%L]\ \ \ %{strftime('%y-%m-%d\ %A')}
"hi CursorLine guibg=#FFFFC0
set fenc=utf-8
set encoding=utf-8 "设置编码
set fileencodings=utf-8,gb2312,gbk,gb18030,latin-1 "设置文件编码
"set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8
set encoding=cp936  "同时支持GBK和UTF-8编码
"colorscheme candy
colorscheme desert "设置背景颜色
"inoremap <tab> <C-x><C-l>
let g:mapleader = "," "设置全局快捷键为,
imap <leader>e <esc>
map <leader>q :q!<CR> "退出文件的快捷键为,q"
map <leader>w :w<CR> "保存文件的快捷键为,w
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l
map <leader>ee :e $vim/_vimrc "在文件中编辑.vimrc文件
filetype indent on
filetype plugin on
filetype plugin indent on

"pathogen
call pathogen#infect()

"NERD_tree插件
map nt :NERDTreeToggle<CR>
let NERDTreeWinPos="right"
let NERDTreeShowBookmarks=1

"git-vim
set laststatus=2
set statusline=%{GitBranch()}

"winmanager插件
"nmap wm :WMToggle<cr>

autocmd FileType php setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=79
autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=79
autocmd FileType coffee,javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=79
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=79
autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
autocmd FileType sass,scss,css setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=79

" NeoComplCache
let g:neocomplcache_enable_at_startup=1
let g:neoComplcache_disableautocomplete=1
"let g:neocomplcache_enable_underbar_completion = 1
"let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_smart_case=1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
set completeopt-=preview

"Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)

let g:neosnippet#snippets_directory='c:/Program Files/Vim/vimfiles/bundle/snipmate-snippets/snippets'

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" SuperTab
"let g:SuperTabDefultCompletionType='context'
let g:SuperTabDefaultCompletionType = '<C-X><C-U>'
let g:SuperTabRetainCompletionType=2


"Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType c setlocal omnifunc=ccomplete#Complete

nmap tt :TagbarToggle<cr>
let g:tagbar_left=1
let g:tagbar_width=30
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1


"bufexplorer插件
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1

"taglist插件
"let g:Tlist_Use_Right_Window=1
"let g:Tlist_Show_One_File=1
"let g:Tlist_Compact_Format=1
"let Tlist_Exit_OnlyWindow=1
"let g:winManagerWindowLayout='FileExplorer|TagList'

"ColorSchemeExplorer插件
"map <leader>co :ColorSchemeExplorer<CR> ",co选择背景颜色

"ScrollColors插件
map <leader>sc :SCROLL

"zencoding插件
let g:user_zen_expandabbr_key = '<c-j>'
let g:use_zen_complete_tag = 1

"vimwiki插件
let g:vimwiki_w32_dir_enc = 'utf-8'
nmap <F3> :Vimwiki2HTML<cr> "把当前wiki文件生成html
nmap <F4> :VimwikiAll2HTML<cr> "把所有wiki文件生成html
let g:vimwiki_camel_case = 0 "不要将驼峰式词组作为Wiki词条
let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,br,hr,div,del,code,red,center,left,right,h4,h5,h6,pre' "声明可以在wiki里面使用的HTML标签
let g:vimwiki_list = [{'path': 'D:/vimwiki/wiki_techno/', 'path_html': 'D:/vimwiki/wiki_techno/html/', 'template_path': 'D:/vimwiki/wiki_techno/html/template/', 'template_default': 'default', 'template_ext': '.html', 'auto_export': 1},{'path': 'D:/vimwiki/wiki_literature/', 'path_html': 'D:/vimwiki/wiki_literature/html/', 'template_path': 'D:/vimwiki/wiki_literature/html/template/', 'template_default': 'default', 'template_ext': '.html', 'auto_export': 1}]
let g:vimwiki_browsers=['C:\Program Files\Mozilla Firefox\firefox.exe'] "用firefox来预览wiki

"CSS换行插件
map <leader>cp :CssPretty<CR>

"grepvim
"map <leader>c :copen<CR>
"map <leader>n :cn<CR>

"ctrlp
map <leader>o :CtrlP<CR>
let g:ctrlp_max_height = 20
let g:ctrlp_working_path_mode = 'rw'

map <F8> :%s/^\(\s*\)</\1'</g<CR>
map <F9> :%s/>\(,\)\?\s*$/\>'\1/g<CR>
map <F10> :%s/>'$/>',/g<CR>
