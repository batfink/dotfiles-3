" vim-plug
call plug#begin('$HOME/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'cohama/lexima.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'fatih/vim-go'
Plug 'flazz/vim-colorschemes'
Plug 'geekjuice/vim-studio'
Plug 'heavenshell/vim-jsdoc'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kovisoft/paredit'
Plug 'metakirby5/codi.vim'
Plug 'mhinz/vim-grepper'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'Xuyuanp/nerdtree-git-plugin'

call plug#end()

" colorscheme
set background=dark
try
  colorscheme hybrid
catch
endtry

" vim-airline
let g:airline_theme = 'bubblegum'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#tabline#enabled = 0
let g:tmuxline_preset = 'powerline'

" force <c-c> to behave exactly like <esc>
noremap <c-c> <esc>

" colon -> semicolon
nnoremap ; :
vnoremap ; :

" leader commands
let mapleader = " "

" read/write
nnoremap <leader>q <esc>:q
nnoremap <leader>w <esc>:w<cr>:echo "File saved"<cr>
nnoremap <leader>W :w !sudo tee > /dev/null %<cr>

" splits
nnoremap <leader>n :vne<cr>
nnoremap <leader>m :sp<cr>
nnoremap <leader>w= <c-w>=

" tabs
nnoremap <leader>t :tabnew<cr>

" last buffer
nnoremap <leader>; <c-^><cr>

" whitespace cleaner
nnoremap <leader><BS> mz:ret<cr>:%s/\v\s+$//ge<cr>:echo "Whitespace cleaned"<cr>`z

" tab width toggles
noremap <leader>2 :set ai et ts=2 sts=2 sw=2<cr>:echo "Tabs: 2"<cr>
noremap <leader>4 :set ai et ts=4 sts=4 sw=4<cr>:echo "Tabs: 4"<cr>

" commands
nnoremap <leader>r @:

" move visual blocks
vnoremap <c-j> :m '>+1<cr>gv=gv
vnoremap <c-k> :m '<-2<cr>gv=gv

" clipboard
vnoremap <leader>c "*y
nnoremap <leader>v "*p

" vimrc
nnoremap <silent> <leader>ve :e $MYVIMRC<cr>
nnoremap <silent> <leader>vs :so $MYVIMRC<cr>:echo "VIMRC reloaded"<cr>

" screw ex mode
nnoremap Q <Nop>

" toggle conceal
nnoremap <leader><leader> :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<cr>

" get off my lawn
nnoremap <Left> :echo "Use h"<cr>
nnoremap <Right> :echo "Use l"<cr>
nnoremap <Up> :echo "Use k"<cr>
nnoremap <Down> :echo "Use j"<cr>

" switch ctrl-movement keys to window switching
nmap <c-k> <c-w><Up>
nmap <c-j> <c-w><Down>
nmap <c-l> <c-w><Right>
nmap <c-h> <c-w><Left>

" plug updater
nnoremap <leader>pi :PlugInstall<cr>
nnoremap <leader>pc :PlugClean<cr>
nnoremap <leader>pd :PlugDiff<cr>
nnoremap <leader>pu :PlugUpgrade<cr>:PlugUpdate<cr>

" settings
syntax on
filetype plugin indent on
set rtp+=$HOME/.fzf

set cole=0                              "concealing characters
set complete=.,t                        "keep tab complete within file
set concealcursor=nvic                  "conceal modes
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
set nofoldenable                        "disable code folding
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
set textwidth=80                        "Text width 100 for formatting

" tmp file settings
set noswapfile
set nobackup
set nowritebackup

" backup settings
set backup
set backupdir=/var/tmp,/tmp
set directory=/var/tmp,/tmp
set writebackup

" tmp directory
let s:tmpdir="/tmp/vim/"

" persistent undo
set undofile
let s:undodir=s:tmpdir . "undo"
execute "set undodir=" . s:undodir
if !isdirectory(s:undodir)
  silent call mkdir (s:undodir, 'p')
endif

" whitespace settings
set smarttab
set expandtab
set smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set nojoinspaces

" new split settings
set splitbelow
set splitright

