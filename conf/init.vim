""""""""""""""""""""""""""""""""""""""""""""""""""
" sanity sets
" TODO: remove things covered by tpope/sensible
""""""""""""""""""""""""""""""
echom "basic sets"

" Map leader to <space>
" let mapleader=' '
let g:mapleader = "\<Space>"
let maplocalleader=','

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" Fix backspace indent
set backspace=indent,eol,start

" Enable hidden buffers
set hidden

" list of formats to look for
set fileformats=unix,dos,mac

" set shell
if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

" No swap files
set noswapfile
set nobackup

" Undo file for persistent undos
call mkdir($HOME."/.config/nvim/undodir", "p")
set undodir=~/.config/nvim/undodir
set undofile

" source vimrc in current dir when opening project
set exrc

" filetype sanity
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""
" install vim-plug
""""""""""""""""""""""""""""""
echom "installing vim-plug"

let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

let g:vim_bootstrap_langs = "c,go,javascript,python,typescript"
let g:vim_bootstrap_editor = "nvim"				" nvim or vim

if !filereadable(vimplug_exists)
    if !executable("curl")
        echoerr "You have to install curl or first install vim-plug yourself!"
        execute "q!"
    endif
    echo "Installing Vim-Plug..."
    echo ""
    silent exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    let g:not_finish_vimplug = "yes"

    autocmd VimEnter * PlugInstall
endif

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
Plug 'tpope/vim-sensible'

" ale linting
Plug 'dense-analysis/ale'

" linting and fixing for swift
Plug 'sbdchd/neoformat'

" to abbreviate, substitute, and coerce
Plug 'tpope/vim-abolish'

" hints leader key bindings
" requires timeout on (default on @ 1000ms)
Plug 'liuchengxu/vim-which-key'

" markdown preview: " Dependencies: nodejs and yarn
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" session management
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

" git
Plug 'tpope/vim-rhubarb' " required by fugitive to :Gbrowse
Plug 'tpope/vim-fugitive'
Plug 'idanarye/vim-merginal' " branching help
Plug 'rbong/vim-flog'        " pretty tree

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" window swap
Plug 'wesQ3/vim-windowswap'

" tabularize for alignment
Plug 'godlygeek/tabular'

" pretty json
Plug 'tpope/vim-jdaddy'

" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'folke/lsp-colors.nvim'
Plug 'nvim-lua/completion-nvim'

" fterm
Plug 'numtostr/FTerm.nvim'

"""" FIX BELOW
" terminal
Plug 'vimlab/split-term.vim'

" start page
Plug 'mhinz/vim-startify'

""""""""""
" visual
"""
Plug 'ryanoasis/vim-devicons'

" better find
Plug 'unblevable/quick-scope'
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

""""""""""
" Miscellaneous && Unknown
"""
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-commentary'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/grep.vim'
Plug 'vim-scripts/CSApprox'
Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'
Plug 'Yggdroot/indentLine'
Plug 'avelino/vim-bootstrap-updater'
Plug 'sheerun/vim-polyglot'


""""""""""""""""""""""""""""""
" Snippets
""""""""""
"" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"" Color
Plug 'tomasr/molokai'

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

""""""""""""""""""""""""""""""""""""""""""""""""""
" test plugins
""""""""""""""""""""""""""""""
" maybe some cool branch things?


call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""
" configure and map plugins
""""""""""""""""""""""""""""""
echom "configuring plugins"

""""""""""
" vim-plug
"""
command! PU PlugClean | PlugUpdate | PlugUpgrade

""""""""""
" fterm
"""
lua require('FTerm').setup()
nnoremap <Leader>jj :lua require("FTerm").toggle()<CR>
tnoremap JJ <C-\><C-n>:lua require("FTerm").toggle()<CR>

""""""""""
" ale
"""
" TODO: move all of these to ftplugins as ale docs suggest
" TODO: include prettier on js fixers?

let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'

let g:ale_fix_on_save = 1
let g:ale_fixers = {
            \   '*': ['remove_trailing_lines', 'trim_whitespace'],
            \   'javascript': ['eslint'],
            \   'typescript': ['eslint'],
            \   'python': ['black', 'isort'],
            \}

let g:ale_linters = {
            \   'python': ['flake8'],
            \}

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
nnoremap <silent> <leader>      :<c-u>WhichKey ' '<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey ','<CR>

