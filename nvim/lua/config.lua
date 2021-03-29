 -- Misc {{{
vim.api.nvim_set_option('backspace', 'indent,eol,start')
vim.api.nvim_set_option('clipboard', 'unnamed')
vim.api.nvim_set_option('hidden', true)
vim.api.nvim_set_option('autoread', true)
vim.api.nvim_set_option('updatetime', 300)
vim.cmd('set nocompatible')

vim.api.nvim_set_option('t_8f', '\\e[38;2;%lu;%lu;%lum')
vim.api.nvim_set_option('t_8b', '\\e[48;2;%lu;%lu;%lum')
-- }}}

-- Spaces & Tabs {{{
vim.api.nvim_set_option('tabstop', 2)
vim.api.nvim_set_option('expandtab', true)
vim.api.nvim_set_option('softtabstop', 2)
vim.api.nvim_set_option('shiftwidth', 2)
vim.api.nvim_set_option('modelines', 1)
vim.cmd('filetype indent on')
vim.cmd('filetype plugin on')
vim.o.autoindent = true
vim.cmd('set nowrap')
 -- }}}

 -- UI Layout {{{
vim.cmd('set number')

vim.api.nvim_set_option('showcmd', true)
vim.api.nvim_set_option('nocursorline', true)
vim.api.nvim_set_option('wildmenu', true)
vim.api.nvim_set_option('lazyredraw', true)
vim.api.nvim_set_option('showmatch', true)
vim.cmd('set fillchars+=vert:?')
vim.cmd('set splitbelow splitright')
vim.cmd('set cmdheight=1')
vim.cmd('set shortmess+=c')
vim.api.nvim_set_option('noshowmode', true)
vim.cmd('set diffopt+=vertical')
vim.cmd('set scrolloff=10')
 -- }}}

 -- Searching {{{
vim.cmd('set ignorecase')          -- ignore case when searching
vim.cmd('set smartcase')
vim.cmd('set incsearch')           -- search as characters are entered
vim.cmd('set hlsearch')            -- highlight all matches
 -- }}}


 -- Folding {{{
vim.cmd('set foldmethod=syntax')  -- fold based on indent level
vim.cmd('set foldnestmax=10')     -- max 10 depth
vim.cmd('set foldenable')         -- don't fold files by default on open
vim.cmd('set foldlevelstart=10')  -- start with fold level of 1
 -- }}}
