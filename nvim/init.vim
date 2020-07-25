" Ketan Tada
" Vim Plug {{{

" check whether vim-plug is installed and install it if necessary
let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'
if !filereadable(plugpath)
    if executable('curl')
        let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
        if v:shell_error
            echom "Error downloading vim-plug. Please install it manually.\n"
            exit
        endif
    else
        echom "vim-plug not installed. Please install it manually or install curl.\n"
        exit
    endif
endif

call plug#begin('~/.config/nvim/plugged')

" === Editing Plugins === "
" Trailing whitespace highlighting & automatic fixing
Plug 'ntpeters/vim-better-whitespace'

" auto-close plugin
Plug 'rstacruz/vim-closer'
Plug 'jiangmiao/auto-pairs'

" Intellisense Engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Snippet support
" Plug 'Shougo/neosnippet'
" Plug 'Shougo/neosnippet-snippets'

" Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }

" Print function signatures in echo area
Plug 'Shougo/echodoc.vim'

" === Git Plugins === "
" Enable git changes to be shown in sign column
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'

" === Javascript Plugins === "
" Typescript syntax highlighting
Plug 'HerringtonDarkholme/yats.vim'

" Plug 'sheerun/vim-polyglot'

" ReactJS JSX syntax highlighting
Plug 'mxw/vim-jsx'

" === Syntax Highlighting === "

" Syntax highlighting for nginx
" Plug 'chr4/nginx.vim'

" Syntax highlighting for javascript libraries
Plug 'othree/javascript-libraries-syntax.vim'

" Improved syntax highlighting and indentation
Plug 'othree/yajs.vim'
Plug 'pangloss/vim-javascript'

" Generate JSDoc commands based on function signature
" Plug 'heavenshell/vim-jsdoc'

" Customized vim status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Icons
Plug 'ryanoasis/vim-devicons'

" Initialize plugin system
Plug 'tpope/vim-commentary'
Plug 'evanleck/vim-svelte'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

Plug 'chriskempson/base16-vim'

Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'terryma/vim-expand-region'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user' | Plug 'whatyouhide/vim-textobj-xmlattr'

Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'justinmk/vim-sneak'

" Plug 'vimwiki/vimwiki'
" Plug 'ChristianChiarulli/codi.vim'

"" Snippets
" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'arcticicestudio/nord-vim'
Plug 'joshdick/onedark.vim'
Plug 'kewah/vim-stylefmt'

call plug#end()

" }}}
" Misc {{{
set backspace=indent,eol,start
let g:vimwiki_list = [{'path': '~/.wiki/'}]
set clipboard=unnamed
set hidden
set autoread
set updatetime=300
set nocompatible

execute "set t_8f=\e[38;2;%lu;%lu;%lum"
execute "set t_8b=\e[48;2;%lu;%lu;%lum"

" }}}
" Spaces & Tabs {{{
set tabstop=4           " 4 space tab
set expandtab           " use spaces for tabs
set softtabstop=4       " 4 space tab
set shiftwidth=4
set modelines=1
filetype indent on
filetype plugin on
set autoindent
set nowrap
" }}}
" UI Layout {{{
set number relativenumber              " show line numbers
set showcmd             " show command in bottom bar
set nocursorline        " highlight current line
set wildmenu
set lazyredraw
set showmatch           " higlight matching parenthesis
set fillchars+=vert:?
set splitbelow splitright
set cmdheight=1
set shortmess+=c
set noshowmode
set diffopt+=vertical
set scrolloff=10
" }}}
" Searching {{{
set ignorecase          " ignore case when searching
set smartcase
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches
" }}}
" Folding {{{
"=== folding ===
set foldmethod=indent   " fold based on indent level
set foldnestmax=10       " max 10 depth
set foldenable          " don't fold files by default on open
set foldlevelstart=10   " start with fold level of 1
" }}}
" COC {{{
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')


" Symbol renaming.
nnoremap 'rn <Plug>(coc-rename)
nnoremap 'rpw :CocSearch <C-R>=expand('<cword>')<CR><CR>

