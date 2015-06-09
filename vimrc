"======================================
"   GLOBAL VARIABLES
"======================================
let g:vimtmp = "~/.dotfiles/vim/tmp/"


"======================================
"   PLUGINS
"======================================
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'digitaltoad/vim-jade'
Plug 'geekjuice/vim-picoline'
Plug 'geekjuice/vim-mocha'
Plug 'jgdavey/tslime.vim'
Plug 'junegunn/goyo.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'rking/ag.vim'
Plug 'majutsushi/tagbar'
Plug 'othree/html5.vim'
Plug 'mtscout6/vim-cjsx'
Plug 'ryanss/vim-hackernews'
Plug 'tpope/vim-haml'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'Townk/vim-autoclose'
Plug 'heavenshell/vim-jsdoc'
Plug 'terryma/vim-multiple-cursors'

call plug#end()


"======================================
"   COLORSCHEME
"======================================
colorscheme monokai


"======================================
"   KEY MAPPINGS
"======================================
" Force <c-c> to behave exactly like <esc>
noremap <c-c> <esc>

" Colon -> Semicolon
nnoremap ; :

" Leader Commands
let mapleader = " "

" Toggles
nnoremap <leader>p :set invpaste paste?<CR>
nnoremap <leader>s :set invspell spell?<CR>
nnoremap <leader>h :set invhlsearch hlsearch?<CR>

" Read/Write
nnoremap <leader>q <esc>:q
nnoremap <leader>w <esc>:w<CR>:echo "File saved"<cr>
nnoremap <leader>S <esc>:mks!<cr>:echo "Session saved"<cr>
nnoremap <leader>W :w !sudo tee > /dev/null %<cr>

" Splits
nnoremap <leader>n :vne<cr>
nnoremap <leader>m :sp<cr>
nnoremap <leader>w= <c-w>=

" Tabs
nnoremap <leader>t :tabnew<cr>

" Last buffer
nnoremap <leader>; <c-^><cr>

" Whitespace cleaner
nnoremap <leader><BS> mz:ret<cr>:%s/\v\s+$//ge<cr>:echo "Whitespace cleaned"<cr>`z

" Tab Width Toggles
noremap <leader>2 :set ai et ts=2 sts=2 sw=2<cr>:echo "Tabs: 2"<cr>
noremap <leader>4 :set ai et ts=4 sts=4 sw=4<cr>:echo "Tabs: 4"<cr>

" Commands
nnoremap <leader>r @:

" Folding
nnoremap <leader><leader> za
vnoremap <leader><leader> zf

" Bracket jump
nnoremap <leader><tab> %
vnoremap <leader><tab> %

" Move Visual Blocks
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Screw Ex Mode
nnoremap Q <Nop>

" Force Highlight on search
nnoremap / :set hlsearch<CR>/

" Get off my lawn
nnoremap <Left> :echo "Use h"<CR>
nnoremap <Right> :echo "Use l"<CR>
nnoremap <Up> :echo "Use k"<CR>
nnoremap <Down> :echo "Use j"<CR>

" Switch ctrl-movement keys to window switching
nmap <C-k> <C-w><Up>
nmap <C-j> <C-w><Down>
nmap <C-l> <C-w><Right>
nmap <C-h> <C-w><Left>
nmap <c-[> :tabprevious<cr>
nmap <c-]> :tabnext<cr>

" Highlight group under cursor
map <leader>[] :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>



"======================================
"   SETTINGS
"======================================
syntax on
filetype plugin indent on

set nocompatible                        "user vim over vi settings
set encoding=utf-8                      "utf8 encoding
set list listchars=tab:»·,trail:·       "tab and space chars (optional eol:¬)
set laststatus=2                        "always display status line
set fillchars=vert:\|,fold:-            "fill chars for status line
set t_ut=                               "screen refresh issue with Tmux
set ruler                               "row and column info
set numberwidth=4                       "number gutter width
set cursorline                          "highlight current cursor line
set incsearch                           "do incremental searching
set hlsearch                            "highlight searches
set showmatch                           "jump to first match
set ignorecase                          "ignore case during search
set smartcase                           "search uppercase if given
set scrolloff=999                       "keep cursor at the center
set showcmd                             "display incomplete commands
set complete=.,t                        "keep tab complete within file
set ttyfast                             "faster screen refresh(?)
set modelines=0                         "no modeline
set number                              "show current line
set relativenumber                      "use relative line numbers
set updatetime=750                      "update time

