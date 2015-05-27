" テーマ設定
colorscheme hybrid

"ウィンドウの透明度とフォントを設定
if has('gui_macvim')
    set transparency=10
    set guifont=Menlo:h12
    set lines=90 columns=200
    set guioptions-=T
endif


" ウィンドウの位置とサイズを記憶
let g:save_window_file = expand('~/.vimwinpos')
augroup SaveWindow
  autocmd!
  autocmd VimLeavePre * call s:save_window()
  function! s:save_window()
    let options = [
      \ 'set columns=' . &columns,
      \ 'set lines=' . &lines,
      \ 'winpos ' . getwinposx() . ' ' . getwinposy(),
      \ ]
    call writefile(options, g:save_window_file)
  endfunction
augroup END

if filereadable(g:save_window_file)
  execute 'source' g:save_window_file
endif

"===== tex用 =====
" REQUIRED. This makes vim invoke latex-suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse latex-suite. Set your grep
" program to alway generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

"" 各自の環境に合わせた .tex ファイルを dvi ファイルにコンパイルするコマンドに，適宜置き換えてください． (Vine Linux 3.1 の場合)
"let g:Tex_CompileRule_dvi = 'platex $*'
"
"" 同様に，dvi ファイルのビューワー
"let g:Tex_ViewRule_dvi = 'xdvi'

"texでの日本語入力不具合回避 
set imdisable
"==== ~ tex用 =====



" コンパイル時に使用するコマンド
"let g:Tex_CompileRule_dvi = 'platex --interaction=nonstopmode $*' 
let g:Tex_CompileRule_dvi = 'platex --interaction=nonstopmode' 
let g:Tex_BibtexFlavor = 'jbibtex'
"let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'

" ファイルのビューワー
"let g:Tex_ViewRule_dvi = 'xdvi'
"let g:Tex_ViewRule_pdf = 'evince'
let g:Tex_ViewRule_pdf = 'open -a preview'

".texを開いたらtexモードになる
let g:tex_flavor='latex' 
