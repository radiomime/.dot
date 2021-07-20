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
" Plug 'dense-analysis/ale'

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
Plug 'hrsh7th/nvim-compe'
Plug 'kabouzeid/nvim-lspinstall'
" trying out
" Plug 'mhartington/formatter.nvim'

" trying out
" Plug 'mfussenegger/nvim-lint'
" Plug 'folke/lsp-colors.nvim'
" Plug 'nvim-lua/completion-nvim'
" Plug 'neovim/nvim-lspconfig'
" Plug 'hrsh7th/nvim-compe'
" Plug 'kabouzeid/nvim-lspinstall'
" trying out
" Plug 'mfussenegger/nvim-lint'

"
" Plug 'folke/lsp-colors.nvim'
" Plug 'nvim-lua/completion-nvim'

" fterm
Plug 'numtostr/FTerm.nvim'

"""" FIX BELOW
" terminal
Plug 'vimlab/split-term.vim'

" start page
Plug 'mhinz/vim-startify'

" colors
Plug 'flazz/vim-colorschemes'

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
" TODO: filetpe ones: like javascript:
" autocmd FileType javascript setlocal shiftwidth=2|setlocal tabstop=2
" |setlocal expandtab autoindent softtabstop=0

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

" molokai colorscheme
colorscheme molokai

" gruvbox colorscheme
" let g:gruvbox_contrast_dark = 'hard'
" colorscheme gruvbox
" set background=dark

" line numbers
set number relativenumber
set numberwidth=4

" guide line for column length
set colorcolumn=79

" Disable the blinking cursor.
set guicursor=a:blinkon0
" set guicursor=a:blinkon0-hor30-ver30

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
" lsp
"""
" sane completion
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']


""""""""""
" OLLLLLDLDDDDDDDDD below
" OLLLLLDLDDDDDDDDD below
" OLLLLLDLDDDDDDDDD below
" OLLLLLDLDDDDDDDDD below
" OLLLLLDLDDDDDDDDD below
"""

" Use nvim-compe in every buffer
" autocmd BufEnter * lua require'compe'.on_attach()

""""""""""
" lsp colors
"""
" lua << EOF
" require("lsp-colors").setup({
"   Error = "#db4b4b",
"   Warning = "#e0af68",
"   Information = "#0db9d7",
"   Hint = "#10B981"
" })
" EOF


" lua require'lspconfig'.pyright.setup{on_attach=require'completion'.on_attach}
" lua require'lspconfig'.pyright.setup{on_attach=require'completion'.on_attach}

""""""""""
" language server installation
"""
" lua << EOF
" -- print("this is a test")
" local function setup_servers()
"   require'lspinstall'.setup()
"   local servers = require'lspinstall'.installed_servers()
"   for _, server in pairs(servers) do
"   --   print(servers)
"     print('setting up server:')
"     print(_)
"     print(server)
"     -- local capabilities = vim.lsp.protocol.make_client_capabilities()
"     -- print(vim.inspect(capabilities))
"     -- require'lspconfig'[server].setup{on_attach=on_attach, capabilities = capabilities}
"     -- require'lspconfig'[server].setup{}
"   end
" end
" 
" setup_servers()
" 
" -- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
" require'lspinstall'.post_install_hook = function ()
"   setup_servers() -- reload installed servers
"   vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
" end
" EOF

" new version from the creator of lsp install below

" lua << EOF
" require "lspconfig".efm.setup {
"     init_options = {documentFormatting = true},
"     settings = {
"         rootMarkers = {".git/"},
"         languages = {
"             python = {
"                  {formatCommand = "black --quiet -", formatStdin = true}
"             }
"             -- lua = {
"             --     {formatCommand = "lua-format -i", formatStdin = true}
"             -- }
"         }
"     }
" }
" EOF
" lua << EOF
" -- local efm_settings = {
" --   rootMarkers = {".git/"},
" --   languages = {
" --       lua = {
" --           {formatCommand = "lua-format -i", formatStdin = true}
" --       }
" --   }
" -- }
" -- require "lspconfig".efm.setup {
" --     init_options = {documentFormatting = true},
" --     settings = {
" --         rootMarkers = {".git/"},
" --         languages = {
" --             lua = {
" --                 {formatCommand = "lua-format -i", formatStdin = true}
" --             }
" --         }
" --     }
" -- }
" -- config that activates keymaps and enables snippet support
" local function make_config()
"   local capabilities = vim.lsp.protocol.make_client_capabilities()
"   capabilities.textDocument.completion.completionItem.snippetSupport = true
"   capabilities.textDocument.colorProvider = { dynamicRegistration = false }
"   return {
"     -- enable snippet support
"     capabilities = capabilities,
"     -- map buffer local keybindings when the language server attaches
"     on_attach = on_attach,
"   }
" end


" -- require('lint').linters_by_ft = {
" --   python = {'pylint','mypy',}
" -- }

" -- lsp-install
" local function setup_servers()
"   require"lspinstall".setup()

"   -- get all installed servers
"   local servers = require"lspinstall".installed_servers()
"   -- ... and add manually installed servers
"   -- table.insert(servers, "sourcekit")
"   -- table.insert(servers, "hls")

