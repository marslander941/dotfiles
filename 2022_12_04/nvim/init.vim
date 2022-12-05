"	 _   _ _____ _____     _____ __  __   ____   ____ 
"	| \ | | ____/ _ \ \   / /_ _|  \/  | |  _ \ / ___|
"	|  \| |  _|| | | \ \ / / | || |\/| | | |_) | |    
"	| |\  | |__| |_| |\ V /  | || |  | | |  _ <| |___ 
"	|_| \_|_____\___/  \_/  |___|_|  |_| |_| \_\\____|
"	                                                  

" SOURCE PLUGINS
source $HOME/.config/nvim/vim-plug/plugins.vim

" SET COMMANDS
"{{{
syntax on
colorscheme gruvbox
set background=dark
set foldmethod=marker
set number
set relativenumber
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set laststatus=2
set noswapfile
set noerrorbells
set hidden
set cursorline
set scrolloff=1
set nowrap
set nohlsearch
nnoremap <C-h> :set hlsearch!<CR>
map gg gg0
"}}}

" OTHER OPTIONS
"{{{
"color desert
"set t_Co=256
set mouse=a
"set viewoptions-=options
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
"}}}

" Combine all backup files in one directory
"{{{
set nobackup
set undodir=~/.vim/undodir 
set undofile
"}}}

function ToggleWrap()
"{{{
 if (&wrap == 1)
   set nowrap
 else
   set wrap
 endif
endfunction
map <C-t> :call ToggleWrap()<CR>
map! <C-t> ^[:call ToggleWrap()<CR>
"}}}

function Fixnames()
"{{{
	"remove brackets
	:silent %s/\[/_/ge 
	:silent %s/\]/_/ge
	:silent %s/{/_/ge 
	:silent %s/}/_/ge
	"remove spaces
	:silent %s/ /_/ge
	"remove other characters
	:silent %s/[-.~:,!()&#=]/_/ge
	"remove trailing and leading underscores
	:silent %s/_$//e
	:silent %s/^_//e
	"remove quotes
	:silent %s/["`'´’]//ge
	"combine all underscores
	:silent %s/__\+/_/ge
	"Fix extensions 
	:silent %s/_\(htm\|txt\|mp3\|jpg\|jpeg\|png\|gif\)/.\1/ge 
	:silent %s/_mp4$\|_flv$\|_mpg$\|_wmv$\|_mov$\|_mkv$\|_avi$\|_webm$\|_mpv$/.mp4/ge
	:silent %s/_zip$/.zip/ge
	:silent %s/_7z$/.7z/ge
	:silent %s/_tar_gz/.tar.gz/ge
	:silent %s/_rar$/.rar/ge
	:silent %s/_doc$/.doc/ge
	:silent %s/_docx$/.docx/ge
	:silent %s/_rtf$/.rtf/ge
	:1
endfunction
nnoremap <F9> :call Fixnames()<cr>
"}}}

function Fixnames_lowercase()
"{{{
	"remove brackets
	:silent %s/\[/_/ge 
	:silent %s/\]/_/ge
	:silent %s/{/_/ge 
	:silent %s/}/_/ge
	"Rename all to lowercase
	:silent %s/.*/\L&/ge
	"remove spaces
	:silent %s/ /_/ge
	"remove other characters
	:silent %s/[-.,!()&#=]/_/ge
	"remove trailing and leading underscores
	:silent %s/_$//e
	:silent %s/^_//e
	"remove quotes
	:silent %s/["`'´’]//ge
	"combine all underscores
	:silent %s/__\+/_/ge
	"Fix extensions 
	:silent %s/_\(htm\|txt\|mp3\|jpg\|jpeg\|png\|gif\)/.\1/ge 
	:silent %s/_mp4$\|_flv$\|_mpg$\|_wmv$\|_mov$\|_mkv$\|_avi$\|_webm$\|_mpv$/.mp4/ge
	:silent %s/_zip$/.zip/ge
	:silent %s/_7z$/.7z/ge
	:silent %s/_tar_gz/.tar.gz/ge
	:silent %s/_rar$/.rar/ge
	:silent %s/_doc$/.doc/ge
	:silent %s/_docx$/.docx/ge
	:silent %s/_rtf$/.rtf/ge
	:silent %s/_md$/.md/ge
	:1
endfunction
nnoremap <F10> :call Fixnames_lowercase()<cr>
"}}}

vnoremap <C-c> "+y
map <C-P> "+P
vnoremap <C-Del> :call delete(expand('%')) \| bdelete!<CR>
hi cursorline ctermbg=240 guifg=white guibg=black cterm=bold
hi normal ctermbg=black
map <Enter> o<ESC>
map <S-Enter> O<ESC>

map <C-Enter> o<Esc>
map <S-Enter> O<Esc>
imap <S-Enter> <Esc>O
imap <C-Enter> <Esc>o