" autocmd! User vim-which-key call which_key#register(' ', 'g:which_key_map')

let g:which_key_map =  {}
let g:which_key_sep = '→'
let g:which_key_position='topleft'
let g:which_key_vertical = 1
let g:which_key_centered = 0
let g:which_key_use_floating_win = 0
let g:which_key_floating_relative_win = 0

let g:which_key_map.u = [ ':PU', 'Plug clean, update, upgrade']
let g:which_key_map.v = [ '<C-u>vsplit<CR>', 'vertical split']
let g:which_key_map.h = [ '<C-u>split<CR>', 'horizontal split']

let g:which_key_map.z = [ ':ZoomToggle', 'zoom current pane']

function SetGitUpstream()
    let current_branch = system('git branch --show-current')
    let git_upstream_output = system("git branch --set-upstream-to=origin/" . current_branch)
    echo git_upstream_output
endfunction

let g:which_key_map.g = {
       \ 'name' : '+git' ,
       \ 'a'    : [':Gwrite/'           , 'add'],
       \ 'c'    : [':Git commit'        , 'commit'],
       \ 's'    : [':Gstatus'           , 'git status'],
       \ 'd'    : [':Gvdiff/'           , 'git vertical diff'],
       \ 't'    : [':Flog'              , 'show git tree'],
       \ 'b'    : [':Merginal'          , 'git branches'],
       \ 'r'    : {
       \    'name'  : '+remote',
       \    's'     : [':Git -c push.default=current push' , 'push'],
       \    'l'     : [':Git pull'                         , 'pull'],
       \    'u'     : [':call SetGitUpstream()'            , 'set upstream'],
       \ },
       \ 'l'    : [':Gblame'            , 'git blame'],
       \ }

let g:which_key_map.f = {
       \ 'name' : '+fuzzy' ,
       \ 'f'    : [':GFiles'            , 'open a file: respect git ignore'],
       \ 'e'    : [':Files'             , 'open a file'],
       \ 'b'    : [':Buffers'           , 'open a buffer'],
       \ 'l'    : [':Lines'             , 'find a line'],
       \ 'h'    : [':History'           , 'search file history'],
       \ 't'    : [':Filetypes'         , 'filetypes'],
       \ }

call which_key#register(' ', "g:which_key_map")


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
nnoremap <leader>md :MarkdownPreview<Return>

""""""""""
" session management with vim-session
"""
let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

""""""""""
" git
"""
" flog
let g:flog_default_arguments = {
            \ 'max_count': 2000,
            \ 'all': 1,
            \ 'date': 'short',
            \ }

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
nnoremap <silent> <Leader>C        :Colors<CR>

" nnoremap <leader>y :History:<CR>
" nnoremap <leader>ft :Filetypes<CR>

" nnoremap <silent> <Leader>ag       :Ag <C-R><C-W><CR>
" nnoremap <silent> <Leader>AG       :Ag <C-R><C-A><CR>
" xnoremap <silent> <Leader>ag       y:Ag <C-R>"<CR>
" nnoremap <silent> <Leader>`        :Marks<CR>


let g:fzf_preview_window = ['right:60%', 'ctrl-/']

" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND="rg --files --hidden
            \ -g '!{node_modules,.git,__pycache__}'
            \ '--no-ignore-vcs'
            \ "
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
set splitbelow
nnoremap <leader>sh :VTerm<CR>
tnoremap JK <C-\><C-n>

""""""""""
" startify
"""
let g:startify_change_to_dir = 0
let g:startify_bookmarks = [
    \ { 'i' : '~/.config/nvim/init.vim' },
    \ ]
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]
let g:startify_custom_header = []
nnoremap <Leader>tt :tabnew<CR>:Startify<CR>

""""""""""
" lsp colors
"""
" -- Lua
" lua << EOF
" require("lsp-colors").setup({
"   Error = "#db4b4b",
"   Warning = "#e0af68",
"   Information = "#0db9d7",
"   Hint = "#10B981"
" })
" EOF

" Use completion-nvim in every buffer
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
autocmd BufEnter * lua require'completion'.on_attach()
" lua require'lspconfig'.pyright.setup{on_attach=require'completion'.on_attach}
" lua require'lspconfig'.pyright.setup{on_attach=require'completion'.on_attach}
""""""""""""""""""""""""""""""""""""""""""""""""""
" END: configure and map plugins
""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""
" mappings
""""""""""""""""""""""""""""""
" jesus wept
ino jk <esc>