"   for _, server in pairs(servers) do
"     local config = make_config()
"     -- if server == "efm" then
"     --   config = vim.tbl_extend("force", config, require "efm")
"     --   config.settings = efm_settings
"     -- end
"     -- require "lspconfig".efm.setup {
"     --     init_options = {documentFormatting = true},
"     --     settings = {
"     --         rootMarkers = {".git/"},
"     --         languages = {
"     --             lua = {
"     --                 {formatCommand = "lua-format -i", formatStdin = true}
"     --             }
"     --         }
"     --     }
"     -- }

"     -- language specific config
"     -- if server == "lua" then
"     --   config.settings = lua_settings
"     --   config.root_dir = function(fname)
"     --     if fname:match("lush_theme") ~= nil then return nil end
"     --     local util = require "lspconfig/util"
"     --     return util.find_git_ancestor(fname) or util.path.dirname(fname)
"     --   end
"     -- end
"     -- if server == "sourcekit" then
"     --   config.filetypes = { "swift", "objective-c", "objective-cpp" } -- we don't want c and cpp!
"     -- end
"     -- if server == "clangd" then
"     --   config.filetypes = { "c", "cpp" } -- we don't want objective-c and objective-cpp!
"     -- end
"     -- if server == "diagnosticls" then
"     --   config = vim.tbl_extend("force", config, require "diagnosticls")
"     -- end
"     -- if server == "tailwindcss" then
"     --   config.settings = {
"     --     tailwindCSS = {
"     --       -- NOTE: values for `validate` and `lint.cssConflict` are required by the server
"     --       validate = true,
"     --       lint = { cssConflict = "warning" },
"     --     },
"     --   }
"     --   config.on_new_config = function(new_config)
"     --     new_config.settings.editor = {
"     --       -- optional, for hover code indentation
"     --       tabSize = vim.lsp.util.get_effective_tabstop(),
"     --     }
"     --   end
"     -- end
"     -- if server == "vim" then config.init_options = { isNeovim = true } end
"     -- if server == "hls" then
"     --   config.root_dir = require"lspconfig/util".root_pattern("*.cabal", "stack.yaml",
"     --                                                          "cabal.project", "package.yaml",
"     --                                                          "hie.yaml", ".git");
"     -- end

"     require"lspconfig"[server].setup(config)
"   end
" end

" setup_servers()

" -- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
" require"lspinstall".post_install_hook = function()
"   setup_servers() -- reload installed servers
"   vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
" end
" EOF

""""""""""
" autocomplete with compe
"""
lua << EOF
-- Compe setup
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    nvim_lsp = true;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
EOF
"
""""""""""
" keybindings and completion
"""
lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
-- local servers = { "pyright", "rust_analyzer", "tsserver" }
-- for _, lsp in ipairs(servers) do
--   nvim_lsp[lsp].setup {
--     on_attach = on_attach,
--     flags = {
--       debounce_text_changes = 150,
--     }
--   }
-- end
EOF

""""""""""
" enable language servers
"""
" I think this is already done with the setup_servers function!!
" lua << EOF
" require "lspconfig".efm.setup {
"     init_options = {documentFormatting = true},
"     settings = {
"         rootMarkers = {".git/"},
"         languages = {
"             lua = {
"                 {formatCommand = "lua-format -i", formatStdin = true}
"             }
"         }
"     }
" }
" EOF
" lua << EOF
" require'lspconfig'.efm.setup{}
" EOF
"
" lua << EOF
" require'lspconfig'.pyls.setup{}
" EOF

" lua << EOF
" require'lspconfig'.pyright.setup{}
" EOF

" lua << EOF
" require'lspconfig'.pyright.setup{}
" EOF

" lua << EOF
" require'lspconfig'.pyright.setup{}
" EOF

""""""""""
" auto formatting
"""
" autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
" autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
" autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)
" autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 1000)

""""""""""""""""""""""""""""""""""""""""""""""""""
" autocommand
""""""""""""""""""""""""""""""
" augroup swiftformat
"     autocmd!
"     autocmd BufWritePre,TextChanged,InsertLeave *.swift Neoformat
" augroup END

" function! s:setupMarkdownFormat()
"     set textwidth=79
"     " set wrapmargin=2
" endfunction

" function! s:markdownFormat()
"     " show underbars and asterisks for formating
"     let g:vim_markdown_conceal = 0
"     let g:vim_markdown_conceal_code_blocks = 0
"     " let g:vim_markdown_math = 1
"     " let g:vim_markdown_frontmatter = 1

"     " format on save
"     echom "gq} edits until the end of the file"

"     " let l:save_pos = getpos(".")
"     " exec 'normal! gggqG'
"     " call setpos('.', save_pos)
" endfunction

" augroup markdownWrapping
"   autocmd!
"   autocmd BufRead,BufNewFile *.md call s:setupMarkdownFormat()
"   autocmd BufWritePre *.md call s:markdownFormat()
" augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""
" dev playground
"""""""""""""""""""""""""""""""
" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
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
"
" au BufWritePost <buffer> lua require('lint').try_lint()