" tab settings
function! Tabline()
  let s = ''
  for i in range(tabpagenr('$'))
    let tab = i + 1
    let winnr = tabpagewinnr(tab)
    let buflist = tabpagebuflist(tab)
    let bufnr = buflist[winnr - 1]
    let bufname = bufname(bufnr)
    let bufmodified = getbufvar(bufnr, "&mod")
    let selected = tab == tabpagenr()

    let s .= '%' . tab . 'T'
    let s .= (selected ? '%#TabLineSel#' : '%#TabLine#')
    let s .= (selected ? '[ ' : ' ')
    let s .= tab .':'
    let s .= (bufname != '' ? fnamemodify(bufname, ':t') : 'No Name')
    let s .= (selected ? ' ] ' : ' ')

    if bufmodified
      let s .= '[+] '
    endif
  endfor

  let s .= '%#TabLineFill#'
  return s
endfunction
set tabline=%!Tabline()

" sessions
nnoremap <leader>ss :SaveSession<cr>
nnoremap <leader>so :LoadSession<cr>
nnoremap <leader>sd :DeleteSession<cr>
nnoremap <leader>sl :ListSessions<cr>
nnoremap <leader>sa :LastSession<cr>

" ctrl-p
let g:ctrlp_show_hidden = 1             "start with ctrlp not working dotfiles
let g:ctrlp_match_window_reversed = 1   "show matched starting frm bottom
let g:ctrlp_switch_buffer = 0           "open new instances regardless if open
let g:ctrlp_by_filename = 0             "default filename search
let g:ctrlp_clear_cache_on_exit = 0     "keep corss session cache
let g:ctrlp_working_path_mode = 0       "don't set local dir on every invoke
let g:ctrlp_lazy_update = 100           "debounce search once typing has stopped

" tab completion
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

" the silver searcher
if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case'
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" grepper
let g:grepper = {}
let g:grepper.tools = ['ag', 'git']
let g:grepper.quickfix = 1
let g:grepper.switch = 1

nnoremap \ :Grepper<cr>
nnoremap <leader>\ :Grepper -cword -noprompt<cr>

" git-gutter
let g:gitgutter_escape_grep = 1 "use raw grep
let g:gitgutter_realtime = 1
let g:gitgutter_sign_modified = '#'
let g:gitgutter_sign_modified_removed = '_'

nnoremap <leader>g :GitGutterLineHighlightsToggle<cr>

" nerd{tree|commenter}
let NERDTreeIgnore=['node_modules[[dir]]']  "adds space between comments
let NERDTreeQuitOnOpen = 1                  "closes nerdtree after open file
let NERDTreeShowHidden = 1                  "show hidden files
let NERDSpaceDelims = 1                     "adds space between comments

nnoremap <leader>o :NERDTreeToggle<cr><c-w>=
nnoremap <leader>ff :NERDTreeFind<cr><c-w>=

" jsdoc
let g:jsdoc_default_mapping = 0
let g:jsdoc_input_description = 1
let g:jsdoc_return_description = 0
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_underscore_private = 0
let g:jsdoc_access_descriptions = 0
let g:jsdoc_enable_es6 = 1

nnoremap <leader>// :JsDoc<cr>

" multi-cursor
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_next_key = '<c-n>'
let g:multi_cursor_prev_key = '<c-p>'
let g:multi_cursor_skip_key = '<c-x>'
let g:multi_cursor_quit_key = '<c-c>'
let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode = 0

" fzf
let g:fzf_command_prefix = 'Fzf'
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'down': '20%' }

nnoremap <c-f> :FzfFiles<space>

" easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
vmap <space>ac :EasyAlign \ allll { 'ig': ['!Comment'] }<cr>

" goyo
nnoremap <leader>z :Goyo<cr>

" git
autocmd Filetype gitcommit setlocal spell textwidth=72

" markdown
autocmd Filetype markdown setlocal spell ai ts=4 sts=4 et sw=4

" yaml
autocmd BufRead,BufNewFile *.lyaml setlocal filetype=yaml

" shell
autocmd Filetype conf setlocal syntax=sh
autocmd BufRead,BufNewFile .env* setlocal filetype=sh

" json
autocmd Filetype * nnoremap <leader>j :%!jq .<cr>

" clojure
autocmd Filetype clojure nmap <c-c><c-k> :Require<cr>

" set color depending on terminal color support
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
endif