" Remap : to ; for ease of use
nnoremap ; :
" Keep ; an option
nnoremap : ;

" reload vimrc
nnoremap <leader><Return> :source $MYVIMRC<CR>

" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
" navigation
""""""""""""""""""""""""""""""
" Searching
set nohlsearch
set incsearch
set ignorecase
set smartcase

" assume the /g flag on grep
set gdefault

""""""""""""""""""""""""""""""""""""""""""""""""""
" editing
""""""""""""""""""""""""""""""
"" Tabs. May be overridden by autocmd rules
" ts = 'number of spaces that <Tab> in file uses'
" sts = 'number of spaces that <Tab> uses while editing'
" sw = 'number of spaces to use for (auto)indent step'
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

" indent
set smartindent
set autoindent

" copy/paste/cut to system clipboard
if has('unnamedplus')
    echom "copy/paste to system clipboard"
    set clipboard=unnamedplus
endif

" cucumber tables: let | align up and down
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""
" visual
""""""""""""""""""""""""""""""
" sanity
syntax on
set ruler

" colorscheme
silent! colorscheme molokai

" line numbers
set number relativenumber
set numberwidth=4

" guide line for column length
set colorcolumn=79

" Disable the blinking cursor.
set guicursor=a:blinkon0

" center cursor in screen vertically while scrolling
set scrolloff=50

"" horizontal scrolling and line wrapping
set nowrap
set sidescroll=1
set sidescrolloff=10

"" Status bar
set laststatus=2

" zoom a pane
" nmap <Leader>zo :tabnew %<CR>
" nmap <Leader>zc :tabclose<CR>
" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
" nnoremap <silent> <C-A> :ZoomToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
" lsp-config
"""
" -- SWIFT
" local lspconfig = require'lspconfig'
" local configs = require'lspconfig/configs'
" if not configs.sourcekit_lsp then
"     configs.sourcekit_lsp = {
"         default_config = {
"             cmd = {'/home/ethan/swift-5.3.3-RELEASE-ubuntu20.04/usr/bin/sourcekit-lsp'};
"             filetypes = {'swift'};
"             settings = {};
"             root_dir = function(fname)
"               return lspconfig.util.find_git_ancestor(fname) or vim.loop.os_homedir()
"             end;
"         };
"     }
" end
" lspconfig.sourcekit_lsp.setup{on_attach = on_attach}"""""""""""""""""""""""""""
lua << EOF
require'lspconfig'.pyright.setup{}
EOF

" lua << EOF
" local nvim_lsp = require('lspconfig')
" local on_attach = function(client, bufnr)
"   local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
"   local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

"   buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

"   -- Mappings.
"   local opts = { noremap=true, silent=true }
"   buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
"   buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
"   buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
"   buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
"   buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
"   buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
"   buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
"   buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
"   buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
"   buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
"   buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
"   buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
"   buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
"   buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
"   buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
"   buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

"   -- Set some keybinds conditional on server capabilities
"   if client.resolved_capabilities.document_formatting then
"     buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
"   end
"   if client.resolved_capabilities.document_range_formatting then
"     buf_set_keymap("v", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
"   end

"   -- Set autocommands conditional on server_capabilities
"   if client.resolved_capabilities.document_highlight then
"     vim.api.nvim_exec([[
"       hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
"       hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
"       hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
"       augroup lsp_document_highlight
"         autocmd! * <buffer>
"         autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
"         autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
"       augroup END
"     ]], false)
"   end
" end

" -- Use a loop to conveniently both setup defined servers
" -- and map buffer local keybindings when the language server attaches
" local servers = { "pyright", "rust_analyzer", "tsserver" }
" for _, lsp in ipairs(servers) do
"   nvim_lsp[lsp].setup { on_attach = on_attach }
" end
" EOF

" lua << EOF
" local custom_lsp_attach = function(client)
"   -- See `:help nvim_buf_set_keymap()` for more information
"   vim.api.nvim_buf_set_keymap(0, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true})
"   vim.api.nvim_buf_set_keymap(0, 'n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true})
"   -- ... and other keymappings for LSP

