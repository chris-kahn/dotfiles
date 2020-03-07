call plug#begin('~/.local/share/nvim/plugged')

Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'ryanoasis/vim-devicons'
Plug 'psliwka/vim-smoothie'
Plug 'mhinz/vim-startify'
Plug 'Shougo/deoplete.nvim'
Plug 'diepm/vim-rest-console'

" tmux support
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'

" Themes
Plug 'gruvbox-material/vim', {'as': 'gruvbox-material'}
Plug 'morhetz/gruvbox'
Plug 'xero/sourcerer.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'joshdick/onedark.vim'
Plug 'relastle/bluewery.vim'
Plug 'arzg/vim-substrata'
Plug 'fcpg/vim-fahrenheit'
Plug 'romainl/Apprentice'
Plug 'ayu-theme/ayu-vim'
Plug 'desmap/slick'
Plug 'haishanh/night-owl.vim'
Plug 'bluz71/vim-nightfly-guicolors'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'rbgrouleff/bclose.vim'

if !has('nvim')
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'yggdroot/indentline'
Plug 'tpope/vim-sleuth'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-vinegar'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
Plug 'desmap/ale-sensible' | Plug 'w0rp/ale'
Plug 'lambdalisue/gina.vim'
Plug 'airblade/vim-gitgutter'
" Plug 'esneider/YUNOcommit.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scalameta/coc-metals', {'do': 'yarn install --frozen-lockfile'}
Plug 'majutsushi/tagbar'

Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
Plug 'puremourning/vimspector', { 'do': './install_gadget.py --enable-chrome --enable-node' }

Plug 'vimwiki/vimwiki'


" ================================================================================
" Plug 'camspiers/animate.vim'
" Plug 'camspiers/lens.vim'
let g:lens#animate = 0
let g:lens#height_resize_max = 60
let g:lens#height_resize_min = 10
let g:lens#width_resize_max = 120
let g:lens#width_resize_min = 40
" ================================================================================

call plug#end()

" ================================================================================

set termguicolors
set hidden
set nobackup
set nowritebackup
set autoread
set cmdheight=1
set updatetime=300
set shortmess+=c
set signcolumn=yes
set grepprg=ag\ --vimgrep

filetype plugin indent on
syntax enable
set mouse=a
set tabstop=2
set expandtab
set encoding=UTF-8
set clipboard=unnamed

" Leader key
let g:mapleader = "\<Space>"
let g:maplocalleader = ','

" which-key map
" ================================================================================
let g:which_key_map =  {
  \ 'b': {
    \ 'name' : '+buffers',
    \ 'b': 'List open buffers',
    \ 'n': 'Next buffer',
    \ 'p': 'Previous buffer',
    \ 'd': 'Close buffer'
  \ },
  \ 'c': {
    \ 'name' : '+code',
    \ 'c': 'Code signature',
    \ 'd': 'Go to definition',
    \ 'i': 'Go to implementation',
    \ 'k': 'Show documentation'
  \ },
  \ 'f': {
    \ 'name' : '+file',
    \ 'c': 'Commits',
    \ 'f': 'Search by name',
    \ 'g': 'Search in git',
    \ 'r': 'Recently opened',
    \ 's': 'Save',
    \ 't': 'Show in tree'
  \ },
  \ 'g': {
    \ 'name' : '+git'
  \ },
  \ 'h': {
    \ 'name' : '+hunk'
  \ },
  \ 'j': {
    \ 'name' : '+jump',
    \ 'l': 'Jump to line',
    \ 'k': 'Jump to line above',
    \ 'j': 'Jump to char',
    \ 's': 'Jump to chars (2)',
  \ },
  \ 'q': {
    \ 'name' : '+quit'
  \ },
  \ 's': {
    \ 'name' : '+search',
    \ 'b': 'Search buffers',
    \ 'c': 'Recent commands',
    \ 'l': 'Search open file',
    \ 's': 'Search project',
  \ },
  \ 't': {
    \ 'name': '+tree',
    \ 't': 'Open tree',
    \ 's': 'Show current file',
    \ 'f': 'Focus tree',
    \ 'r': 'Refresh tree'
  \ },
  \ 'v': {
    \ 'name' : '+vim',
    \ 'c': 'Change colours',
    \ 'p': {
      \ 'name': '+vim-plug',
      \ 'i': 'Install',
      \ 's': 'Status',
      \ 'u': 'Update'
    \ },
    \ 'r': 'Reload config'
  \ },
  \ 'w': {
    \ 'name' : '+window',
    \ 'h': 'Jump left',
    \ 'j': 'Jump down',
    \ 'k': 'Jump up',
    \ 'l': 'Jump right',
    \ 'd': 'Close window',
    \ 's': {
    \ 'name': '+split',
    \ 'h': 'Split horizontal',
    \ 'v': 'Split vertical'
    \ }
  \ },
\ }

