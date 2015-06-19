"===== neobundle =====
"----- init -----
set nocompatible               " be iMproved
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/.vim/bundle/'))
  NeoBundleFetch 'Shougo/neobundle.vim'

"----- plugins -----
" originalrepos on github
"NeoBundle 'Shougo/neobundle.vim'
"NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
"NeoBundle 'Shougo/neocomplcache-snippets-complete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
"NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'

" simplenote
" NeoBundle 'mrtazz/simplenote.vim'
" ディレクトリをツリー表示
NeoBundle 'scrooloose/nerdtree'

" vimplenote
" NeoBundle 'mattn/webapi-vim'
" NeoBundle 'mattn/vimplenote-vim'

" メモ書き
NeoBundle 'glidenote/memolist.vim'
NeoBundle 'fuenor/qfixgrep.git'

""NeoBundle 'https://bitbucket.org/kovisoft/slimv'

"vim-latex
"NeoBundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'

" markdown
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

"vim-lldb
"NeoBundle "gilligan/vim-lldb"
"NeoBundle "tpope/vim-pathogen"

"ファイルタイプに合ったコメントアウトを入れる
NeoBundle "tyru/caw.vim.git"
" \cで行の先頭にコメントをつけたり外したりできる
"nmap <Leader>c <Plug>(caw:i:toggle)
"vmap <Leader>c <Plug>(caw:i:toggle)
nmap co <Plug>(caw:i:toggle)
vmap co <Plug>(caw:i:toggle)

" colorscheme
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'vim-scripts/twilight'
"----- ~ plugins -----
  call neobundle#end()
endif

" Installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
  "finish
endif
"----- ~ init -----

" write after neobundles
filetype plugin indent on     " required!
filetype indent on
"===== ~ neobundle =====

"===== tex suite =====
imap <C-p> <Plug>IMAP_JumpForward 
nmap <C-p> <Plug>IMAP_JumpForward 
vmap <C-p> <Plug>IMAP_JumpForward 
"===== ~ tex suite =====

"===== neocomplcache =====
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplcache.
    let g:neocomplcache_enable_at_startup = 1
    " Use smartcase.
    let g:neocomplcache_enable_smart_case = 1
    " Use camel case completion.
    let g:neocomplcache_enable_camel_case_completion = 1
    " Use underbar completion.
    let g:neocomplcache_enable_underbar_completion = 1
    " Set minimum syntax keyword length.
    let g:neocomplcache_min_syntax_length = 3
    let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
    
    " Define dictionary.
    let g:neocomplcache_dictionary_filetype_lists = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
            \ }
    
    " Define keyword.
    if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns['default'] = '\h\w*'


    " Plugin key-mappings.
    "imap <C-k>     <Plug>(neocomplcache_snippets_expand)
    "smap <C-k>     <Plug>(neocomplcache_snippets_expand)
    "inoremap <expr><C-g>     neocomplcache#undo_completion()
    "inoremap <expr><C-l>     neocomplcache#complete_common_string()
	imap <C-k> <Plug>(neosnippet_expand_or_jump)
	smap <C-k> <Plug>(neosnippet_expand_or_jump)
	imap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
	smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
	" For snippet_complete marker.
	if has('conceal')
	  set conceallevel=2 concealcursor=i
	endif

    " SuperTab like snippets behavior.
    "imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
    
    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplcache#close_popup()
    inoremap <expr><C-e>  neocomplcache#cancel_popup()
    
    " AutoComplPop like behavior.
    "let g:neocomplcache_enable_auto_select = 1
" ===== ~ neocomplcache =====

" ===== memolist =====
" memolist.vim settings
let g:memolist_path = "~/Dropbox/vim/memolist"
let g:memolist_template_dir_path = "~/.vim/template/memolist"
let g:memolist_memo_suffix = "md"
let g:memolist_memo_date = "%Y-%m-%d"
let g:memolist_prompt_tags = 1
let g:memolist_qfixgrep = 1
let g:memolist_filename_prefix_none = 1
let g:memolist_unite = 1
let g:memolist_unite_source = "file_rec"
let g:memolist_unite_option = "-auto-preview -start-insert"