"   -- Use LSP as the handler for omnifunc.
"   --    See `:help omnifunc` and `:help ins-completion` for more information.
"   vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

"   -- For plugins with an `on_attach` callback, call them here. For example:
"   -- require('completion').on_attach()
" end

" -- An example of configuring for `sumneko_lua`,
" --  a language server for Lua.

" -- set the path to the sumneko installation
" local system_name = "Linux" -- (Linux, macOS, or Windows)
" local sumneko_root_path = '/path/to/lua-language-server'
" local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

" require('lspconfig').sumneko_lua.setup({
"   cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
"   -- An example of settings for an LSP server.
"   --    For more options, see nvim-lspconfig
"   settings = {
"     Lua = {
"       runtime = {
"         -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
"         version = 'LuaJIT',
"         -- Setup your lua path
"         path = vim.split(package.path, ';'),
"       },
"       diagnostics = {
"         -- Get the language server to recognize the `vim` global
"         globals = {'vim'},
"       },
"       workspace = {
"         -- Make the server aware of Neovim runtime files
"         library = {
"           [vim.fn.expand('$VIMRUNTIME/lua')] = true,
"           [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
"         },
"       },
"     }
"   },

"   on_attach = custom_lsp_attach
" })
" EOF


" echom "installing vim-plug"
" lsp
" LspInstall tsserver
" Plug 'neovim/nvim-lspconfig'
" require 'nvim_lsp'.tsserver.setup{}
" sudo apt-get install clangd-9


""""""""""
" requires: python3 -m pip install 'python-language-server[all]'
"""
" lua << EOF
" require'lspconfig'.pyls.setup{}
" EOF

""""""""""""""""""""""""""""""""""""""""""""""""""
" autocommand
""""""""""""""""""""""""""""""
augroup swiftformat
    autocmd!
    autocmd BufWritePre,TextChanged,InsertLeave *.swift Neoformat
augroup END

function! s:setupMarkdownFormat()
    set textwidth=79
    " set wrapmargin=2
endfunction

function! s:markdownFormat()
    " show underbars and asterisks for formating
    let g:vim_markdown_conceal = 0
    let g:vim_markdown_conceal_code_blocks = 0
    " let g:vim_markdown_math = 1
    " let g:vim_markdown_frontmatter = 1

    " format on save
    echom "gq} edits until the end of the file"

    " let l:save_pos = getpos(".")
    " exec 'normal! gggqG'
    " call setpos('.', save_pos)
endfunction

augroup markdownWrapping
  autocmd!
  autocmd BufRead,BufNewFile *.md call s:setupMarkdownFormat()
  autocmd BufWritePre *.md call s:markdownFormat()
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""
" dev
" A place for playing around
"""""""""""""""""""""""""""""""
" nnoremap <Leader>jj :lua require("FTerm").toggle()<CR>
" tnoremap JJ <C-\><C-n>:lua require("FTerm").toggle()<CR>
" jk
"
"Plug 'lukas-reineke/indent-blankline.nvim', {'branch': 'lua'}
" let g:indent_blankline_show_current_context = v:true
" let g:indent_blankline_show_current_context = v:true

" TODO: how do i exit terminal mode?
" tnoremap <Esc> <C-\>_<C-N>

" terminal emulation
" nnoremap <silent> <leader>sh :terminal<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""WORKING""""""""""""""""""""""""
"""""""""""""""""""""""FROM""""""""""""""""""""""""
"""""""""""""""""""""""""HERE""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""

"*****************************************************************************
"" Visual Settings
"*****************************************************************************

"let no_buffers_menu=1

"set mousemodel=popup
"set t_Co=256
"set guioptions=egmrti
"set gfn=Monospace\ 10

"echom "is a gui running?"
"if has("gui_running")
"    echom "a gui is running!"
"    if has("gui_mac") || has("gui_macvim")
"        set guifont=Menlo:h12
"        set transparency=7
"    endif
"else
"    echom "a gui is not running!"
"    let g:CSApprox_loaded = 1

"    " IndentLine
"    let g:indentLine_setConceal = 0
"    let g:indentLine_enabled = 1
"    let g:indentLine_concealcursor = 0
"    let g:indentLine_char = '┆'
"    let g:indentLine_faster = 1
"endif