" Remap keys for applying codeAction to the current buffer.
nnoremap 'ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nnoremap 'qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Search workspace symbols.
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Resume latest coc list.
nnoremap <silent> <space>c  :<C-u>CocList<CR>
nnoremap <silent> <space>n  :<C-u>CocCommand explorer<CR>

" }}}
" FZF {{{
let $FZF_DEFAULT_COMMAND = 'rg --hidden --files --glob !.git'
let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all,ctrl-d:deselect-all'
let g:fzf_layout = { 'down': '~80%' }
" }}}
" NeoSnippets {{{
" Load custom snippets from snippets folder
let g:neosnippet#snippets_directory='~/.config/nvim/snippets'

" Hide conceal markers
let g:neosnippet#enable_conceal_markers = 0

" }}}
" AutoGroups {{{
augroup configgroup
    autocmd!
    autocmd! ColorScheme * call s:custom_colors()
    autocmd! FileType vim,c++,txt setlocal foldmethod=marker
    autocmd! BufWritePost *.css,*.scss,*.sass silent !stylefmt %
augroup END
" }}}
" Testing {{{
" }}}
" VimWiki {{{
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
" }}}
" Backups {{{
set backup

if has('persistent_undo')
  set undofile
  set undolevels=3000
  set undoreload=10000
endif
set backupdir=~/.local/share/nvim/backup " Don't put backups in current dir
set backup
set noswapfile

" }}}
" airline {{{
" Wrap in try/catch to avoid errors on initial install before plugin is available
try

let g:airline_theme = 'onedark'
" === Vim airline ==== "
" Enable extensions
let g:airline_extensions = ['hunks', 'coc']

" Update section z to just have line number
let g:airline_section_z = airline#section#create(['linenr'])

" Do not draw separators for empty sections (only for the active window) >
let g:airline_skip_empty_sections = 1

" Smartly uniquify buffers names with similar filename, suppressing common parts of paths.
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Custom setup that removes filetype/whitespace from default vim airline bar
let g:airline#extensions#default#layout = [['a', 'c'], ['x', 'z', 'warning', 'error']]

" Customize vim airline per filetype
" 'nerdtree'  - Hide nerdtree status line
" 'list'      - Only show file type plus current line number out of total
let g:airline_filetype_overrides = {
  \ 'nerdtree': [ get(g:, 'NERDTreeStatusline', ''), '' ],
  \ 'list': [ '%y', '%l/%L'],
  \ }

" Enable powerline fonts
let g:airline_powerline_fonts = 1

" Enable caching of syntax highlighting groups
let g:airline_highlighting_cache = 1

" Define custom airline symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" Don't show git changes to current file in airline
let g:airline#extensions#hunks#enabled=0

catch
  echo 'Airline not installed. It should work after running :PlugInstall'
endtry

" }}}
" Custom Functions {{{
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! s:custom_colors()
  " coc.nvim color changes
  hi link CocErrorSign ErrorMsg
  hi link CocWarningSign Number
  hi link CocInfoSign Type

  " Make background transparent for many things
  hi Normal ctermbg=NONE guibg=NONE
  hi NonText ctermbg=NONE guibg=NONE
  hi LineNr ctermfg=NONE guibg=NONE
  hi SignColumn ctermfg=NONE guibg=NONE
  " hi StatusLine guifg=#16252b guibg=#6699CC
  " hi StatusLineNC guifg=#16252b guibg=#16252b

  " Try to hide vertical spit and end of buffer symbol
  hi VertSplit gui=NONE guifg=#4b5263 guibg=#4b5263
  " hi EndOfBuffer ctermbg=NONE ctermfg=NONE guibg=#17252c guifg=#17252c

  " Customize NERDTree directory
  hi NERDTreeCWD guifg=#99c794

  " Make background color transparent for git changes
  hi SignifySignAdd guibg=NONE
  hi SignifySignDelete guibg=NONE
  hi SignifySignChange guibg=NONE

  " Highlight git change signs
  hi SignifySignAdd guifg=#99c794
  hi SignifySignDelete guifg=#ec5f67
  hi SignifySignChange guifg=#c594c5