" command
command! -nargs=0 -bar KobitoAdd execute 'silent !open -a Kobito.app ' . expand('%:p')
command! -nargs=? MyMemoNew :call memolist#new(<q-args>)|w|KobitoAdd

" keymap
nnoremap <Space>mn :<C-u>MyMemoNew<CR>
nnoremap <Space>ml :<C-u>MemoList<CR>
nnoremap <Space>mg :<C-u>MemoGrep<CR>
" ===== ~ memolist =====



"===== general =====
" File ---------------------------------
set autoread                          " 更新時自動再読込み
set hidden                            " 編集中でも他のファイルを開けるようにする
set noswapfile                        " スワップファイルを作らない
set nobackup                          " バックアップを取らない
autocmd BufWritePre * :%s/\s\+$//ge   " 保存時に行末の空白を除去する
syntax on                             " シンタックスカラーリングオン
"バックアップファイルを作るディレクトリ
"set backupdir=$HOME/.vimbackup
"スワップファイル用のディレクトリ
"set directory=$HOME/.vimbackup
"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
" set browsedir=buffer 

"---------------------------------------------------------------------------
" 検索の挙動に関する設定:
"
" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase
" インクリメンタルサーチ
set incsearch
" 検索ハイライト
set hlsearch
 
"---------------------------------------------------------------------------
" 編集に関する設定:
"
" タブの画面上での幅
set tabstop=4
" 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set softtabstop=4
" 自動インデントでずれる幅
set shiftwidth=4
" タブをスペースに展開する/ しない (expandtab:展開する)
set expandtab
" 自動的にインデントする (noautoindent:インデントしない)
set autoindent
" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
"set formatoptions+=mM
" 自動改行を無効化
set formatoptions=q


"---------------------------------------------------------------------------
"" GUI固有ではない画面表示の設定:
""
"" タイトルを表示する
"set title
" 行番号を表示 (nonumber:非表示)
set number
"" ルーラーを表示 (noruler:非表示)
"set ruler
"" タブや改行を表示 (list:表示)
"set nolist
"" どの文字でタブや改行を表示するかを設定
""set listchars=tab:>-,extends:<,trail:-,eol:<
"" 長い行を折り返して表示 (nowrap:折り返さない)
"set wrap
"" 常にステータス行を表示 (詳細は:he laststatus)
"set laststatus=2
"" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
"set cmdheight=2
"" コマンドをステータス行に表示
"set showcmd
"" モードを表示する
"set showmode
"" タイトルを表示
"set title
" 
"---------------------------------------------------------------------------
"===== ~ general =====


"===== move shortcut =====
"----- カーソル移動 -----
"移動
let g:BASH_Ctrl_j = 'off'
nnoremap <C-j> 10j
nnoremap <C-k> 10k
nnoremap <C-h> 10h
nnoremap <C-l> 10l
vnoremap <C-j> 10j
vnoremap <C-k> 10k
vnoremap <C-h> 10h
vnoremap <C-l> 10l

" 表示上の行移動
nnoremap j gj
nnoremap k gk