"""""""""""
"" scrolling
""""

""" Use modeline overrides
"set modeline
"set modelines=10

"set title
"set titleold="Terminal"
"set titlestring=%F

"set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\


"if exists("*fugitive#statusline")
"  set statusline+=%{fugitive#statusline()}
"endif

"" vim-airline
"let g:airline_theme = 'powerlineish'
"let g:airline#extensions#branch#enabled = 1
"let g:airline#extensions#ale#enabled = 1
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tagbar#enabled = 1
"let g:airline_skip_empty_sections = 1

""*****************************************************************************
""" Abbreviations
""*****************************************************************************
""" no one is really happy until you have this shortcuts
"cnoreabbrev W! w!
"cnoreabbrev Q! q!
"cnoreabbrev Qall! qall!
"cnoreabbrev Wq wq
"cnoreabbrev Wa wa
"cnoreabbrev wQ wq
"cnoreabbrev WQ wq
"cnoreabbrev W w
"cnoreabbrev Q q
"cnoreabbrev Qall qall

""" NERDTree configuration
"let g:NERDTreeChDirMode=2
"let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
"let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
"let g:NERDTreeShowBookmarks=1
"let g:nerdtree_tabs_focus_on_files=1
"let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
"let g:NERDTreeWinSize = 50
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
"nnoremap <silent> <F2> :NERDTreeFind<CR>
"nnoremap <silent> <F3> :NERDTreeToggle<CR>

"" grep.vim
"nnoremap <silent> <leader>f :Rgrep<CR>
"let Grep_Default_Options = '-IR'
"let Grep_Skip_Files = '*.log *.db'
"let Grep_Skip_Dirs = '.git node_modules'



""*****************************************************************************
""" Commands
""*****************************************************************************
"" remove trailing whitespaces
"" command! FixWhitespace :%s/\s\+$//e

""*****************************************************************************
""" Functions
""*****************************************************************************
"if !exists('*s:setupWrapping')
"  function s:setupWrapping()
"    set wrap
"    set wm=2
"    set textwidth=79
"  endfunction
"endif

""*****************************************************************************
""" Autocmd Rules
""*****************************************************************************
""" The PC is fast enough
""" do syntax highlight syncing from start unless 200 lines

"augroup vimrc-sync-fromstart
"  autocmd!
"  autocmd BufEnter * :syntax sync maxlines=200
"augroup END

""" Remember cursor position
"augroup vimrc-remember-cursor-position
"  autocmd!
"  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
"augroup END

""" txt
"augroup vimrc-wrapping
"  autocmd!
"  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
"augroup END

""" make/cmake
"augroup vimrc-make-cmake
"  autocmd!
"  autocmd FileType make setlocal noexpandtab
"  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
"augroup END

"set autoread

""*****************************************************************************
""" Mappings
""*****************************************************************************

"" Keep text centered
"" Note: gj will move the cursor one apparent line down rather than actual
""     lines. Useful for text wrapping
"" TODO: Checkout: set scrolloff=50, or set scrolloff=999
""   * Should do the same as the zz
"" nnoremap j gjzz
"" nnoremap k gkzz

"" " Search mappings: These will make it so that going to the next one in a
"" " search will center on the line it's found in.
"" nnoremap n nzzzv
"" nnoremap N Nzzzv

"" " Always keep text centered
"" nnoremap } }zz
"" nnoremap { {zz
"" nnoremap G Gzz
"" nnoremap n nzz
"" nnoremap N Nzz
"" nnoremap * *zz
"" nnoremap # #zz
"" nnoremap g* g*zz
"" nnoremap g# g#zz
"" nnoremap <C-O> <C-O>zz
"" nnoremap <C-I> <C-I>zz
"" nnoremap <C-]> <C-]>zz



""" Tabs
"nnoremap <Tab> gt
"nnoremap <S-Tab> gT
"nnoremap <silent> <S-t> :tabnew<CR>

""" Set working directory
"nnoremap <leader>. :lcd %:p:h<CR>

"" "" Opens an edit command with the path of the currently edited file filled in
"" noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

""" Opens a tab edit command with the path of the currently edited file filled
"noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

