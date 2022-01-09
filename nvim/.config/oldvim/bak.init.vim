""""""""""""""""""""""""""""""""""""""""""""""""""
" sanity sets
" TODO: remove things covered by tpope/sensible
""""""""""""""""""""""""""""""
" this is useful below:
" https://www.reddit.com/r/vim/comments/4y8b51/what_are_common_settings_for_vim_that_are/

""""""""""""""""""""""""""""""""""""""""""""""""""
" install plugins
""""""""""""""""""""""""""""""
echom "installing plugins"
call plug#begin(expand('~/.config/nvim/plugged'))

" dependency for XXXX? From vim-bootstrap
" TODO: remove this if unnecessary
" let g:make = 'gmake'
" if exists('make')
"   let g:make = 'make'
" endif
" Plug 'Shougo/vimproc.vim', {'do': g:make}

" sensible
" Plug 'tpope/vim-sensible'

" ale linting
" Plug 'dense-analysis/ale'

" linting and fixing for swift
" Plug 'sbdchd/neoformat'

" to abbreviate, substitute, and coerce
" Plug 'tpope/vim-abolish'

" hints leader key bindings
" requires timeout on (default on @ 1000ms)
" Plug 'liuchengxu/vim-which-key'

" markdown preview: " Dependencies: nodejs and yarn
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" session management
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-session'

" git
" Plug 'tpope/vim-rhubarb' " required by fugitive to :Gbrowse
" Plug 'tpope/vim-fugitive'
" Plug 'idanarye/vim-merginal' " branching help
" Plug 'rbong/vim-flog'        " pretty tree

" fzf
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'

" window swap
" Plug 'wesQ3/vim-windowswap'

" tabularize for alignment
" Plug 'godlygeek/tabular'

" pretty json
" Plug 'tpope/vim-jdaddy'

" lsp
" Plug 'neovim/nvim-lspconfig'
" Plug 'hrsh7th/nvim-compe'
" Plug 'kabouzeid/nvim-lspinstall'

" for null ls
" Plug 'nvim-lua/plenary.nvim'
" Plug 'jose-elias-alvarez/null-ls.nvim'

" fterm
" Plug 'numtostr/FTerm.nvim'

" terminal
" Plug 'vimlab/split-term.vim'

" start page
" Plug 'mhinz/vim-startify'

" colors
" Plug 'flazz/vim-colorschemes'

""""""""""
" visual
"""
" Plug 'ryanoasis/vim-devicons'

" better find
" Plug 'unblevable/quick-scope'
" augroup qs_colors
"   autocmd!
"   autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
"   autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
" augroup END
" " Trigger a highlight in the appropriate direction when pressing these keys:
" let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

""""""""""
" Miscellaneous && Unknown
"""
" Plug 'scrooloose/nerdtree'
" Plug 'jistr/vim-nerdtree-tabs'
" Plug 'tpope/vim-commentary'
" Plug 'airblade/vim-gitgutter'
" Plug 'vim-scripts/grep.vim'
" Plug 'vim-scripts/CSApprox'
" Plug 'Raimondi/delimitMate'
" Plug 'majutsushi/tagbar'
" Plug 'avelino/vim-bootstrap-updater'
" Plug 'sheerun/vim-polyglot'



