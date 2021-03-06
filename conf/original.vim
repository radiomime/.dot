set nocompatible

" VIM session handling: :S sessionname to save your current session 
" ( doesn't save files ) | from outside of vim : s sessionname to open session
function MakeSession(session)
    execute "mks! ". fnameescape("~/.vim/sessions/" . a:session . ".vim")
    execute "qa"
endfunction
command! -nargs=1 S call MakeSession(<f-args>)

" Termanl Remap
" I can't figure out why but on some distros twk needs to be
"set and on some termkey needs to be set
set twk=<C-H>
" set termkey=<C-H> 


command V :vert term
set splitbelow " split all windows below, including the terminal which is where I always want it

command! MakeTags !ctags -R .

"*****************************************************************************
" Mappings
"*****************************************************************************

" `//`: Visual Mode: search for currently selected text
vnoremap // y/<C-R>"<CR>"

" Always keep text centered
" Note: gj will move the cursor one apparent line down rather than actual
"     lines. Useful for text wrapping
" TODO: Checkout: set scrolloff=50, or set scrolloff=999
"   * Should do the same as the zz
nnoremap j gjzz
nnoremap k gkzz

" Always keep text centered
nnoremap } }zz
nnoremap { {zz
nnoremap G Gzz
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
nnoremap <C-O> <C-O>zz
nnoremap <C-I> <C-I>zz
nnoremap <C-]> <C-]>zz

" King of all remaps
ino jk <esc>

" Vim like pane navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" <> and +- to adjust pane sizes
" TODO: checkout resizing windows
nnoremap > :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap < :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

nnoremap + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap - :exe "resize " . (winheight(0) * 2/3)<CR>

" `;;` in insert mode will rind the next <..>, delete it, and enter insert mode
inoremap ;; <Esc>/<..><Enter>"_c4l

"*****************************************************************************
" Visual Settings
"*****************************************************************************
syntax on

set t_Co=256
set background=dark
set hidden

" colorscheme if plugins aren't used
colorscheme onedark

"Chose colorscheme, copy to folder: ~/.vim/colors
" $ cp /path/to/your/color.vim  ~/.vim/colors


" first clear any existing autocommands:
autocmd!

" Show line number, and relative line numbers
set number
set relativenumber
" Show current position
set ruler

set cursorline " Highlight current line
set wrap
set ttyfast

set nofoldenable
set foldmethod=indent
set foldlevel=2
set foldclose=all

set smartindent
"Set tab spacing to 4 
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent

"*****************************************************************************
" TODO: sort below
" Other stuff, not yet labeled
"*****************************************************************************

"enable syntax processing
syntax enable

set showmatch
set hlsearch 

" Remap : to ; for ease of use
nnoremap ; :
" Keep ; an option
nnoremap : ;


" :W sudo saves the file (no permission denied)
command W w !sudo tee % > /dev/null

" Enable filetype plugins
filetype plugin on
filetype indent on

" Ignore case when searching
set ignorecase


" have fifty lines of command-line (etc) history:
set history=50
" remember all of these between sessions, but only 10 search terms; also
" remember info for 10 files, but never any on removable disks, don't remember
" marks in files, don't rehighlight old search patterns, and only save up to
" 100 lines of registers; including @10 in there should restrict input buffer
" but it causes an error for me:
set viminfo=/10,'10,r/mnt/zip,r/mnt/floppy,f0,h,\"100

" have command-line completion <Tab> (for filenames, help topics, option names)
" first list the available options and complete the longest common part, then
" have further <Tab>s cycle through the possibilities:
set wildmode=list:longest,full

" use "[RO]" for "[readonly]" to save space in the message line:
set shortmess+=r

" display the current mode and partially-typed commands in the status line:
set showmode
set showcmd

" when using list, keep tabs at their full width and display `arrows':
execute 'set listchars+=tab:' . nr2char(187) . nr2char(183)
" (Character 187 is a right double-chevron, and 183 a mid-dot.)

" have the mouse enabled all the time:
" set mouse=a

" don't have files trying to override this .vimrc:
set nomodeline


" * Text Formatting -- General

" don't make it look like there are line breaks where there aren't:
set nowrap

" normally don't automatically format `text' as it is typed, IE only do this
" with comments, at 79 characters:
set formatoptions-=t
set textwidth=79