""" fzf.vim
"set wildmode=list:longest,list:full
"set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
"let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

"" The Silver Searcher
"if executable('ag')
"    echom "ag is executable!!!"
"    let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
"    set grepprg=ag\ --nogroup\ --nocolor
"endif

"" ripgrep
"if executable('rg')
"    echom "rg is executable!!!"
"    let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
"    set grepprg=rg\ --vimgrep
"    command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
"endif

"" cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
"" nnoremap <silent> <leader>b :Buffers<CR>
"" nnoremap <silent> <leader>e :FZF -m<CR>
""Recovery commands from history through FZF
"" nmap <leader>y :History:<CR>

"" snippets
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<c-b>"
"let g:UltiSnipsEditSplit="vertical"

"" ale
"let g:ale_linters = {}

"" Tagbar
"nmap <silent> <F4> :TagbarToggle<CR>
"let g:tagbar_autofocus = 1

"" Disable visualbell
"set noerrorbells novisualbell t_vb=
"" set noerrorbells visualbell t_vb=
"if has('autocmd')
"  autocmd GUIEnter * set visualbell t_vb=
"endif

""" Copy/Paste/Cut
"if has('unnamedplus')
"  set clipboard=unnamed,unnamedplus
"  " set clipboard+=unnamed,unnamedplus
"  " set clipboard+=unnamedplus
"  " set clipboard+=unnamedplus
"  " set clipboard^=unnamed,unnamedplus
"endif

"noremap YY "+y<CR>
"noremap <leader>p "+gP<CR>
"noremap XX "+x<CR>

"if has('macunix')
"  " pbcopy for OSX copy/paste
"  vmap <C-x> :!pbcopy<CR>
"  vmap <C-c> :w !pbcopy<CR><CR>
"endif

""" Buffer nav
"noremap <leader>z :bp<CR>
"noremap <leader>q :bp<CR>
"noremap <leader>x :bn<CR>
"noremap <leader>w :bn<CR>

""" Close buffer
"noremap <leader>c :bd<CR>

""" Clean search (highlight)
"nnoremap <silent> <leader><space> :noh<cr>

""" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

""" Vmap for maintain Visual Mode after shifting > and <
"vmap < <gv
"vmap > >gv

""" Move visual block
"vnoremap J :m '>+1<CR>gv=gv
"vnoremap K :m '<-2<CR>gv=gv

""" Open current line on GitHub
"nnoremap <Leader>o :.Gbrowse<CR>

""*****************************************************************************
""" Custom configs
""*****************************************************************************

"" c
"autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab
"autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab


"" go
"" vim-go
"" run :GoBuild or :GoTestCompile based on the go file
"function! s:build_go_files()
"  let l:file = expand('%')
"  if l:file =~# '^\f\+_test\.go$'
"    call go#test#Test(0, 1)
"  elseif l:file =~# '^\f\+\.go$'
"    call go#cmd#Build(0)
"  endif
"endfunction

"let g:go_list_type = "quickfix"
"let g:go_fmt_command = "goimports"
"let g:go_fmt_fail_silently = 1

"let g:go_highlight_types = 1
"let g:go_highlight_fields = 1
"let g:go_highlight_functions = 1
"let g:go_highlight_methods = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_build_constraints = 1
"let g:go_highlight_structs = 1
"let g:go_highlight_generate_tags = 1
"let g:go_highlight_space_tab_error = 0
"let g:go_highlight_array_whitespace_error = 0
"let g:go_highlight_trailing_whitespace_error = 0
"let g:go_highlight_extra_types = 1

"autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

"augroup completion_preview_close
"  autocmd!
"  if v:version > 703 || v:version == 703 && has('patch598')
"    autocmd CompleteDone * if !&previewwindow && &completeopt =~ 'preview' | silent! pclose | endif
"  endif
"augroup END

"augroup go

"  au!
"  au Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
"  au Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
"  au Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
"  au Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

"  au FileType go nmap <Leader>dd <Plug>(go-def-vertical)
"  au FileType go nmap <Leader>dv <Plug>(go-doc-vertical)
"  au FileType go nmap <Leader>db <Plug>(go-doc-browser)

