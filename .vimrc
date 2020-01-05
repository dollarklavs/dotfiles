set nocompatible              " required
set undodir=~/.vim/undodir
set undofile
" filetype off                  " required

let g:ycm_python_binary_path = 'python'



call plug#begin('~/.vim/plugged')
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
" Plugin 'Valloric/YouCompleteMe'
Plug 'vim-syntastic/syntastic'
Plug 'rust-lang/rust.vim'
Plug 'nvie/vim-flake8'
Plug 'jnurmine/Zenburn'
Plug 'scrooloose/nerdtree'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
call plug#end()

" All of your Plugins must be added before the following line
" call vundle#end()            " required
" filetype plugin indent on    " required

" Enable folding
set foldmethod=indent

set nu

" Enable folding with the spacebar
nnoremap <space> za

" add the proper PEP 8 indentation
au BufNewFile,BufRead *.py 
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" Flagging Unnecessary Whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set encoding=utf-8

map <C-n> :NERDTreeToggle<CR>
" make autocomplete go away + go definition
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

let python_highlight_all=1
syntax on
colorscheme simpleblack
set t_Co=256
set termguicolors 
" python with virtualenv support
" py << EOF
" import os
" import sys
" if 'VIRTUAL_ENV' in os.environ:
"   project_base_dir = os.environ['VIRTUAL_ENV']
"   activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"   execfile(activate_this, dict(__file__=activate_this))
" EOF