" Tmp file settings
set noswapfile
set nobackup
set nowritebackup

" Persistent Undo
set undofile
execute "set undodir=" . g:vimtmp . "vim_undo"

" Viminfo
execute "set viminfo+=n" . g:vimtmp . "viminfo"

" Whitespace settings
set smarttab
set expandtab
set smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set nojoinspaces

" New split settings
set splitbelow
set splitright

" Tab settings
set guitablabel=%t


"======================================
"   PICOLINE
"======================================
let g:picoline_color = "default"        "Default colorscheme
let g:picoline_ctrlp = 1                "Use picoline theme for ctrlp
let g:picoline_limit = 80               "Color change on > 80 columns
let g:picoline_trunc = 0                "Truncate cols > 100
let g:picoline_nchar = 1                "Show cursor number (not char count)
let g:picoline_color = 1                "Colored modes

" Use less fancy for Chromebook or if fancy is false
if match(system('uname -i'), 'armv7l') >= 0
  let g:picoline_fsyms = [ "»", "«", "!!", "← " ]
elseif match(system('echo $FANCY_SYMBOLS'), 'false') >= 0
  let g:picoline_fancy = 0
endif


"======================================
"   CTRL-P
"======================================
" Settings
let g:ctrlp_show_hidden = 1             "Start with CtrlP not working dotfiles
let g:ctrlp_match_window_reversed = 1   "Show matched starting frm bottom
let g:ctrlp_switch_buffer = 0           "Open new instances regardless if open
let g:ctrlp_by_filename = 0             "Default filename search
let g:ctrlp_clear_cache_on_exit = 0     "Keep corss session cache
let g:ctrlp_working_path_mode = 0       "Don't set local dir on every invoke


"======================================
"   TAB COMPLETION
"======================================
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
set wildmode=list:longest,list:full
set complete=.,w,t
func! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction


"======================================
"   THE SILVER SEARCHER
"======================================
if executable('ag')
" Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

let g:agprg = 'ag --column -S'

" Search mappings
nnoremap K :Ag "\b<C-R><C-W>\b"<CR>
nnoremap \ :Ag<space>

" NOTE/TODO Search
nnoremap <leader>\ :Ag "NOTE\|TODO\|DEBUG"<CR>


"======================================
"   TSLIME
"======================================
nmap <leader>rs <Plug>SetTmuxVars
nnoremap <leader>: :Tmux<space>


"======================================
"   VIM-MOCHA
"======================================
let g:vim_mocha_use_tmux = 0
nnoremap <leader>tm :call VimMochaToggleTmux()<cr>

func! VimMochaToggleTmux()
  if g:vim_mocha_use_tmux
    let g:vim_mocha_use_tmux = 0
    let g:mocha_js_command = '!cortado {spec}'
    echo "[vim-mocha] Using tmux"
  else
    let g:vim_mocha_use_tmux = 1
    let g:mocha_js_command = 'call Send_to_Tmux("cortado {spec}\n")'
    echo "[vim-mocha] Not using tmux"
  endif
endfunction

" Vim-spec mappings
nnoremap <leader>ta :call RunAllSpecs()<cr>
nnoremap <leader>tt :call RunCurrentSpecFile()<cr>
nnoremap <leader>ts :call RunNearestSpec()<cr>
nnoremap <leader>tl :call RunLastSpec()<cr>


"======================================
"   CTAGS/TAGBAR
"======================================
" Tagbar
let g:tagbar_autofocus = 1
let g:tagbar_left = 0

