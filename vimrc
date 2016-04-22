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
Plug 'flowtype/vim-flow'
Plug 'garbas/vim-snipmate'
Plug 'geekjuice/vim-mocha'
Plug 'geekjuice/vim-picoline'
Plug 'heavenshell/vim-jsdoc'
Plug 'henrik/vim-qargs'
Plug 'jgdavey/tslime.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-xmark', { 'do': 'make' }
Plug 'kchmck/vim-coffee-script'
Plug 'kien/ctrlp.vim'
Plug 'lambdatoast/elm.vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'mxw/vim-jsx'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'rking/ag.vim'
Plug 'ryanss/vim-hackernews'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'terryma/vim-multiple-cursors'
Plug 'tomtom/tlib_vim'
Plug 'Townk/vim-autoclose'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'Xuyuanp/nerdtree-git-plugin'

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
vnoremap ; :

" Leader Commands
let mapleader = " "

" Read/Write
nnoremap <leader>q <esc>:q
nnoremap <leader>w <esc>:w<CR>:echo "File saved"<cr>
nnoremap <leader>S <esc>:mks! .previous.vim<cr>:echo "Session saved"<cr>
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

" Move Visual Blocks
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Increment/Decrement
nnoremap <C-i> <C-a>
nnoremap <C-x> <C-x>

" Folding
nnoremap <leader><leader> za
vnoremap <leader><leader> zf

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" Clipboard
vnoremap <leader>c "*y
nnoremap <leader>v "*p

" Vimrc
nnoremap <silent> <leader>ve :e $MYVIMRC<cr>
nnoremap <silent> <leader>vs :so $MYVIMRC<cr>:echo "VIMRC reloaded"<cr>

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

" Plug Updater
nnoremap <leader>up :PlugUpgrade<cr>:PlugUpdate<cr>:PlugDiff<cr>


"======================================
"   SETTINGS
"======================================
syntax on
filetype plugin indent on
set rtp+=~/.fzf

set cole=0                              "concealing characters
set complete=.,t                        "keep tab complete within file
set cursorline                          "highlight current cursor line
set encoding=utf-8                      "utf8 encoding
set fillchars=vert:\|,fold:-            "fill chars for status line
set hlsearch                            "highlight searches
set ignorecase                          "ignore case during search
set incsearch                           "do incremental searching
set laststatus=2                        "always display status line
set lazyredraw                          "redraw only when we need to.
set list listchars=tab:»·,trail:·       "tab and space chars (optional eol:¬)
set modelines=0                         "no modeline
set nocompatible                        "user vim over vi settings
set number                              "show current line
set numberwidth=4                       "number gutter width
set relativenumber                      "use relative line numbers
set ruler                               "row and column info
set scrolloff=999                       "keep cursor at the center
set showcmd                             "display incomplete commands
set showmatch                           "jump to first match
set smartcase                           "search uppercase if given
set synmaxcol=100                       "prevent syntax on long lines
set t_ut=                               "screen refresh issue with Tmux
set ttyfast                             "faster screen refresh(?)
set updatetime=3600                     "update time
set textwidth=100                       "Text width 100 for formatting

" Tmp file settings
set noswapfile
set nobackup
set nowritebackup

set backup
set backupdir=/var/tmp,/tmp
set directory=~/var/tmp,/tmp
set writebackup

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
let g:picoline_limit = 100              "Color change on > 100 columns
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

let g:ag_prg = 'ag --column -S'

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
    echo "[vim-mocha] Not using tmux"
  else
    let g:vim_mocha_use_tmux = 1
    echo "[vim-mocha] Using tmux"
  endif
endfunction

" Vim-spec mappings
nnoremap <leader>ta :call RunAllSpecs()<cr>
nnoremap <leader>tt :call RunCurrentSpecFile()<cr>
nnoremap <leader>ts :call RunNearestSpec()<cr>
nnoremap <leader>tl :call RunLastSpec()<cr>


"======================================
"   GIT-GUTTER
"======================================
let g:gitgutter_escape_grep = 1 "Use raw grep
let g:gitgutter_realtime = 1
let g:gitgutter_sign_modified = '#'
let g:gitgutter_sign_modified_removed = '_'

" Line hightlight Toggle
nnoremap <leader>g :GitGutterLineHighlightsToggle<cr>


"======================================
"   SYNTASTIC
"======================================
let g:syntastic_check_on_open = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_highlighting = 1
let g:syntastic_ignore_files = ['\.min\.', '\.html$']
let g:syntastic_css_checkers = ['stylelint']
let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_checkers = ['flow']
let g:syntastic_javascript_eslint_exec = 'eslint_d'
let g:syntastic_java_checkers = ['checkstyle']
let g:syntastic_coffee_coffeelint_args = '--file ~/.coffeelintrc'
let g:syntastic_error_symbol = "✗"
let g:syntastic_style_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_style_warning_symbol = "⚠"