"call which_key#register('<Space>', "g:which_key_map")
autocmd! User vim-which-key call which_key#register('<Space>', 'g:which_key_map')
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" function! s:fzf_statusline()
"   " Override statusline as you like
"   highlight fzf1 ctermfg=161 ctermbg=251
"   highlight fzf2 ctermfg=23 ctermbg=251
"   highlight fzf3 ctermfg=237 ctermbg=251
"   setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
" endfunction

" autocmd! User FzfStatusLine call <SID>fzf_statusline()

" vim-clap
" ================================================================================
let g:clap_no_matches_msg = "There is nothing here but the sound of the world's tiniest violin..."
let g:clap_popup_input_delay = 0
let g:clap_layout = { 'width': '84%', 'height': '33%', 'row': '33%', 'col': '8%' }
"let g:clap_provider_grep_opts = '--hidden'
" let g:clap_theme = { 'display': {'guifg': '#282828', 'ctermfg': 'red'}, 'current_selection': {'guifg': '#282828', 'ctermfg': 'red'} }
" hi link ClapSpinner PmenuSel
" hi link ClapDisplay Search
" hi link ClapCurrentSelection CursorLine
autocmd ColorScheme * hi ClapDisplay cterm=bold gui=bold ctermfg=235 guifg=#282828 ctermbg=228 guibg=#f2e5bc
autocmd ColorScheme * hi ClapMatches cterm=bold gui=bold ctermfg=235 guifg=#282828 ctermbg=223 guibg=#d5c4a1
autocmd ColorScheme * hi ClapCurrentSelection cterm=bold gui=bold ctermfg=235 guifg=#282828 ctermbg=250 guibg=#d5c4a1
autocmd ColorScheme * hi ClapPreview cterm=bold gui=bold ctermfg=235 guifg=#282828 ctermbg=223 guibg=#ebdbb2

" tmux
" ================================================================================
autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand(fnamemodify(getcwd(), ':t')))

" ALE
" ================================================================================
let g:ale_fixers = {
            \'*': ['remove_trailing_lines', 'trim_whitespace'],
            \'javascript': ['prettier'],
            \'typescript': ['prettier'],
            \'css' : ['prettier'],
            \'html' : ['prettier'],
            \'markdown' : ['prettier'],
            \'yaml': ['prettier'],
            \'json': ['prettier'],
            \}
let g:ale_fix_on_save = 0
let g:ale_linters_explicit = 1
" let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_warning = '⚠'
let g:ale_sign_error = '✘'
let g:ale_sign_info = ''

" Theme
" ================================================================================
set background=light
colorscheme gruvbox
let g:lightline = { 'colorscheme': 'gruvbox' }

" Airline
" ================================================================================
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline_theme='gruvbox'
"let g:airline_section_b = 
let g:airline_section_y = '%{&fileencoding}'
let g:airline_section_z = '0x%B > %c:%l'

let g:airline#extensions#hunks#enabled = 0

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''

let g:airline_mode_map = {
    \ '__'     : '---',
    \ 'c'      : 'c',
    \ 'i'      : 'i',
    \ 'ic'     : 'i',
    \ 'ix'     : 'i',
    \ 'n'      : 'n',
    \ 'multi'  : 'm',
    \ 'ni'     : 'ni',
    \ 'no'     : 'no',
    \ 'R'      : 'r',
    \ 'Rv'     : 'rv',
    \ 's'      : 's',
    \ 'S'      : 'S',
    \ ''     : 'SB',
    \ 't'      : 't',
    \ 'v'      : 'v',
    \ 'V'      : 'l',
    \ ''     : 'b',
    \ }


