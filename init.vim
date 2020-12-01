call plug#begin('~/.local/share/nvim/plugged')

" tree-sitter
" Plug 'nvim-treesitter/nvim-treesitter'

" tmux support
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'

" themes
" Plug 'gruvbox-material/vim', {'as': 'gruvbox-material'}
let g:gruvbox_contrast_light='hard'
let g:gruvbox_sign_column='bg0'
let g:gruvbox_transparent_background=1
let g:gruvbox_material_transparent_background=1
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'jacoborus/tender.vim'
Plug 'joshdick/onedark.vim'

" Plug 'franbach/gruvbox-material'

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
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#2e282a ctermbg=4
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#282224 ctermbg=4
" Plug 'yggdroot/indentline'
Plug 'psliwka/vim-smoothie'
Plug 'chrisbra/colorizer'

" better fuzzy search
" Plug '~/.local/share/nvim/plugged/vim-clap', { 'do': ':Clap install-binary!' }
Plug 'liuchengxu/vim-clap'

" completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'vn-ki/coc-clap'
Plug 'puremourning/vimspector'

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

" lua <<EOF
" require'nvim-treesitter.configs'.setup {
"  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
"  highlight = {
"    enable = true,              -- false will disable the whole extension
"    disable = { "c", "rust" },  -- list of language that will be disabled
"  },
" }
" EOF

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

let g:vimspector_enable_mappings = 'HUMAN'

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Leader key
let g:mapleader = "\<Space>"
let g:maplocalleader = ','


" theme
set background=dark
colorscheme gruvbox-material


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
let g:clap_theme = 'atom_dark'
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

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction


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
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
" autocmd CursorHold * silent call CocActionAsync('showSignatureHelp')

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Remap for rename current word
nmap <leader>cn <Plug>(coc-rename)
"
" Search workspace symbols.
nnoremap <silent><nowait> <Leader>sc  :Clap coc_symbols<cr>
nnoremap <silent><nowait> <Leader>so  :Clap coc_outline<cr>

nnoremap <silent><nowait> <Leader>csd  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <Leader>cse  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <Leader>csc  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <Leader>cso  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <Leader>css  :<C-u>CocList -I symbols<cr>

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
  \ }
\ }

"call which_key#register('<Space>', "g:which_key_map")
autocmd! User vim-which-key call which_key#register('<Space>', 'g:which_key_map')
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