""""""""""""""""""""""""""""""
" Snippets
""""""""""
"" Snippets
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

"" Color
" Plug 'tomasr/molokai'

" Plug 'abecodes/tabout.nvim'

"*****************************************************************************
"" Custom bundles
"*****************************************************************************

" c
" Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}
" Plug 'ludwig/split-manpage.vim'


" go
" Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}


" javascript
"" Javascript Bundle
" Plug 'jelera/vim-javascript-syntax'


" python
"" Python Bundle
" Plug 'davidhalter/jedi-vim'
" Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}


" typescript
" Plug 'leafgarland/typescript-vim'
" Plug 'HerringtonDarkholme/yats.vim'

"*****************************************************************************
"" Custom Commands
"*****************************************************************************

"*****************************************************************************
" End of plugins
"*****************************************************************************
" The following were commented before! Who knows if they were good. Look into them with time?
" trying out
" Plug 'mhartington/formatter.nvim'
" Plug 'mfussenegger/nvim-lint'
" Plug 'folke/lsp-colors.nvim'
" Plug 'nvim-lua/completion-nvim'
" Plug 'neovim/nvim-lspconfig'
" Plug 'hrsh7th/nvim-compe'
" Plug 'kabouzeid/nvim-lspinstall'
" trying out
" Plug 'mfussenegger/nvim-lint'
" Plug 'folke/lsp-colors.nvim'
" Plug 'nvim-lua/completion-nvim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'Yggdroot/indentLine' " there is a better lua one by lukas!

""""""""""""""""""""""""""""""""""""""""""""""""""
" test plugins
""""""""""""""""""""""""""""""
" maybe some cool branch things?
"
" DEV PLAY WITH THIS


call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""
" configure and map plugins
""""""""""""""""""""""""""""""
echom "configuring plugins"

""""""""""
" vim-plug
"""
" command! PU PlugClean | PlugUpdate | PlugUpgrade

""""""""""
" fterm
"""
" lua require('FTerm').setup()
" nnoremap <Leader>jj :lua require("FTerm").toggle()<CR>
" tnoremap JJ <C-\><C-n>:lua require("FTerm").toggle()<CR>

""""""""""
" ale --this was all commented
"""
" TODO: move all of these to ftplugins as ale docs suggest
" TODO: include prettier on js fixers?

" let g:ale_sign_error = '●'
" let g:ale_sign_warning = '.'

" let g:ale_fix_on_save = 1
" let g:ale_fixers = {
"             \   '*': ['remove_trailing_lines', 'trim_whitespace'],
"             \   'javascript': ['eslint'],
"             \   'typescript': ['eslint'],
"             \   'python': ['black', 'isort'],
"             \}

" let g:ale_linters = {
"             \   'python': ['flake8'],
"             \}

" g:ale_python_black_options = '--line-length 80'

" 'python': ['black'],
" \   'python': ['add_blank_lines_for_python_control_statements','autoimport','autopep8','isort',''],
" 'add_blank_lines_for_python_control_statements' - Add blank lines before control statements.
" 'autoimport' - Fix import issues with autoimport.
" 'autopep8' - Fix PEP8 issues with autopep8.
" 'black' - Fix PEP8 issues with black.
" 'isort' - Sort Python imports with isort.
" 'reorder-python-imports' - Sort Python imports with reorder-python-imports.
" 'yapf' - Fix Python files with yapf.


" ale
" call extend(g:ale_linters, {
"     \'python': ['flake8'], })
" nmap <silent> <C-e> <Plug>(ale_next_wrap)

""""""""""
" which-key for leader hinting
"""
" nnoremap <silent> <leader>      :<c-u>WhichKey ' '<CR>
" nnoremap <silent> <localleader> :<c-u>WhichKey ','<CR>

" " autocmd! User vim-which-key call which_key#register(' ', 'g:which_key_map')

" let g:which_key_map =  {}
" let g:which_key_sep = '→'
" let g:which_key_position='topleft'
" let g:which_key_vertical = 1
" let g:which_key_centered = 0
" let g:which_key_use_floating_win = 0
" let g:which_key_floating_relative_win = 0

" let g:which_key_map.u = [ ':PU', 'Plug clean, update, upgrade']
" let g:which_key_map.v = [ '<C-u>vsplit<CR>', 'vertical split']
" let g:which_key_map.h = [ '<C-u>split<CR>', 'horizontal split']

" let g:which_key_map.z = [ ':ZoomToggle', 'zoom current pane']

" function SetGitUpstream()
"     let current_branch = system('git branch --show-current')
"     let git_upstream_output = system("git branch --set-upstream-to=origin/" . current_branch)
"     echo git_upstream_output
" endfunction

" let g:which_key_map.g = {
"        \ 'name' : '+git' ,
"        \ 'a'    : [':Gwrite/'           , 'add'],
"        \ 'c'    : [':Git commit'        , 'commit'],
"        \ 's'    : [':Gstatus'           , 'git status'],
"        \ 'd'    : [':Gvdiff/'           , 'git vertical diff'],
"        \ 't'    : [':Flog'              , 'show git tree'],
"        \ 'b'    : [':Merginal'          , 'git branches'],
"        \ 'r'    : {
"        \    'name'  : '+remote',
"        \    's'     : [':Git -c push.default=current push' , 'push'],
"        \    'l'     : [':Git pull'                         , 'pull'],
"        \    'u'     : [':call SetGitUpstream()'            , 'set upstream'],
"        \ },
"        \ 'l'    : [':Gblame'            , 'git blame'],
"        \ }

" let g:which_key_map.f = {
"        \ 'name' : '+fuzzy' ,
"        \ 'f'    : [':GFiles'            , 'open a file: respect git ignore'],
"        \ 'e'    : [':Files'             , 'open a file'],
"        \ 'b'    : [':Buffers'           , 'open a buffer'],
"        \ 'l'    : [':Lines'             , 'find a line'],
"        \ 'h'    : [':History'           , 'search file history'],
"        \ 't'    : [':Filetypes'         , 'filetypes'],
"        \ }

" call which_key#register(' ', "g:which_key_map")


" nnoremap <silent> <leader> :WhichKey ' '<CR>
" call which_key#register('<Space>', "g:which_key_map")

" let g:which_key_map =  {}
" let g:which_key_map.b = { 'name' : '+file' }
" let g:which_key_map['w'] = {
"       \ 'name' : '+windows' ,
"       \ 'w' : ['<C-W>w'     , 'other-window']          ,
"       \ 'd' : ['<C-W>c'     , 'delete-window']         ,
"       \ '-' : ['<C-W>s'     , 'split-window-below']    ,
"       \ '|' : ['<C-W>v'     , 'split-window-right']    ,
"       \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
"       \ 'h' : ['<C-W>h'     , 'window-left']           ,
"       \ 'j' : ['<C-W>j'     , 'window-below']          ,
"       \ 'l' : ['<C-W>l'     , 'window-right']          ,
"       \ 'k' : ['<C-W>k'     , 'window-up']             ,
"       \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
"       \ 'J' : [':resize +5'  , 'expand-window-below']   ,
"       \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
"       \ 'K' : [':resize -5'  , 'expand-window-up']      ,
"       \ '=' : ['<C-W>='     , 'balance-window']        ,
"       \ 's' : ['<C-W>s'     , 'split-window-below']    ,
"       \ 'v' : ['<C-W>v'     , 'split-window-below']    ,
"       \ '?' : ['Windows'    , 'fzf-window']            ,
"       \ }

""""""""""
" markdown preview
"""
" nnoremap <leader>md :MarkdownPreview<Return>

""""""""""
" session management with vim-session -- how should I do session management now?
"""
" let g:session_directory = "~/.config/nvim/session"
" let g:session_autoload = "no"
" let g:session_autosave = "no"
" let g:session_command_aliases = 1
" nnoremap <leader>so :OpenSession<Space>
" nnoremap <leader>ss :SaveSession<Space>
" nnoremap <leader>sd :DeleteSession<CR>
" nnoremap <leader>sc :CloseSession<CR>
" 
""""""""""
" git
"""
" flog
" let g:flog_default_arguments = {
"             \ 'max_count': 2000,
"             \ 'all': 1,
"             \ 'date': 'short',
"             \ }

""""""""""
" fugitive git bindings
"""
" noremap <Leader>ga :Gwrite<CR>
" noremap <Leader>gc :Gcommit<CR>
" noremap <Leader>gsh :Gpush<CR>
" noremap <Leader>gll :Gpull<CR>
" noremap <Leader>gs :Gstatus<CR>
" noremap <Leader>gb :Gblame<CR>
" noremap <Leader>gd :Gvdiff<CR>
" noremap <Leader>gr :Gremove<CR>

""""""""""
" fzf bindings
" https://github.com/junegunn/fzf.vim#commands
"""
" cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
" nnoremap <silent> <leader>e :Files<CR>
" Nerdtree integration here?
" nnoremap <silent> <expr> <Leader>e (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"

" nnoremap <silent> <leader>b :Buffers<CR>
" nnoremap <silent> <Leader>L :Lines<CR>
" nnoremap <silent> <Leader>C        :Colors<CR>

" nnoremap <leader>y :History:<CR>
" nnoremap <leader>ft :Filetypes<CR>

" nnoremap <silent> <Leader>ag       :Ag <C-R><C-W><CR>
" nnoremap <silent> <Leader>AG       :Ag <C-R><C-A><CR>
" xnoremap <silent> <Leader>ag       y:Ag <C-R>"<CR>
" nnoremap <silent> <Leader>`        :Marks<CR>


" let g:fzf_preview_window = ['right:60%', 'ctrl-/']

" fzf.vim --THIS WAS NOT COMMENTED
" set wildmode=list:longest,list:full
" set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
" let $FZF_DEFAULT_COMMAND="rg --files --hidden
"             \ -g '!{node_modules,.git,__pycache__}'
"             \ '--no-ignore-vcs'
"             \ "
" fzf.vim --ABOVE WAS NOT COMMENTED
            " \" -g '!.git/*'"
            " \ -g '!.git/*'
            " \ -g '!__pycache__/*'
" let $FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
" let $FZF_DEFAULT_COMMAND =
"             \"find * -path '*/\.*'"
"             \" -prune -o -path 'node_modules/**'"
"             \" -prune -o -path '__pycache__/**'"
"             \" -prune -o -path 'target/**'"
"             \" -prune -o -path 'dist/**'"
"             \" -prune -o  -type f -print -o -type l -print 2> /dev/null"

""""""""""
" split term
"""
" terminal below when executing :Term
" set splitbelow
" nnoremap <leader>sh :VTerm<CR>
" tnoremap JK <C-\><C-n>

""""""""""
" startify
"""
" let g:startify_change_to_dir = 0
" let g:startify_bookmarks = [
"     \ { 'i' : '~/.config/nvim/init.vim' },
"     \ ]
" let g:startify_lists = [
"           \ { 'type': 'files',     'header': ['   Files']            },
"           \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
"           \ { 'type': 'sessions',  'header': ['   Sessions']       },
"           \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
"           \ ]
" let g:startify_custom_header = []
" nnoremap <Leader>tt :tabnew<CR>:Startify<CR>







""""""""""""""""""""""""""""""""""""""""""""""""""
" END: configure and map plugins
""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""
" mappings
""""""""""""""""""""""""""""""
" jesus wept
" ino jk <esc>

" Remap : to ; for ease of use
" nnoremap ; :
" Keep ; an option
" nnoremap : ;

" reload vimrc
" nnoremap <leader><Return> :source $MYVIMRC<CR>

" Split
" noremap <Leader>h :<C-u>split<CR>
" noremap <Leader>v :<C-u>vsplit<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
" navigation
""""""""""""""""""""""""""""""
" Searching
" set nohlsearch
" set incsearch
" set ignorecase
" set smartcase

" assume the /g flag on grep
" set gdefault

""""""""""""""""""""""""""""""""""""""""""""""""""
" editing
""""""""""""""""""""""""""""""
"" Tabs. May be overridden by autocmd rules
" ts = 'number of spaces that <Tab> in file uses'
" sts = 'number of spaces that <Tab> uses while editing'
" sw = 'number of spaces to use for (auto)indent step'
" set tabstop=4
" set softtabstop=0
" set shiftwidth=4
" set expandtab
" TODO: filetpe ones: like javascript:
" autocmd FileType javascript setlocal shiftwidth=2|setlocal tabstop=2
" |setlocal expandtab autoindent softtabstop=0

" indent
" set smartindent
" set autoindent

" " copy/paste/cut to system clipboard
" if has('unnamedplus')
"     echom "copy/paste to system clipboard"
"     set clipboard=unnamedplus
" endif

" cucumber tables: let | align up and down
" inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

" -- THIS WAS NICE
" function! s:align()
"   let p = '^\s*|\s.*\s|\s*$'
"   if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
"     let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
"     let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
"     Tabularize/|/l1
"     normal! 0
"     call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
"   endif
" endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""
" visual
""""""""""""""""""""""""""""""
" sanity
" syntax on
" set ruler

" molokai colorscheme
" colorscheme molokai

" gruvbox colorscheme
" let g:gruvbox_contrast_dark = 'hard'
" colorscheme gruvbox
" set background=dark

" line numbers
" set number relativenumber
" set numberwidth=4

" guide line for column length
" set colorcolumn=79

" Disable the blinking cursor.
" set guicursor=a:blinkon0
" set guicursor=a:blinkon0-hor30-ver30

" center cursor in screen vertically while scrolling
" set scrolloff=50

"" horizontal scrolling and line wrapping
" set sidescroll=1
" set sidescrolloff=10

"" Status bar
" set laststatus=2

" zoom a pane
" nmap <Leader>zo :tabnew %<CR>
" nmap <Leader>zc :tabclose<CR>
" Zoom / Restore window.
" -- I LIKED ZOOOOOOOM
" function! s:ZoomToggle() abort
"     if exists('t:zoomed') && t:zoomed
"         execute t:zoom_winrestcmd
"         let t:zoomed = 0
"     else
"         let t:zoom_winrestcmd = winrestcmd()
"         resize
"         vertical resize
"         let t:zoomed = 1
"     endif
" endfunction
" command! ZoomToggle call s:ZoomToggle()
" nnoremap <silent> <C-A> :ZoomToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
" lsp
"""
" sane completion
" set completeopt=menuone,noinsert,noselect

" This will replace init.vim
" WORKING
" HERE
lua require('init')