" get rid of the default style of C comments, and define a style with two stars
" at the start of `middle' rows which (looks nicer and) avoids asterisks used
" for bullet lists being treated like C comments; then define a bullet list
" style for single stars (like already is for hyphens):
set comments-=s1:/*,mb:*,ex:*/
set comments+=s:/*,mb:**,ex:*/
set comments+=fb:*

" treat lines starting with a quote mark as comments (for `Vim' files, such as
" this very one!), and colons as well so that reformatting usenet messages from
" `Tin' users works OK:
set comments+=b:\"
set comments+=n::


" * Text Formatting -- Specific File Formats

" enable filetype detection:
"filetype on

" recognize anything in my .Postponed directory as a news article, and anything
" at all with a .txt extension as being human-language text [this clobbers the
" `help' filetype, but that doesn't seem to prevent help from working
" properly]:
augroup filetype
  autocmd BufNewFile,BufRead */.Postponed/* set filetype=mail
  autocmd BufNewFile,BufRead *.txt set filetype=human
augroup END

" in human-language files, automatically format everything at 72 chars:
autocmd FileType mail,human set formatoptions+=t textwidth=72

" for C-like programming, have automatic indentation:
autocmd FileType c,cpp,slang set cindent

" for actual C (not C++) programming where comments have explicit end
" characters, if starting a new line in the middle of a comment automatically
" insert the comment leader characters:
autocmd FileType c set formatoptions+=ro

" for Perl programming, have things in braces indenting themselves:
autocmd FileType perl set smartindent

" for CSS, also have things in braces indented:
autocmd FileType css set smartindent

" for HTML, generally format text, but if a long line has been created leave it
" alone when editing:
autocmd FileType html set formatoptions+=tl

" for both CSS and HTML, use genuine tab characters for indentation, to make
" files a few bytes smaller:
autocmd FileType html,css set noexpandtab tabstop=2

" in makefiles, don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
" (despite the mappings later):
autocmd FileType make set noexpandtab shiftwidth=8


" * Search & Replace

" make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase

" show the `best match so far' as search strings are typed:
set incsearch

" assume the /g flag on :s substitutions to replace all matches in a line:
set gdefault


" * Keystrokes -- Moving Around

" have the h and l cursor keys wrap between lines (like <Space> and <BkSpc> do
" by default), and ~ covert case over line breaks; also have the cursor keys
" wrap in insert mode:
set whichwrap=h,l,~,[,]

" page down with <Space> (like in `Lynx', `Mutt', `Pine', `Netscape Navigator',
" `SLRN', `Less', and `More'); page up with - (like in `Lynx', `Mutt', `Pine'),
" or <BkSpc> (like in `Netscape Navigator'):
"noremap <Space> <PageDown>
noremap <BS> <PageUp>
" [<Space> by default is like l, <BkSpc> like h, and - like k.]

" scroll the window (but leaving the cursor in the same place) by a couple of
" lines up/down with <Ins>/<Del> (like in `Lynx'):
noremap <Ins> 2<C-Y>
noremap <Del> 2<C-E>
" [<Ins> by default is like i, and <Del> like x.]

" use <F6> to cycle through split windows (and <Shift>+<F6> to cycle backwards,
" where possible):
nnoremap <F6> <C-W>w
nnoremap <S-F6> <C-W>W

" use <Ctrl>+N/<Ctrl>+P to cycle through files:
nnoremap <C-N> :next<CR>
nnoremap <C-P> :prev<CR>
" [<Ctrl>+N by default is like j, and <Ctrl>+P like k.]

" have % bounce between angled brackets, as well as t'other kinds:
set matchpairs+=<:>

" have <F1> prompt for a help topic, rather than displaying the introduction
" page, and have it do this from any mode:
nnoremap <F1> :help<Space>
vmap <F1> <C-C><F1>
omap <F1> <C-C><F1>
map! <F1> <C-C><F1>


" * Keystrokes -- Formatting

" have Q reformat the current paragraph (or selected text if there is any):
nnoremap Q gqap
vnoremap Q gq

" have the usual indentation keystrokes still work in visual mode:
vnoremap <C-T> >
vnoremap <C-D> <LT>
vmap <Tab> <C-T>
vmap <S-Tab> <C-D>

" have Y behave analogously to D and C rather than to dd and cc (which is
" already done by yy):
noremap Y y$


" * Keystrokes -- Toggles

" Keystrokes to toggle options are defined here.  They are all set to normal
" mode keystrokes beginning \t but some function keys (which won't work in all
" terminals) are also mapped.

nmap <F4> :windo set scb!<CR>

"" have \tf ("toggle format") toggle the automatic insertion of line breaks
"" during typing and report the change:
"nnoremap \tf :if &fo =~ 't' <Bar> set fo-=t <Bar> else <Bar> set fo+=t <Bar>
"  \ endif <Bar> set fo?<CR>
"nmap <F3> \tf
"imap <F3> <C-O>\tf
"
" have \tl ("toggle list") toggle list on/off and report the change:
nnoremap \tl :set invlist list?<CR>
nmap <F2> \tl

" have \th ("toggle highlight") toggle highlighting of search matches, and
" report the change:
nnoremap \th :set invhls hls?<CR>


" * Keystrokes -- Insert Mode

" allow <BkSpc> to delete line breaks, beyond the start of the current
" insertion, and over indentations:
set backspace=eol,start,indent

" have <Tab> (and <Shift>+<Tab> where it works) change the level of
" indentation:
inoremap <Tab> <C-T>
inoremap <S-Tab> <C-D>
" [<Ctrl>+V <Tab> still inserts an actual tab character.]

syntax on



" Add custom filling in of printing, classes, functions, etc. based on the language
"
" General
inoremap ;k "<..>" : <..>,<esc>0f>ca<
inoremap ;M :vnew \| 0read ! 

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
" ts = 'number of spaces that <Tab> in file uses'
" sts = 'number of spaces that <Tab> uses while editing'
" sw = 'number of spaces to use for (auto)indent step'

autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=0 expandtab autoindent

" Node & Javascript
autocmd BufNewFile,BufRead * if match(getline(1),"node") >= 0 | set filetype=javascript | endif
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=0 expandtab autoindent
autocmd FileType javascript inoremap ;f function <..>(<..>) {<Enter><..><Enter>}<esc>kkt>ca<
autocmd FileType javascript inoremap ;l for ( var i = 0; i < <..>; i++ ) {<Enter><..><Enter>}<esc>kkt>ca<
autocmd FileType javascript inoremap ;p console.log(`<..>`);<esc>0/<..><Enter>ca<
autocmd FileType javascript inoremap ;t <esc>A.then( (<..>) => {<Enter><..><Enter>});<esc>kkt>ca<
autocmd FileType javascript inoremap ;c <esc>$xA.catch( (err) => {<Enter><..><Enter>});<esc>kt>ca<
autocmd FileType javascript inoremap ;r <..> = require("<..>");<esc>0f>ca<
autocmd FileType javascript inoremap ;R <..> = require("<..>"),<esc>0f>ca<
autocmd FileType javascript inoremap ;J JSON.stringify(<..>, null, 2)<esc>FJf>ca<

" PYTHON
autocmd FileType python inoremap ;c class <..>:<Enter>def __init__(self, <..>):<Enter>self.<..> = <..><esc>ggi
autocmd FileType python inoremap ;f def <..>(<..>):<Enter><..><esc>0kt>ca<
autocmd FileType python inoremap ;l for i in range(0, <..>):<Enter><..><esc>kt>ca<
autocmd FileType python inoremap ;p print(f'<..>')<esc>0t>ca<
autocmd FileType python inoremap ;m def main(argv):<Enter><..><Enter>pass<Enter><esc>I<Enter><Enter>if __name__ == "__main__":<Enter>main(sys.argv)<esc>5k0f>ca<


" C and Cpp
autocmd BufNewFile,BufRead * if match(getline(1),"*.hpp") >= 0 | set filetype=cpp | endif
autocmd BufNewFile,BufRead * if match(getline(1),"*.h") >= 0 | set filetype=c | endif
autocmd FileType c,cpp inoremap ;c #ifndef _<..>_H_<Enter>#define _<..>_H_<Enter><Enter>using namespace std;<Enter><Enter>class <..>:<Enter>{<Enter>public:<Enter><..>()<Enter>private:<Enter>};<Enter>#endif<esc>ggi
autocmd FileType c,cpp inoremap ;f  <..> <..>(<..>)<Enter>{<Enter><..><Enter>}<esc>kkkcw
autocmd FileType c,cpp inoremap ;m  int main(int argc, char *argv[])<Enter>{<Enter><..><Enter>}<esc>kwcw
autocmd FileType c,cpp inoremap ;l  for ( int i = 0; i < <..>; i++ )<Enter>{<Enter><..><Enter>}<esc>kkkt>ca<
autocmd FileType c,cpp inoremap ;i  #include ""<esc>i
autocmd FileType c,cpp inoremap ;I  #include <><esc>i
autocmd FileType cpp inoremap ;p  cout << "<..>" << endl;<esc>0t>ca<
autocmd FileType c inoremap ;p  printf("<..>\n");<esc>0t>ca<


" Skeleton Builders
autocmd FileType c inoremap ;t  <esc>:-1read $HOME/.vim/skeletons/.skeleton.c<CR>gg/<..><Enter>ca<
autocmd FileType cpp inoremap ;t  <esc>:-1read $HOME/.vim/skeletons/.skeleton.cpp<CR>gg/<..><Enter>ca<
autocmd FileType cpp inoremap ;ht  <esc>:-1read $HOME/.vim/skeletons/.skeleton.hpp<CR>gg/<..><Enter>ca<
autocmd FileType html inoremap ;t  <esc>:-1read $HOME/.vim/skeletons/.skeleton.html<CR>gg/<..><Enter>ca<






" Reload from place last closed
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif


set tags=./tags,tags;$HOME

fun! VTAG() range
  let oldfile=expand("%:p")
  vsplit
  set switchbuf=split
  try
    exe "tag ". expand("<cword>")
    let curfile=expand("%:p")
    if curfile == oldfile
        let pos=getpos(".")
        if &modified
        " if we have split before:
        quit
        endif
        call setpos('.', pos)
    endif
  catch
      if &modified
        exec ":q"
      endif
  endtry
endfun

fun! SPLITAG() range
  let oldfile=expand("%:p")
  if &modified
    split
  endif
  set switchbuf=split
  try
    exe "tag ". expand("<cword>")
    let curfile=expand("%:p")
    if curfile == oldfile
        let pos=getpos(".")
        if &modified
        " if we have split before:
        quit
        endif
        call setpos('.', pos)
    endif
  catch
      if &modified
        exec ":q"
      endif
  endtry
endfun

nmap <C-P> :Files<CR>z.

nnoremap C :grep! "\<<cword>\>" . -r<CR>:botright copen<CR>

" adjust pane layout with toggle C-y
fun! PANEHOR() 
    wincmd t
    wincmd H
endfun

fun! PANEVERT() 
    wincmd t
    wincmd K
endfun

" Toggle between vertical and horizontal layout
let g:vert = 0
fun! PANETOG()
    if g:vert
        call PANEVERT()
        let g:vert=0
    else
        call PANEHOR()
        let g:vert=1
    endif
endfun
nnoremap <C-y> :call PANETOG()<CR>

fun! ALIGN()
    :execute "normal! mtggvG='tzz" 
endfun

function! s:get_visual_selection()
    " Why is this not a built-in Vim script function?!
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction


fun! MACLOOKUP()
    :exe 'norm i' . system("wget -qO- \"https://api.macaddress.io/v1?apiKey=at_2d31hlNQAO1PXZVTecL6yoVAxI8IW&output=vendor&search=" . @0 . "\"")
endfun

fun! FIXNMAP()
    let @n ='$F F wyf $di(W'
    :g/Unknown/norm! @n
endfun
command NM :call FIXNMAP()

noremap W :call MACLOOKUP()<CR>

command AL :call ALIGN()

" Run current line in shell, load output to buffer
noremap Q !!sh<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
fu! InsertTabWrapper(direction)
  let char_before = col('.') - 1
  if !char_before || getline('.')[char_before - 1] !~ '\k'
    return "\<tab>"
  elseif "backward" == a:direction
    return "\<c-p>"
  else
    return "\<c-n>"
  endif
endfu
inoremap <tab> <c-r>=InsertTabWrapper("forward")<cr>
inoremap <s-tab> <c-r>=InsertTabWrapper("backward")<cr>

"*****************************************************************************
"
" Plugin Vimrc Content below
"
"*****************************************************************************
call plug#begin()

filetype plugin indent on

" Better Syntax Highlighting
Plug 'sheerun/vim-polyglot' 
" Colorscheme
Plug 'dikiaap/minimalist' 
" Colorscheme
Plug 'patstockwell/vim-monokai-tasty' 
" Status bar 
Plug 'itchyny/lightline.vim' 
" Lightline fix
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'monokai_tasty',
        \ 'component': {
        \   'tagbar': '%{tagbar#currenttag("[%s]", "")}',
        \ },
      \ }

" open tags in window w/ ctrl-t
Plug 'majutsushi/tagbar' 

" Open Markdown in browser, depends on:
" sudo npm install -g instant-markdown-d
Plug 'suan/vim-instant-markdown'

"TagBar Remap
map <C-t> :TagbarToggle<CR>
command T TagbarOpen<Space>j
let g:tagbar_compact = 1

" Insert or delete brackets, parens, quotes
Plug 'jiangmiao/auto-pairs' 
" Open peak at registers
Plug 'junegunn/vim-peekaboo' 
" J or K to open key words to jump to
Plug 'easymotion/vim-easymotion' 
" Easymotion keymaps
map <Leader> <Plug>(easymotion-prefix)
nmap J <Plug>(easymotion-bd-w)
nmap K <Plug>(easymotion-overwin-w)

" ctrl-o to zoom in on current pane
Plug 'vim-scripts/ZoomWin' 

" google for things in vim buffer
Plug 'szw/vim-g' 
let g:vim_g_command = "G"
let g:vim_g_f_command = "Gf"

" :Go to remove distractions and focus pane
Plug 'junegunn/goyo.vim' 
let g:goyo_width=120
function! s:goyo_enter()
    :set number
    :set relativenumber
endfunction
autocmd! User GoyoEnter nested call <SID>goyo_enter()


" leader-w on pane, leader-w on another, swap panes
Plug 'wesQ3/vim-windowswap' 
" make functions object to work with
Plug 'kana/vim-textobj-user' 
" asynchronous completion for vim8
Plug 'maralla/completor.vim' 

" Linter for vim
Plug 'dense-analysis/ale' 
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'python': ['add_blank_lines_for_python_control_statements', 'autopep8'],
\}

let g:ale_linters = {
\    'cpp': [],
\    'c': [],
\}

"show git differences
Plug 'mhinz/vim-signify' 
" fuzzy find files
Plug 'kien/ctrlp.vim'
let g:ctrlp_working_path_mode = 0
nnoremap <C-F> :CtrlPBuffer<Enter>

" File type and syntax for swift
Plug 'keith/swift.vim' 
Plug 'vim-syntastic/syntastic'
" Handle ctags smarter
Plug 'ludovicchabant/vim-gutentags' 

" File tree in nerdtree
Plug 'scrooloose/nerdtree' 
command Tog :NERDTreeToggle

" Tpope Plugins
" vim verb on surrouding operators
Plug 'tpope/vim-surround' 
" Add plugin support for . operator
Plug 'tpope/vim-repeat' 
" gc is now verb, gc3j comment out 3 lines down
Plug 'tpope/vim-commentary' 
" Commentary Changes
autocmd FileType c setlocal commentstring=//\ %s


" add :%Subvert to change case, i.e. CHILD/ADULT -> cHiLd -> aDuLt
Plug 'tpope/vim-abolish' 
" Add extra operators to [
Plug 'tpope/vim-unimpaired' 
" tmux bidnings for vim
Plug 'tpope/vim-tbone' 

" large suite of colorschemes
Plug 'flazz/vim-colorschemes'

Plug 'shinchu/lightline-gruvbox.vim'

call plug#end()

" Color scheme things
let g:solarized_termcolors=256
let g:palenight_terminal_italic=1
let g:palenight_termcolors=256

syntax enable
set background=dark

" SET COLORSCHEME
" it's worth seeint if lightline (bar at bottom) supports the theme
" let g:lightline.colorscheme = 'solarized'
"colorscheme vim-monokai-tasty


let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'
colorscheme gruvbox

" let g:lightline.colorscheme = 'flatcolor'
" colorscheme flatcolor
set background=dark
" colorscheme solarized
