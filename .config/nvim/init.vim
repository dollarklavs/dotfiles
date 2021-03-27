call plug#begin()
" Plug 'roxma/nvim-completion-manager'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'wellle/targets.vim'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'glts/vim-textobj-comment'
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'mjbrownie/django-template-textobjects'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'brooth/far.vim'
Plug 'cloudhead/neovim-fuzzy'
Plug 'scrooloose/nerdtree'
Plug 'iCyMind/NeoSolarized'
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vimoutliner/vimoutliner'
Plug 'NLKNguyen/papercolor-theme'
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-buftabline'
Plug 'Shougo/denite.nvim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'itchyny/lightline.vim'
Plug 'vimwiki/vimwiki'
Plug 'google/vim-maktaba'
Plug 'google/vim-coverage'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'nathangrigg/vim-beancount'
Plug 'vim-scripts/TaskList.vim'
Plug 'mileszs/ack.vim'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'ludovicchabant/vim-gutentags'
Plug 'pearofducks/ansible-vim'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'
Plug 'Chiel92/vim-autoformat'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Also add Glaive, which is used to configure coverage's maktaba flags. See
" `:help :Glaive` for usage.
Plug 'google/vim-glaive'
Plug 'dhruvasagar/vim-table-mode', {
    \ 'on': [ 'TableModeEnable' ]
\ }

function! NvimTwUpdate(args)
    !npm install 
        " npm could also be yarn or pnpm
    UpdateRemotePlugins
endfunction

Plug 'yanick/nvim-taskwarrior', { 'do': function('NvimTwUpdate') }

call plug#end()

nnoremap <C-p> :FuzzyOpen<CR>
set clipboard=unnamedplus

"set t_Co=256   " This is may or may not needed.
"
call glaive#Install()
" Optional: Enable coverage's default mappings on the <Leader>C prefix.
Glaive coverage plugin[mappings]

if (has("termguicolors"))
  set termguicolors
endif

colorscheme palenight 
set background=dark
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set ignorecase
set smartcase
set ttyfast
set nobackup
set nowritebackup
set relativenumber
set number
set mouse=a
set hlsearch
set encoding=utf-8

" In many terminal emulators the mouse works just fine, thus enable it.

syntax enable


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

""  augroup nerdtreegitplugin
""      autocmd BufWritePost * call s:FileUpdate(expand("%:p"))
""  augroup END


  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  " For all text files set 'textwidth' to 140 characters.
  autocmd FileType text setlocal textwidth=140

 " enable ncm2 for all buffers
  autocmd BufEnter * call ncm2#enable_for_buffer()

 " IMPORTANT: :help Ncm2PopupOpen for more information
  set completeopt=noinsert,menuone,noselect

 " NOTE: you need to install completion sources to get completions. Check
 " our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki

  au FileType python
              \ set tabstop=4 |
              \ set softtabstop=4 |
              \ set shiftwidth=4 |
              \ set textwidth=140 |
              \ set expandtab |
              \ set autoindent |
              \ set fileformat=unix 

  au FileType yaml
              \ set tabstop=2 |
              \ set softtabstop=2 |
              \ set shiftwidth=2 |
              \ set textwidth=140 |
              \ set expandtab |
              \ set autoindent |
              \ set fileformat=unix 

  au FileType html
              \ set tabstop=2 |
              \ set softtabstop=2 |
              \ set shiftwidth=2 |
              \ set textwidth=140 |
              \ set expandtab |
              \ set autoindent |
              \ set fileformat=unix 

  au FileType json
              \ set tabstop=2 |
              \ set softtabstop=2 |
              \ set shiftwidth=2 |
              \ set textwidth=140 |
              \ set expandtab |
              \ set autoindent |
              \ set fileformat=unix 

  au FileType javascript
		\ set tabstop=2 |
		\ set softtabstop=2 |
		\ set shiftwidth=2 |
		\ set autoindent |
		\ set fileformat=unix 

  au FileType markdown
		\ set tabstop=2 |
		\ set softtabstop=2 |
		\ set shiftwidth=2 |
              	\ set textwidth=140 |
		\ set autoindent |
		\ set fileformat=unix 

  au FileType vimwiki
		\ set tabstop=2 |
		\ set softtabstop=2 |
		\ set shiftwidth=2 |
              	\ set textwidth=80 |
		\ set autoindent |
		\ set fileformat=unix 
  " auto change dir
  au BufEnter * silent! lcd %:p:h

  autocmd BufNewFile,BufReadPost *.md set filetype=markdown

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
	 	\ | wincmd p | diffthis

let mapleader = ",,"

set signcolumn=yes

" get the filename
nmap <leader>cs :let @*=expand("%")<CR>
nmap <leader>cl :let @*=expand("%:p")<CR>

" Find file in nerdtree
map <leader>R :NERDTreeFind<cr>

let NERDTreeIgnore = ['\.pyc$', '\.retry$']

" Esc on jk
inoremap jk <ESC>

" markdown syntax
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'sql']

nnoremap <space>gs :Gstatus<cr>
nnoremap <space>gp :Gpush<cr>
nnoremap <space>gr :Gpull --rebase<cr>

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" UltiSnips triggering
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

autocmd BufWritePost *.md silent execute '!smdv 'expand('%:p')' -v "'.v:servername'"'

" let g:gutentags_trace = 1
let g:gutentags_ctags_exclude = ["*.min.js", "*.min.css", "build", "vendor", ".git", "node_modules", "*.vim/bundle/*", "*.pyc"]

nnoremap <leader>jj <C-]>
nnoremap <leader>bb :tselect<CR>

let g:Guifont = "Hack:h14"

" Ale
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['flake8']}
" Airline
let g:airline_left_sep  = ''
let g:airline_right_sep = ''
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'

" vimwiki 
let wiki = {}
let wiki.path = '~/vimwiki/'
let wiki.path_html = '~/vimwiki_html/'

let mithjem_doc = {}
let mithjem_doc.path = '~/mithjem.wiki/'
let mithjem_doc.path_html = '/tmp/mithjem_doc/'
let mithjem_doc.syntax = 'markdown'
let mithjem_doc.ext = '.md'

let g:vimwiki_list = [wiki, mithjem_doc]


