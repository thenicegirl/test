
" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ===
" === Editor bebavior
" ===
" set exrc
" set secure
set number
set relativenumber
set cursorline
set cursorcolumn
" set hidden
" set noexpandtab
set tabstop=2
set shiftwidth=2
" set softtabstop=2
set autoindent
set list
set listchars=tab:\|\ ,trail:▫
set scrolloff=4
" set ttimeoutlen=0
" set viewoptions=cursor,folds,slash,unix
" set wrap
" set textwidth=0
" set indentexpr=
" set foldmethod=indent
" set foldlevel=99
" set foldenable
" set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set showcmd
"set wildmenu
"set ignorecase
"set smartcase
"set shortmess+=c
"set inccommand=split
"set completeopt=longest,noinsert,menuone,noselect,preview
"set ttyfast "should make scrolling faster
"set lazyredraw "same as above
"set visualbell
"silent !mkdir -p ~/.config/nvim/tmp/backup
"silent !mkdir -p ~/.config/nvim/tmp/undo
""silent !mkdir -p ~/.config/nvim/tmp/sessions
"set backupdir=~/.config/nvim/tmp/backup,.
"set directory=~/.config/nvim/tmp/backup,.
"if has('persistent_undo')
"	set undofile
"	set undodir=~/.config/nvim/tmp/undo,.
"endif
"set colorcolumn=100
"set updatetime=100
"set virtualedit=block

"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" Set Caps_Lock as Escape while using vim
au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'


set pastetoggle=<F2>
set hlsearch

set colorcolumn=120


" ===
" === Basic Mappings
" ===
" Make the vimrc effective immediately
"autocmd BufReadPost $MYVIMRC source $MYVIMRC
" Copy & Paste
" vnoremap <Leader>y "+y
" nmap <Leader>p "+p


" ===
" === Basic Mappings
" ===
" Set <LEADER> as <SPACE>, ; as :
let mapleader=" "
" let g:mapleader=','
" noremap ; :

" Save & quit
nnoremap <LEADER>q :q<CR>
nnoremap <LEADER>qa :qa<CR>
nnoremap <LEADER>Q :q!<CR>
nnoremap <LEADER>w :w<CR>

" Open the vimrc file anytime
nnoremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>
" noremap <LEADER>rv :e .nvimrc<CR>

" Source & PlugInstall
nnoremap <leader>ww :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>W :PlugInstall<cr>

" Copy to system clipboard
vnoremap y "+y

" Indentation
nnoremap < <<
nnoremap > >>

" Search
nnoremap <LEADER><CR> :nohlsearch<CR>

" Adjacent duplicate words
nnoremap <LEADER>dw /\(\<\w\+\>)\_s*\1

" Space to Tab
nnoremap <LEADER>tt :%s/    /\t/g
vnoremap <LEADER>tt :s/    /\t/g

" Folding
nnoremap <silent> <LEADER>o za

" nnoremap <c-n> :tabe<CR>:-tabmove<CR>:term lazynpm<CR>

" My mappings
" Normal mappings
nnoremap H ^
nnoremap J <C-d>
nnoremap K <C-u>
nnoremap L $
nnoremap <C-h> 0
nnoremap <C-j> <C-f>
nnoremap <C-k> <C-b>

nnoremap <Leader>h K

" Insert mappings
inoremap jj <Esc>`^
inoremap <A-h> <C-o>h
inoremap <A-j> <C-g>j
inoremap <A-k> <C-g>k
inoremap <A-l> <C-o>l
inoremap <C-i> <Del>
inoremap <C-m> <Esc>o
inoremap <C-g>h <Esc>I
inoremap <C-g>H <C-u>
inoremap <C-g>j <Esc>o
inoremap <C-g>k <Esc>O
inoremap <C-g>l <Esc>A
inoremap <C-g>L <Esc>c$
inoremap <C-g>u <Esc>ui
inoremap <C-x><C-x> <C-x><C-o>
" Alt+u to switch case
inoremap <A-u> <esc>gUiwea
inoremap <C-a> CtrlA
inoremap <CS-a> CtrlShiftA
inoremap <C-Up> CtrlUp
inoremap <C-S-Up> CtrlShiftUp

inoremap <Space><Space> <Esc>/<++><Enter>"_c4l

map <ESC>[65;5u   :echo "ctrl-shift-b received"<CR>
map <ESC>[70;5u   :echo "ctrl-shift-f received"<CR>
map <C-b>         :echo "ctrl-b received"<CR>
map <C-f>         :echo "ctrl-f received"<CR>

map <F6> :setlocal spell! spelllang=en_us<CR>

" Switch buffer
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> [n :bnext<CR>
" Use ctrl+h/j/k/l switch window
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null
" json Format
com! FormatJSON %!python3 -m json.tool

call plug#begin('~/.vim/plugged')
" :OpenPluginPage to view github page of current plugin.
Plug 'stsewd/open-plugin-page.nvim', { 'for': 'vim', 'do': ':UpdateRemotePlugins' }
Plug 'powerman/vim-plugin-fixtermkeys'

" Color schemes
Plug 'w0ng/vim-hybrid'
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'vim-scripts/wombat256.vim'

" Plug 'dracula/dracula-theme'

" Util
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'kien/rainbow_parentheses.vim'

Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'brooth/far.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'preservim/tagbar'
Plug 'lfv89/vim-interestingwords'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'sbdchd/neoformat'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-commentary'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'

" Vim users
Plug 'theniceboy/vim-calc'
" Not support yet
Plug 'vim/killersheep'

" Plug 'vim-scripts/matrix.vim--Yang'
Plug 'uguu-org/vim-matrix-screensaver'

" new
Plug 'ap/vim-css-color'
Plug 'mileszs/ack.vim'

" For Ruby
" Plug 'vim-ruby/vim-ruby'
" Plug 'tpope/vim-rails'
" Plug 'thoughtbot/vim-rspec'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

call plug#end()

" Use `gp` for open the github page of the current plugin under the cursor.
nmap gp <Plug>(OpenPluginPage)

colorscheme gruvbox

" About plugin
"let g:startify_change_to_dir = 0  # Ban startify auto switch dir


" easy motion
nmap ss <Plug>(easymotion-s2)

" vim-go
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

" python-mode
let g:pymode_python = 'python3'
let g:pymode_trim_whitespaces = 1
let g:pymode_doc=1
let g:pymode_doc_bind = 'K'
let g:pymode_rope_goto_definition_bind = "<C-]>"
let g:pymode_lint = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe', 'pylint']
let g:pymode_options_max_line_length = 120

" deoplete
let g:deoplete#enable_at_startup = 1
"set completeopt-=preview

" vim calc
nnoremap <LEADER>a :call Calc()<CR>

" function GithubPage()
" 	let url = "http://github.com/" ""

"""" Define SetTitle function, auto insert file head
"""func SetTitle()
"""  if &filetype == 'python'
"""    call setline(1, "\#!/usr/bin/env python")
"""    call setline(2, "\# -*- coding:utf-8 -*-")
"""    normal G
"""    normal o
"""    normal o
"""    call setline(5, "if __name__ == '__main__':")
"""    call setline(6, "  pass")
"""  endif
"""endfunc