" Index ctags and open tagbar
nnoremap <Leader>ct :!ctags -R .<CR>
nnoremap <leader>] :TagbarToggle<CR><c-w>=
nnoremap <leader>[ :TagbarTogglePause<CR>


"======================================
"   GIT-GUTTER
"======================================
let g:gitgutter_escape_grep = 1         "Use raw grep
let g:gitgutter_realtime = 1
let g:gitgutter_sign_modified = '#'
let g:gitgutter_sign_modified_removed = '_'

" Linehightlight Toggle
nnoremap <leader>g :GitGutterLineHighlightsToggle<cr>


"======================================
"   SYNTASTIC
"======================================
let g:syntastic_check_on_open = 1       "Check on open
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_java_checkers = ['checkstyle']
let g:syntastic_coffee_coffeelint_args = '--file ~/.coffeelintrc'

" Syntastic Toggle
nnoremap <leader>e :SyntasticToggleMode<cr>

" Eslint (Should output to quickfix)
nnoremap <leader>jl :!eslint %<cr>


"======================================
"   NERD{TREE|COMMENTER}
"======================================
let NERDTreeQuitOnOpen = 1              "Closes NerdTree after open file
let NERDSpaceDelims = 1                 "Adds space between comments

" NERDtree toggle
nnoremap <leader>o :NERDTreeToggle<CR><c-w>=


"======================================
"   GOYO
"======================================
let g:goyo_width = 120

" Goyo toggle
nnoremap <leader>z :Goyo<cr>

" Before/After callbacks
function! s:goyo_before()
  " silent !tmux set status off
  set noshowmode
  set noshowcmd
endfunction

function! s:goyo_after()
  " silent !tmux set status on
  set showmode
  set showcmd
endfunction

let g:goyo_callbacks = [ function('s:goyo_before'), function('s:goyo_after') ]


"======================================
"   JAVASCRIPT SYNTAX
"======================================
let g:jsx_ext_required = 0


"======================================
"   HACKER NEWS
"======================================
nnoremap <leader>hn :HackerNews<cr>


"======================================
"   JSDoc
"======================================
nnoremap <leader>// :JsDoc<cr>

let g:jsdoc_default_mapping = 0
let g:jsdoc_allow_input_prompt = 0
let g:jsdoc_underscore_private = 0
let g:jsdoc_allow_shorthand = 1


"======================================
"   MULTI-CURSOR
"======================================
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_next_key = '<C-n>'
let g:multi_cursor_prev_key = '<C-p>'
let g:multi_cursor_skip_key = '<C-x>'
let g:multi_cursor_quit_key = '<C-c>'
let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode = 0



"======================================
"   SYNTAX/FILETYPE/HIGHLIGHT
"======================================
" Auto save last session on close
execute "autocmd VimLeave * mksession! " . g:vimtmp . "last-session.vim"

" Git
autocmd Filetype gitcommit setlocal spell textwidth=72

" Markdown
autocmd BufRead,BufNewFile *.md setlocal spell textwidth=80 filetype=markdown

" YAML
autocmd BufRead,BufNewFile *.lyaml setlocal filetype=yaml
autocmd Filetype yaml setlocal ai ts=2 sts=2 et sw=2

" Shell
autocmd Filetype conf setlocal syntax=sh
autocmd Filetype conf,sh,zsh setlocal ai ts=4 sts=4 et sw=4

" HTML/Jade
autocmd BufRead,BufNewFile *.handlebars setlocal filetype=html

" Python
autocmd Filetype python setlocal ai ts=4 sts=4 et sw=4

" Ruby
autocmd BufRead,BufNewFile *.ru setlocal filetype=ruby
autocmd BufRead,BufNewFile Gemfile* setlocal filetype=ruby

" Java/Gradle
autocmd Filetype java,groovy setlocal ai ts=4 sts=4 et sw=4
autocmd BufNewFile,BufRead *.gradle setlocal filetype=groovy

" JSON
autocmd Filetype json nnoremap <leader>j :%!jq .<cr>

" CJSX
autocmd BufRead,BufNewFile *.cjsx let g:syntastic_coffee_checkers = []


" Set color depending on terminal color support
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
endif