endfunction

" }}}
" Sneak {{{
let g:sneak#prompt = 'search(type two chars): '
let g:sneak#use_ic_scs = 1
let g:sneak#label = 1
let g:sneak#s_next = 1

" }}}
" Shortcuts {{{
let mapleader="\<Space>"

" Quick window switching
nmap <leader>h <C-w>h
nmap <leader>j <C-w>j
nmap <leader>k <C-w>k
nmap <leader>l <C-w>l
nmap <leader>t <C-^>

noremap <silent> <C-S-Left> :vertical resize +3<CR>
noremap <silent> <C-S-Right> :vertical resize -3<CR>
noremap <silent> <C-S-Up> :resize +3<CR>

nmap <leader>x :q<CR>
nmap <leader>b :bd<CR>

nnoremap j gj
nnoremap k gk
nnoremap gV `[v`]


nnoremap <leader>o :Buffers<CR>
nnoremap <leader>e :Files<CR>

nnoremap <leader>f :Rg <C-r><C-w><CR>
nnoremap <leader>sp :CocSearch <C-r><C-w><CR>

map <leader>r :%s///<left><left>
nmap <silent> <leader>/ :nohlsearch<CR>


imap <silent> ii <C-[>
nmap <silent> <leader>w :w<CR>
" Allows you to save files you opened without write permissions via sudo
cmap w!! w !sudo tee %

" === vim-jsdoc shortcuts ==="
" Generate jsdoc for function under cursor
nmap <leader>z :JsDoc<CR>

" Delete current visual selection and dump in black hole buffer before pasting
" Used when you want to paste over something without it getting copied to
" Vim's default buffer
vnoremap p "_dP

noremap , <PageDown>
noremap - <PageUp>

nmap <leader>y :StripWhitespace<CR>

nnoremap 0 ^
nnoremap ^ 0

nnoremap w W
nnoremap W w

nnoremap b B
nnoremap B b

nnoremap e E
nnoremap E e

if has("nvim")
  au TermOpen * tnoremap <Esc> <c-\><c-n>
  au FileType fzf tunmap <Esc>
endif

vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)

" Map <C-k> as shortcut to activate snippet if available
" imap <C-k> <Plug>(neosnippet_expand_or_jump)
" smap <C-k> <Plug>(neosnippet_expand_or_jump)
" xmap <C-k> <Plug>(neosnippet_expand_target)

" Use <C-l> for trigger snippet expand.
imap fj <Plug>(coc-snippets-expand)
" imap jf <Plug>(coc-snippets-expand)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<tab>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

map gS <Plug>Sneak_,
map gs <Plug>Sneak_;

nnoremap <leader>v :vs<CR>:Files<CR>

" imap <C-k> <Plug>(coc-snippets-expand)

cmap kk <Up>
cmap jj <Down>

nmap <leader><Space> :
map <Tab> %

" }}}
" Leader Shortcuts {{{
"   %bd|e#
"   leader is <Space> and local leader is (')
    nnoremap 'k :bufdo bd<CR> 
    nnoremap <Enter> <C-^>
    nnoremap 'f :Rg<Space>
    nnoremap <leader>g :CocSearch<Space>
    nnoremap 'gds :Gdiffsplit!<CR>
    nnoremap 'h :diffget //2<CR>
    nnoremap 'l :diffget //3<CR>

" }}}
" Signify {{{
let g:signify_sign_delete = '-'
" }}}
" Uncategorized{{{
" Reload icons after init source
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif


" }}}
" Colors {{{
syntax enable           " enable syntax processing
" let base16colorspace=256
set background=dark
set termguicolors
colorscheme onedark
" set guifont=Fira\ Code:h18
" }}}

" vim:foldmethod=marker:foldlevel=0
"
