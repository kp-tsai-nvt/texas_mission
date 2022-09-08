set hlsearch
set autoindent
set laststatus=2
set number
set paste
set belloff=error

set t_Co=256
" colorscheme railscasts

let mapleader=","


" filetype plugin indent on
" " show existing tab with 4 spaces width
" set tabstop=4
" " when indenting with '>', use 4 spaces width
" set shiftwidth=4
" " On pressing tab, insert 4 spaces
" set expandtab

set tabstop=4
set softtabstop=0
set expandtab
"set shiftwidth=4
set smarttab
set expandtab
set noexpandtab


" Highlight space and tab with empty line and end of line
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
"
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\| \+\ze\t/

map <leader>t :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<cr>

set foldmethod=expr
set foldexpr=MyFoldExpr(v:lnum)
fun! MyFoldExpr(line)
    let str = getline(a:line)
    if str =~ '^sub\>'
        return '1'
    elseif str =~ '^}'
        return '<1'
    else
        return foldlevel(a:line - 1)
    endif
endfun

let g:NERDTreeDirArrows=0

hi Search ctermbg=LightYellow
hi Search ctermfg=Red


" remap eky
" ref. https://hashrocket.com/blog/posts/8-great-vim-mappings

" clone current paragraph
noremap cp yap<S-}>p

" align current paragraph
noremap <leader>a =ip

" save file
nnoremap <leader>s :w<cr>
inoremap <leader>s <C-c>:w<cr>
nnoremap <leader>q :q<cr>

" function - no highlight, spell check toggle
nnoremap <F3> :set noh!<cr><cr>
nnoremap <F5> :set spell!<cr>

" browse oldfile
nnoremap <leader>o :browse oldfiles<cr>

" reload .vimrc without restarting vim
" :so %
noremap <leader>vimrc :vs ~/.vimrc<cr>

" for insert mode back to normal without moving finger far away
imap fj <esc>
imap jf <esc>

" highlight cursor
" set cursorline
" hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white

nnoremap <leader>, A /* KP_DEBUG here in */<esc>
nnoremap <leader>d A fprintf(stderr, "[mali-dbg] %s:%d\n", __func__, __LINE__);<esc>

" nnoremap <leader>, o#if MALI_DEBUG_1<esc>
" nnoremap <leader>. o#endif<esc>

nnoremap <leader>1 oPROFILING_SETUP();<esc>
nnoremap <leader>2 oPROFILING_START();<esc>
nnoremap <leader>3 oPROFILING_END_AND_PRINT_TIME();<esc> 


" " virtual tabstops using spaces
" let my_tab=4
" execute "set shiftwidth=".my_tab
" execute "set softtabstop=".my_tab
" set expandtab
" " allow toggling between local and default mode
" function! TabToggle()
"   if &expandtab
"     set shiftwidth=8
"     set softtabstop=0
"     set noexpandtab
"   else
"     execute "set shiftwidth=".g:my_tab
"     execute "set softtabstop=".g:my_tab
"     set expandtab
"   endif
" endfunction
" nmap <F9> mz:execute TabToggle()<CR>'z
" 
" set number



noremap <leader>l :set number!<CR>

set autoindent
noremap <leader>l *yw<C-w>w:tag <C-r>"<CR>ztkk<C-w>w

noremap <leader>v o/* , No Plan to Fix*/<esc>bbbbb

" git diff current file
noremap <leader>gd :!git diff -- %<CR>

" noremap <leader>ic o/*Fix SVACE Warning ID --- */<esc>
" noremap <leader>dma :vs ~/note/mali-g51/note_dma_buf.txt<CR>
" noremap <leader>note :vs ~/note/mali-g51/note_eglp_window_next_render_target.txt<CR>
" noremap <leader>c1 o<tab>MY_CHECK_START();<esc>
" noremap <leader>c2 o<tab>MY_CHECK_END();<esc>
" noremap <leader>0 oNVT_Log("%s %s \n", __progname, __func__);<esc>
" noremap <leader>1 oNVT_Ent();<esc>
" noremap <leader>2 oNVT_Ext();<esc>
" noremap <leader>3 oNVT_ErrExt();<esc>

function! ConditionalPairMap(open, close)
  let line = getline('.')
  let col = col('.')
  if col < col('$') || stridx(line, a:close, col + 1) != -1
    return a:open
  else
    return a:open . a:close . repeat("\<left>", len(a:close))
  endif 
endfunction
inoremap <expr> ( ConditionalPairMap('(', ')')
inoremap <expr> { ConditionalPairMap('{', '}')
inoremap <expr> [ ConditionalPairMap('[', ']')
noremap <leader>l :set number!<CR>
" map <leader>l :set number!<CR>



" grep and explore them "
noremap <leader>gr :grep -rw --exclude-dir=build --exclude=tags <cword> * <CR>
noremap <F7> :colder<CR>
noremap <F8> :cnewer<CR>
noremap <F9> :cprev<CR>
noremap <F10> :cnext<CR>

" quickfix
noremap <leader>cc :cw<CR>

" tab 


" buffers
noremap <C-b> :buffers<CR>

" taglist
nnoremap <leader>f :TlistToggle<CR>
let Tlist_Auto_Open = 0
let Tlist_Exit_OnlyWindow = 0

nnoremap <C-W>O :call MaximizeToggle()<CR>
nnoremap <C-W>o :call MaximizeToggle()<CR>
nnoremap <C-W><C-O> :call MaximizeToggle()<CR>

function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction

set paste

set autoindent


" for v-customer c++
set expandtab
set tabstop=2