" Bindings
nnoremap <leader>st :SyntasticToggleMode<cr>
nnoremap <leader>sc :SyntasticCheck<cr>
nnoremap <leader>sr :SyntasticReset<cr>
nnoremap <leader>sl :Errors<cr>


"======================================
"   NERD{TREE|COMMENTER}
"======================================
let NERDTreeIgnore=['node_modules[[dir]]']  "Adds space between comments
let NERDTreeQuitOnOpen = 1                  "Closes NerdTree after open file
let NERDTreeShowHidden = 1                  "Show hidden files
let NERDSpaceDelims = 1                     "Adds space between comments

" NERDtree toggle
nnoremap <leader>o :NERDTreeToggle<CR><c-w>=
nnoremap <leader>ff :NERDTreeFind<CR><c-w>=


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
let g:javascript_enable_domhtmlcss  = 1
let g:javascript_conceal_function   = "ƒ"
let g:javascript_conceal_null       = "ø"
let g:javascript_conceal_this       = "@"
let g:javascript_conceal_return     = "⇚"
let g:javascript_conceal_undefined  = "¿"
let g:javascript_conceal_NaN        = "ℕ"
let g:javascript_conceal_prototype  = "¶"
let g:javascript_conceal_static     = "•"
let g:javascript_conceal_super      = "Ω"


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
let g:jsdoc_enable_es6 = 1


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
"   LIMELIGHT
"======================================
nnoremap <leader>ll :Limelight!!<cr>
let g:limelight_default_coefficient = 0.8


"======================================
"   XMARK
"======================================
nnoremap <leader>mp :Xmark<cr>
nnoremap <leader>mo :Xmark!<cr>


"======================================
"   FZF
"======================================
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'down': '20%' }

nnoremap <C-f> :Files<space>


"======================================
"   SNIPMATE
"======================================
imap <C-j> <Plug>snipMateNextOrTrigger
smap <C-j> <Plug>snipMateNextOrTrigger
imap <C-k> <Plug>snipMateBack
smap <C-k> <Plug>snipMateBack
vmap <C-v> <Plug>snipMateVisual

let g:snipMate = {}
let g:snipMate.snippet_version = 1


"======================================
"   SPOTIFY
"======================================
nnoremap msp :Dispatch! musigmachi spotify play<CR>
nnoremap mss :Dispatch! musigmachi spotify pause<CR>
nnoremap ms. :Dispatch! musigmachi spotify next<CR>
nnoremap ms, :Dispatch! musigmachi spotify prev<CR>


"======================================
"   FUGITIVE
"======================================
nnoremap gaa :silent! Git add . \| redraw!<CR>
nnoremap gac :silent! Git add . \| redraw! \| Gcommit<CR>
nnoremap gst :Gstatus<CR>


"======================================
"   FLOW
"======================================
nnoremap <leader>fm :FlowMake<CR>
nnoremap <leader>ft :FlowType<CR>

let g:flow#autoclose = 1
let g:flow#enable = 0
let g:flow#errjmp = 0
let g:flow#omnifunc = 1
let g:flow#qfsize = 0


"======================================
"   SYNTAX/FILETYPE/HIGHLIGHT
"======================================
" Auto save last session on close
execute "autocmd VimLeavePre * mksession! " . g:vimtmp . "previous.vim"

" Git
autocmd Filetype gitcommit setlocal spell textwidth=72

" Markdown
autocmd BufRead,BufNewFile *.md setlocal spell textwidth=100 filetype=markdown
autocmd Filetype markdown setlocal ai ts=4 sts=4 et sw=4

" YAML
autocmd BufRead,BufNewFile *.lyaml setlocal filetype=yaml
autocmd Filetype yaml setlocal ai ts=2 sts=2 et sw=2

" Shell
autocmd Filetype conf setlocal syntax=sh
autocmd Filetype conf,sh,zsh setlocal ai ts=4 sts=4 et sw=4
autocmd BufRead,BufNewFile .env* setlocal filetype=sh

" HTML/Jade
autocmd BufRead,BufNewFile *.handlebars setlocal filetype=html

" Python
autocmd Filetype python setlocal ai ts=4 sts=4 et sw=4

" Ruby
autocmd BufRead,BufNewFile *.ru setlocal filetype=ruby
autocmd BufRead,BufNewFile Gemfile* setlocal filetype=ruby

" JSON
autocmd Filetype json nnoremap <leader>j :%!jq .<cr>

" Goyo + Limelight
" autocmd User GoyoEnter Limelight
" autocmd User GoyoLeave Limelight!


" Set color depending on terminal color support
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
endif
