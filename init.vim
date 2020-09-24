call plug#begin('~/.local/share/nvim/plugged')

" tmux support
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'

" themes
" Plug 'gruvbox-material/vim', {'as': 'gruvbox-material'}
let g:gruvbox_contrast_light='hard'
let g:gruvbox_sign_column='bg0'
Plug 'morhetz/gruvbox'
Plug 'jacoborus/tender.vim'
Plug 'joshdick/onedark.vim'

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" languages
Plug 'sheerun/vim-polyglot'

" Editorconfig support
Plug 'editorconfig/editorconfig-vim'

" navigation
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'easymotion/vim-easymotion'

" git
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mhinz/vim-signify'

" visual perks
Plug 'yggdroot/indentline'
Plug 'psliwka/vim-smoothie'
Plug 'chrisbra/colorizer'

" better fuzzy search
" Plug '~/.local/share/nvim/plugged/vim-clap', { 'do': ':Clap install-binary!' }
Plug 'liuchengxu/vim-clap'

" completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'ncm2/ncm2'
"Plug 'roxma/nvim-yarp'
" enable ncm2 for all buffers
" autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
" set completeopt=noinsert,menuone,noselect
" Plug 'ncm2/ncm2-bufword'
" Plug 'ncm2/ncm2-path'
" Plug 'ncm2/nvim-typescript', {'for': 'typescript', 'do': './install.sh'}

" linting and highlighting
Plug 'desmap/ale-sensible' | Plug 'w0rp/ale'

call plug#end()

" ================================================================================

set termguicolors
set hidden
set nobackup
set nowritebackup
set autoread
set cmdheight=1
set updatetime=100
set shortmess+=c
set signcolumn=yes
filetype plugin indent on
syntax enable
set mouse=a
set tabstop=2
set expandtab
set encoding=UTF-8
set clipboard=unnamed
set timeoutlen=500
set expandtab     " replace <Tab with spaces
set tabstop=2     " number of spaces that a <Tab> in the file counts for
set softtabstop=2 " remove <Tab> symbols as it was spaces
set shiftwidth=2

" Leader key
let g:mapleader = "\<Space>"
let g:maplocalleader = ','


" theme
set background=light
colorscheme gruvbox
let g:lightline = { 'colorscheme': 'gruvbox' }
" if &background ==# 'dark'
"  let g:indentLine_color_gui = '#3c3836'
"else
  "let g:indentLine_color_gui = '#d5c4a1'
"endif


" tmux
autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand(fnamemodify(getcwd(), ':t')))


" buffers
nmap <silent> <Leader>bb :Clap buffers<CR>
nmap <silent> <Leader>bn :bnext<CR>
nmap <silent> <Leader>bp :bprevious<CR>


" files
nmap <Leader>fs :write<CR>


" windows
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


" vim-clap
let g:clap_theme = 'solarized_light'
let g:clap_no_matches_msg = "There is nothing here but the sound of the world's tiniest violin..."
let g:clap_popup_input_delay = 0
let g:clap_layout = { 'width': '84%', 'height': '33%', 'row': '33%', 'col': '8%' }
nmap <Leader>fr :Clap history<CR>
nmap <Leader>fb :Clap filer<CR>
nnoremap <silent> <Leader>ff :Clap files --hidden --no-ignore-vcs --grep "!.git/"<CR>
nmap <Leader>fg :Clap gfiles<CR>
nmap <Leader>fc :Clap bcommits<CR>
nmap <Leader>fh :Clap history<CR>
nmap <Leader>fu :Clap git_diff_files<CR>
nmap <Leader>ss :Clap grep<CR>
nmap <Leader>sc :Clap command<CR>
nmap <Leader>sl :Clap lines<CR>
nmap <Leader>sb :Clap blines<CR>
nmap <Leader>sw :Clap grep ++query=<cword><CR>
nmap <Leader>vc :Clap colors<CR>
nmap <Leader>vt :Clap filetypes<CR>


" vim-plug
nmap <silent> <Leader>vpi :PlugInstall <CR>
nmap <silent> <Leader>vpu :PlugUpdate <CR>
nmap <silent> <Leader>vps :PlugStatus <CR>
nmap <silent> <Leader>var :AirlineRefresh<CR>


" Airline
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline_theme='gruvbox'
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


" easymotion
let g:EasyMotion_keys = 'ghfjdksla;ruvnbtymiewqopcxzm'
let g:EasyMotion_startofline = 1

map <Leader>jl <Plug>(easymotion-bd-jk)
nmap <Leader>jl <Plug>(easymotion-overwin-line)
map <Leader>jk <Plug>(easymotion-k)
map <Leader>jj <Plug>(easymotion-s)
map <Leader>js <Plug>(easymotion-s2)


" NERDTree
nmap <silent> <Leader>tt :NERDTreeToggleVCS<CR>
nmap <silent> <Leader>ts :NERDTreeFind<CR>
nmap <silent> <Leader>ft :NERDTreeFind<CR>
nmap <silent> <Leader>tf :NERDTreeFocus<CR>
nmap <silent> <Leader>tr :NERDTreeRefreshRoot<CR>


" Git
let g:gitgutter_max_signs = 500
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '='
let g:gitgutter_sign_removed = '–'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '~'
let g:ale_sign_error = 'X'
let g:ale_sign_warning = '!'
nmap <silent> <leader>cep <Plug>(ale_previous_wrap)
nmap <silent> <leader>cen <Plug>(ale_next_wrap)
nnoremap <silent> <leader>gs :Gina status<CR>
nnoremap <silent> <leader>gc :Gina commit<CR>
nnoremap <silent> <leader>gb :Gina blame<CR>

let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'


" coc

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


" Reload this config
nmap <silent> <Leader>vr :source ~/.config/nvim/init.vim<CR>:echo "source ~/.config/nvim/init.vim"<CR>

" which-key
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