"  au FileType go nmap <leader>r  <Plug>(go-run)
"  au FileType go nmap <leader>t  <Plug>(go-test)
"  au FileType go nmap <Leader>gt <Plug>(go-coverage-toggle)
"  au FileType go nmap <Leader>i <Plug>(go-info)
"  au FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)
"  au FileType go nmap <C-g> :GoDecls<cr>
"  au FileType go nmap <leader>dr :GoDeclsDir<cr>
"  au FileType go imap <C-g> <esc>:<C-u>GoDecls<cr>
"  au FileType go imap <leader>dr <esc>:<C-u>GoDeclsDir<cr>
"  au FileType go nmap <leader>rb :<C-u>call <SID>build_go_files()<CR>

"augroup END

"" ale
":call extend(g:ale_linters, {
"    \"go": ['golint', 'go vet'], })

""*****************************************************************************
""" Makefile Rules
""*****************************************************************************
"if has("autocmd")
"    " If the filetype is Makefile then we need to use tabs
"    " So do not expand tabs into space.
"    autocmd FileType make   set noexpandtab
"endif

""*****************************************************************************
""" Javascript Rules
""*****************************************************************************
"" ts = 'number of spaces that <Tab> in file uses'
"" sts = 'number of spaces that <Tab> uses while editing'
"" sw = 'number of spaces to use for (auto)indent step'


"" javascript
"let g:javascript_enable_domhtmlcss = 1

"" vim-javascript
"augroup vimrc-javascript
"  autocmd!
"  autocmd FileType javascript setlocal shiftwidth=2|setlocal tabstop=2|setlocal expandtab autoindent softtabstop=0
"augroup END

"" python
"" vim-python
"augroup vimrc-python
"  autocmd!
"  autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
"      \ formatoptions+=croq softtabstop=4
"      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
"augroup END

"" jedi-vim
"let g:jedi#popup_on_dot = 0
"let g:jedi#goto_assignments_command = "<leader>g"
"let g:jedi#goto_definitions_command = "<leader>d"
"let g:jedi#documentation_command = "K"
"let g:jedi#usages_command = "<leader>n"
"let g:jedi#rename_command = "<leader>r"
"let g:jedi#show_call_signatures = "0"
"let g:jedi#completions_command = "<C-Space>"
"let g:jedi#smart_auto_mappings = 0

"" ale
":call extend(g:ale_linters, {
"    \'python': ['flake8'], })

"" vim-airline
"let g:airline#extensions#virtualenv#enabled = 1

"" Syntax highlight
"" Default highlight is better than polyglot
"let g:polyglot_disabled = ['python']
"let python_highlight_all = 1

"" typescript
"autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=0 expandtab autoindent
"let g:yats_host_keyword = 1

""*****************************************************************************
""*****************************************************************************

""" Include user's local vim config
"if filereadable(expand("~/.config/nvim/local_init.vim"))
"  source ~/.config/nvim/local_init.vim
"endif

""*****************************************************************************
""" Convenience variables
""*****************************************************************************

"" vim-airline
"if !exists('g:airline_symbols')
"  let g:airline_symbols = {}
"endif

"if !exists('g:airline_powerline_fonts')
"  let g:airline#extensions#tabline#left_sep = ' '
"  let g:airline#extensions#tabline#left_alt_sep = '|'
"  let g:airline_left_sep          = '▶'
"  let g:airline_left_alt_sep      = '»'
"  let g:airline_right_sep         = '◀'
"  let g:airline_right_alt_sep     = '«'
"  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
"  let g:airline#extensions#readonly#symbol   = '⊘'
"  let g:airline#extensions#linecolumn#prefix = '¶'
"  let g:airline#extensions#paste#symbol      = 'ρ'
"  let g:airline_symbols.linenr    = '␊'
"  let g:airline_symbols.branch    = '⎇'
"  let g:airline_symbols.paste     = 'ρ'
"  let g:airline_symbols.paste     = 'Þ'
"  let g:airline_symbols.paste     = '∥'
"  let g:airline_symbols.whitespace = 'Ξ'
"else
"  let g:airline#extensions#tabline#left_sep = ''
"  let g:airline#extensions#tabline#left_alt_sep = ''

"  " powerline symbols
"  let g:airline_left_sep = ''
"  let g:airline_left_alt_sep = ''
"  let g:airline_right_sep = ''
"  let g:airline_right_alt_sep = ''
"  let g:airline_symbols.branch = ''
"  let g:airline_symbols.readonly = ''
"  let g:airline_symbols.linenr = ''
"endif