" Indentation
" ================================================================================
" {{{
  " let g:indentLine_setColors = 0
  if &background ==# 'dark'
    let g:indentLine_color_gui = '#3c3836'
  else
    let g:indentLine_color_gui = '#d5c4a1'
  endif
" }}}

" Easymotion
" ================================================================================
let g:EasyMotion_keys = 'ghfjdksla;ruvnbtymiewqopcxzm'
let g:EasyMotion_startofline = 1
map <Leader>jl <Plug>(easymotion-bd-jk)
nmap <Leader>jl <Plug>(easymotion-overwin-line)

map <Leader>jk <Plug>(easymotion-k)
map <Leader>jj <Plug>(easymotion-s)
map <Leader>js <Plug>(easymotion-s2)

" FZF
" ================================================================================
let $BAT_THEME = 'gruvbox'
 command! -bang -nargs=* Find call fzf#vim#grep(
      \ 'rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --glob "!**/node_modules/*" --glob "!yarn.lock" --color "always" '.shellescape(<q-args>),
      \ 1,
      \ {'options': '--layout=reverse --delimiter : --nth 4.. --preview "~/.local/share/nvim/plugged/fzf.vim/bin/preview.sh {}" --preview-window right:80:noborder'},
      \ <bang>)

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'source': 'rg --files --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --glob "!**/node_modules/*"', 'options': ['--layout=reverse', '--info=inline', '--preview-window', 'down:15:noborder']}), <bang>0)

let g:fzf_nvim_statusline = 0

" List file history
nmap <Leader>fr :Clap history<CR>

" Browse
nmap <Leader>fb :Clap filer<CR>

" List all files
nnoremap <silent> <Leader>ff :Clap files --hidden --no-ignore-vcs --grep "!.git/"<CR>

" List all files in git
nmap <Leader>fg :Clap gfiles<CR>

" Git commits for the current buffer
nmap <Leader>fc :Clap bcommits<CR>

"
nmap <Leader>fh :Clap history<CR>

" List uncommitted git files
nmap <Leader>fu :Clap git_diff_files<CR>

" Search all files in the current directory
nmap <Leader>ss :Clap grep<CR>

" Search command history
nmap <Leader>sc :Clap command<CR>

" Search the lines of open buffers
nmap <Leader>sl :Clap lines<CR>

" Search the lines of the current buffer
nmap <Leader>sb :Clap blines<CR>

nmap <Leader>sw :Clap grep ++query=<cword><CR>

" Change color scheme
nmap <Leader>vc :Clap colors<CR>

" Change active file type
nmap <Leader>vt :Clap filetypes<CR>

" Reload this config
nmap <silent> <Leader>vr :source ~/.config/nvim/init.vim<CR>:echo "source ~/.config/nvim/init.vim"<CR>




" Buffers
" ================================================================================
nmap <silent> <Leader>bb :Clap buffers<CR>
nmap <silent> <Leader>bn :bnext<CR>
nmap <silent> <Leader>bp :bprevious<CR>


" Files
" ================================================================================
nmap <Leader>fs :write<CR>


" Window
" ================================================================================
map <silent> <Leader>qq :exit<CR>
nmap <silent> <Leader>wh <c-w><c-h>
nmap <silent> <Leader>wj <c-w><c-j>
nmap <silent> <Leader>wk <c-w><c-k>
nmap <silent> <Leader>wl <c-w><c-l>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nmap <silent> <Leader>wd :close <CR>
nmap <silent> <Leader>wsv :vsplit <CR>
nmap <silent> <Leader>wsh :split <CR>

" NERDTree
" ================================================================================
nmap <silent> <Leader>tt :NERDTreeToggleVCS<CR>
nmap <silent> <Leader>ts :NERDTreeFind<CR>
nmap <silent> <Leader>ft :NERDTreeFind<CR>
nmap <silent> <Leader>tf :NERDTreeFocus<CR>
nmap <silent> <Leader>tr :NERDTreeRefreshRoot<CR>

