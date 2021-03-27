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
" Plug 'ncm2/ncm2-jedi'
Plug 'Chiel92/vim-autoformat'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Also add Glaive, which is used to configure coverage's maktaba flags. See
" `:help :Glaive` for usage.
Plug 'google/vim-glaive'
Plug 'dhruvasagar/vim-table-mode', {
    \ 'on': [ 'TableModeEnable' ]
\ }

"python.jediEnabled": false

function! NvimTwUpdate(args)
    !npm install 
        " npm could also be yarn or pnpm
    UpdateRemotePlugins
endfunction

Plug 'yanick/nvim-taskwarrior', { 'do': function('NvimTwUpdate') }

call plug#end()
"
" coc-python init.vim suggestion
"
"

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-`> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"
" End of coc-python init.vim
"
"
nnoremap <C-p> :FuzzyOpen<CR>


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
let g:gutentags_ctags_executable = '/usr/local/bin/ctags'

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
let mithjem_doc.path = '~/mithjem/mithjem.wiki/'
let mithjem_doc.path_html = '/tmp/mithjem_doc/'
let mithjem_doc.syntax = 'markdown'
let mithjem_doc.ext = '.md'

let g:vimwiki_list = [wiki, mithjem_doc]

let $PYTHONPATH='/usr/local/lib/python3.8/site-packages'
set laststatus=2


