"map russian symbols
"==============================
map ё `
map й q
map ц w
map у e
map к r
map е t
map н y
map г u
map ш i
map щ o
map з p
map х [
map ъ ]
map ф a
map ы s
map в d
map а f
map п g
map р h
map о j
map л k
map д l
map ж ;
map э '
map я z
map ч x
map с c
map м v
map и b
map т n
map ь m
map б ,
map ю .

map Ё ~
map Й Q
map Ц W
map У E
map К R
map Е T
map Н Y
map Г U
map Ш I
map Щ O
map З P
map Х {
map Ъ }
map Ф A
map Ы S
map В D
map А F
map П G
map Р H
map О J
map Л K
map Д L
map Ж :
map Э "
map Я Z
map Ч X
map С C
map М V
map И B
map Т N
map Ь M
map Б <
map Ю >
"=====================
"bell
set novisualbell
set t_vb=
"mouse
set mouse=a
set mousemodel=popup
set mousehide
"no vi compatibility
set nocompatible

set termencoding=utf-8

"appearance
"set guifont=Liberation\ Mono\ 12
set guifont=Consolas\ 12
"colorscheme neon
colorscheme metacosm
"
syntax enable

set sessionoptions=curdir,buffers,tabpages

"string numbers and other
set number
set ruler
set showcmd

"status
function Checkintvar(var)
if a:var==0
        return "Off"
    else
        return "On"
    endif
endfunction

set statusline=%<%f%h%m%r\ %b\ %{&encoding}\ 0x%B\ \ %l,%c%V\ %P\ IgnCase\:%2*%{Checkintvar(&ignorecase)}%0*
hi User2 guifg=green 
set laststatus=2
"tab
set tabstop=4
set shiftwidth=4
set expandtab

"folding
set foldmethod=indent
set foldmethod=syntax
set foldcolumn=2
set fo+=cr

"search options
set incsearch
set nohlsearch

"scroll options
set scrolljump=7
set scrolloff=7

"buffers
set nohidden

"indentation
set autoindent
set smartindent

set ch=2

"keymapping
set backspace=indent,eol,start whichwrap+=<,>,[,]

vmap <C-C> "+yi
imap <C-V> <esc>"+gPi
imap <C-BS> <C-W>

map <F10> :A<cr>
imap <F10> <esc>:A<cr>
vmap <F10> <esc>:A<cr>

map <C-F10> :AT<cr>
imap <C-F10> <esc>:AT<cr>
vmap <C-F10> <esc>:AT<cr>
"imap <C-V> <esc>"+gPi
"imap <C-BS> <C-W>

map <C-Tab> :tabN<cr>
vmap <C-Tab> <esc>:tabN<cr>i
imap <C-Tab> <esc>:tabN<cr>i
map <C-S-Tab> :tabp<cr>
vmap <C-S-Tab> <esc>:tabp<cr>i
imap <C-S-Tab> <esc>:tabp<cr>i
map <C-t> :tabnew<cr>
vmap <C-t> <esc>:tabnew<cr>i
imap <C-t> <esc>:tabnew<cr>i
map <C-ц> :tabnew<cr>
vmap <C-ц> <esc>:tabnew<cr>i
imap <C-ц> <esc>:tabnew<cr>i

map <C-q> :conf q<cr>
vmap <C-q> <esc>:conf q<cr>i
imap <C-q> <esc>:conf q<cr>i
map <C-й> :conf q<cr>
vmap <C-й> <esc>:conf q<cr>i
imap <C-й> <esc>:conf q<cr>i

let brConf = ":browse confirm e"
map <C-o> :browse confirm e<cr>
imap <C-o> <esc>:browse confirm e><cr>i
vmap <C-o> <esc>:browse confirm e><cr>v

map <C-F7> :promptfind<cr>
imap <C-F7> <esc>:promptfind<cr>i
vmap <C-F7> <esc>:promptfind<cr>v



"pair mappings
imap [ []<LEFT>

"completion
imap {<CR> {<CR>}<Esc>O
function InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
endif
endfunction
imap <S-tab> <c-r>=InsertTabWrapper()<cr>

" Слова откуда будем завершать
set complete=""
" Из текущего буфера
set complete+=.
" Из словаря
set complete+=k
" Из других открытых буферов
set complete+=b
" из тегов
set complete+=t

"taglist
" F11 - показать окно Taglist
map <F11> :TlistToggle<cr>
vmap <F11> <esc>:TlistToggle<cr>
imap <F11> <esc>:TlistToggle<cr>

let g:Tlist_Show_One_File = 1

"menus
"==============================================
set wildmenu
set wcm=<Tab>
menu Кодировка.koi8-r :e ++enc=koi8-r<CR>
menu Кодировка.windows-1251 :e ++enc=cp1251<CR>
menu Кодировка.cp866 :e ++enc=cp866<CR>
menu Кодировка.utf-8 :e ++enc=utf8 <CR>
"==============================================

filetype on
filetype plugin on

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#CompleteCpp

"ctags
set tags=./tags,./TAGS,tags,TAGS,~/.tags/usr_include
