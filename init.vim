set scrolloff=3 " Keep 3 lines below and above the cursor

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=128

set lazyredraw " to avoid scrolling problems
"
"GO doc, install, and run mappings
au FileType go nmap <leader>d <Plug>(go-doc-tab)
au FileType go nmap <leader>i <Plug>(go-install)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-doc-browser)

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

noremap <CR> o<ESC>
noremap <S-CR> O<ESC>
tnoremap jk <C-\><C-n>
tnoremap <C-[> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w><C-h>
tnoremap <C-l> <C-\><C-n><C-w><C-l>
tnoremap <C-j> <C-\><C-n><C-w><C-j>
tnoremap <C-k> <C-\><C-n><C-w><C-k>

"nerdtree arrow incons off
let g:NERDTreeDirArrows=0
"
"start nerdtree
autocmd vimenter * NERDTree
autocmd vimEnter * wincmd p

set guioptions-=L
colorscheme molokai
set background=dark

call plug#begin('~/.vim/plugged')

"Plugin 'sickill/vim-pasta'
Plug 'tmhedberg/matchit'
Plug 'haya14busa/incsearch.vim'
Plug 'gmarik/Vundle.vim'
Plug 'fatih/vim-go'
Plug 'zefei/cake16'
Plug 'Valloric/YouCompleteMe'
"Plugin 'duythinht/vim-coffee'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'bling/vim-airline'
"Bundle "kien/ctrlp.vim"
"Bundle "xolox/vim-easytags"
"Bundle "xolox/vim-misc"
Plug 'jistr/vim-nerdtree-tabs'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'tmhedberg/SimpylFold'
call plug#end()

filetype plugin indent on
syntax on

"make splits more natural
set splitbelow
set splitright

"show search results as you type them
set incsearch
set showmatch
set tabstop=4 softtabstop=4 shiftwidth=4

"mouse support
set mouse=a
set t_Co=256

" Show line number relative
set relativenumber
set number

"set ofu=syntaxcomplete#Complete
autocmd FileType c,cpp,cxx,h,fl,php set cindent|set cino=:0
autocmd FileType make setlocal noexpandtab
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4
"
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.*/

"show cursorline
augroup CursorLine
 au!
 au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
 au VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
 au WinLeave * setlocal nocursorline
 au WinLeave * setlocal nocursorcolumn
augroup END
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

"YCM
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_complete_in_comments = 0 
let g:ycm_seed_identifiers_with_syntax = 1 
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_collect_identifiers_from_tags_files = 1

"Tabs
nmap <C-t> :tabnew 
imap <C-t> <ESC>:tabnew 
nmap <C-d> :tabnext<CR>
nmap <C-a> :tabprevious<CR>
imap <C-d> <ESC> :tabnext<CR>
imap <C-a> <ESC> :tabprevious<CR>

"Autocenter
nmap gg ggzz;
nmap G Gzz;
"
"movin around
nnoremap L $
nnoremap H ^
nnoremap K {
nnoremap J }

"Speed improvements
inoremap jk <Esc>

"typo's
iabbr lenght length
iabbr widht width
iabbr heigth height
iabbr email beetswouter@gmail.com
iabbr #i #include
iabbr #d # define

"faster window switch
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


"better search
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

function! NERDTreeQuit()
  redir => buffersoutput
  silent buffers
  redir END
"                     1BufNo  2Mods.     3File           4LineNo
  let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
  let windowfound = 0

  for bline in split(buffersoutput, "\n")
    let m = matchlist(bline, pattern)

    if (len(m) > 0)
      if (m[2] =~ '..a..')
        let windowfound = 1
      endif
    endif
  endfor

  if (!windowfound)
    quitall
  endif
endfunction
autocmd WinEnter * call NERDTreeQuit()

nnoremap  :CtrlPTag<cr>

autocmd BufWinEnter,WinEnter term://* startinsert
set noerrorbells visualbell t_vb=