"行頭行末
nnoremap 0 $
vnoremap 0 $
nnoremap 1 ^
vnoremap 1 ^
"----- ~ カーソル移動 -----
"
"----- タブ移動 -----
" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" tc 新しいタブを一番右に作る
map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tx タブを閉じる
map <silent> [Tag]x :tabclose<CR>
" tn 次のタブ
map <silent> [Tag]n :tabnext<CR>
map <silent> [Tag]] :tabnext<CR>
" tp 前のタブ<D-ç><D-ç><D-≈><D-ç><D-ç>
map <silent> [Tag]p :tabprevious<CR>
map <silent> [Tag][ :tabprevious<CR>
"----- ~ タブ移動 -----
"===== ~ move shortcut =====
"
"===== grobal shortcut =====
"vimrcを開く
"nnoremap <Space>vimrc :<C-u>e ~/.vimrc<Space>
nnoremap <F5> :<C-u>tabedit $MYVIMRC<CR>
"vimrcを適用
nnoremap <F6> :<C-u>source $MYVIMRC<CR>

"c-g でesc
"noremap <C-g> <Esc>
imap <C-g> <Esc>
"imap <C-j> <Esc>

" ;でコマンド入力( ;と:を入れ替)
noremap ; :
"===== ~ grobal shortcut =====

"===== misc =====
"クリップボードをWindowsと連携
set clipboard+=unnamed
"Vi互換をオフ
set nocompatible
"texでの日本語入力不具合回避 
set imdisable
"ビープ音を消す
set visualbell t_vb=
" 閉じる系コマンドの無効化
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
"ヘルプを縦分割で表示する
"http://webtech-walker.com/archive/2009/08/19092113.html
nnoremap <Space>h :<C-u>vert bel h<Space>
"===== ~ misc =====

""===== 日本語入力補助 =====
"" 挿入モード終了時に IME 状態を保存しない
"inoremap <silent> <Esc> <Esc>
"inoremap <silent> <C-[> <Esc>
"
"
"" 「日本語入力固定モード」切り替えキー
"inoremap <silent> <C-j> <C-^>
""===== ~ =====

""===== 日本語入力補助 =====
""ステータスバーを常に表示
"set laststatus=2 
" 
"" 「日本語入力固定モード」切替キー
"inoremap <silent> <c -j="-j"> <c -r="-r">=IMState('FixMode')<cr>
"" PythonによるIBus制御指定
"let IM_CtrlIBusPython = 1
"" <esc>押下後のIM切替開始までの反応が遅い場合は設定する
""set timeout timeoutlen=3000 ttimeoutlen=100
"" 「日本語入力固定モード」がオンの場合、ステータス行にメッセージ表示
"set statusline+=%{IMStatus('[日本語固定]')}
"" im_control.vimがない環境でもエラーを出さないためのダミー関数
"function! IMStatus(...)
"  return ''
"endfunction
"</esc></cr></c></c></silent>
""===== ~ =====

" ?
"call pathogen#runtime_append_all_bundles()

"行末まで削除
"cnoremap <C-d> <C-\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos()-2]<CR>


" simplenote
let g:SimplenoteUsername = "mashi4729@gmail.com"
let g:SimplenotePassword = "ever1note"

" vimplenote
let g:VimpleNoteUsername = 'mashi4729@gmail.com'
let g:VimpleNotePassword = 'ever1note'

""===== http://mba-hack.blogspot.jp/2012/09/vim.html =====
""### Tera TermでIME制御 http://ttssh2.sourceforge.jp/manual/ja/usage/tips/vim.html
"""## 挿入モードから抜けた時に IME をオフにし、再度挿入モードに入った時に IME の状態を元に戻す
"let &t_SI .= "\e[<r"
"let &t_EI .= "\e[<s\e[<0t"
"let &t_te .= "\e[<0t\e[<s"
"set timeoutlen=100
""===== ~ http://mba-hack.blogspot.jp/2012/09/vim.html =====

"===== vimrc_import URL:http://blog.blueblack.net/item_110 =====
"タブの代わりに空白文字を挿入する
"set expandtab
"変更中のファイルでも、保存しないで他のファイルを表示
"set hidden
"タブ文字、行末など不可視文字を表示する
"set list
"listで表示される文字のフォーマットを指定する
"#set listchars=eol:$,tab:>\ ,extends:<
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
"新しい行を作ったときに高度な自動インデントを行う
set smartindent
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab


"入力モード時、ステータスラインのカラーを変更
augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END

"全角スペースを視覚化
"highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
"au BufNewFile,BufRead * match ZenkakuSpace /　/
"===== ~ vimrc_import =====
"
"
"
"
"
"

"参考 Shougo/shougo-s-github

" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示


"vimgrep 用コマンド
"http://qiita.com/yuku_t/items/0c1aff03949cb1b8fe6b
nnoremap [ :cprevious<CR>   " 前へ
nnoremap ] :cnext<CR>       " 次へ
nnoremap [Q :<C-u>cfirst<CR> " 最初へ
nnoremap ]Q :<C-u>clast<CR>  " 最後へ