" Git
" ====================================================================
let g:ale_sign_error = 'X'
let g:ale_sign_warning = '!'
nmap <silent> <leader>cep <Plug>(ale_previous_wrap)
nmap <silent> <leader>cen <Plug>(ale_next_wrap)

" Git
" ====================================================================
" Plug 'tpope/vim-fugitive'
" Fix broken syntax highlight in gitcommit files
" (https://github.com/tpope/vim-git/issues/12)
"let g:fugitive_git_executable = 'env LANG=en_US.UTF-8 git'

nnoremap <silent> <leader>gs :Gina status<CR>
"nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gina commit<CR>
nnoremap <silent> <leader>gb :Gina blame<CR>
"nnoremap <silent> <leader>ge :Gedit<CR>
"nnoremap <silent> <leader>gE :Gedit<space>
"nnoremap <silent> <leader>gr :Gread<CR>
"nnoremap <silent> <leader>gR :Gread<space>
"nnoremap <silent> <leader>gw :Gwrite<CR>
"nnoremap <silent> <leader>gW :Gwrite!<CR>
"nnoremap <silent> <leader>gq :Gwq<CR>
"nnoremap <silent> <leader>gQ :Gwq!<CR>

"function! ReviewLastCommit()
"  if exists('b:git_dir')
"    Gtabedit HEAD^{}
"    nnoremap <buffer> <silent> q :<C-U>bdelete<CR>
"  else
"    echo 'No git a git repository:' expand('%:p')
"  endif
"endfunction
"nnoremap <silent> <leader>g` :call ReviewLastCommit()<CR>

"augroup fugitiveSettings
"  autocmd!
"  autocmd FileType gitcommit setlocal nolist
"  autocmd BufReadPost fugitive://* setlocal bufhidden=delete
"augroup END
"
let g:gitgutter_max_signs = 500
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '='
let g:gitgutter_sign_removed = '–'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '~'

" CoC
" ====================================================================
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
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
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> <leader>cdp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>cdn <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> <leader>cd <Plug>(coc-definition)
nmap <silent> <leader>cc :call CocActionAsync('doHover')<CR>:call CocActionAsync('showSignatureHelp')<CR>
nmap <silent> <leader>ci <Plug>(coc-implementation)
nmap <silent> <leader>cr <Plug>(coc-references)
" Use K to show documentation in preview window
nnoremap <silent> <leader>ck :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
" autocmd CursorHold * silent call CocActionAsync('showSignatureHelp')

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Remap for rename current word
nmap <leader>cn <Plug>(coc-rename)


" Tagbar
" ====================================================================
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
let g:tagbar_autofocus = 1
nmap <silent> <Leader>ct :TagbarToggle<CR>

" Vimspector
" ====================================================================
nmap <Leader>dc <Plug>VimspectorContinue
nmap <Leader>ds <Plug>VimspectorStop
nmap <Leader>dr <Plug>VimspectorRestart
nmap <Leader>dp <Plug>VimspectorPause
nmap <Leader>db <Plug>VimspectorToggleBreakpoint
nmap <Leader>df <Plug>VimspectorAddFunctionBreakpoint
nmap <Leader>do <Plug>VimspectorStepOver
nmap <Leader>di <Plug>VimspectorStepInfo
nmap <Leader>du <Plug>VimspectorStepOut
nnoremap <Leader>dd :call vimspector#Launch()<CR>


" General settings
" ====================================================================
" for which-key pop-up
set timeoutlen=500

set expandtab     " replace <Tab with spaces
set tabstop=2     " number of spaces that a <Tab> in the file counts for
set softtabstop=2 " remove <Tab> symbols as it was spaces
set shiftwidth=2

" Vim-Plug bindings
nmap <silent> <Leader>vpi :PlugInstall <CR>
nmap <silent> <Leader>vpu :PlugUpdate <CR>
nmap <silent> <Leader>vps :PlugStatus <CR>
nmap <silent> <Leader>var :AirlineRefresh<CR>

set cursorline     " highlight current line

" let g:netrw_liststyle = 3
