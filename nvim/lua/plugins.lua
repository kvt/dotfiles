local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
	execute 'packadd packer.nvim'
end

return require('packer').startup(function()

	use {'wbthomason/packer.nvim', opt = true}

	-- Trailing whitespace highlighting & automatic fixing
	use 'ntpeters/vim-better-whitespace'

	-- auto-close plugin
	-- use 'rstacruz/vim-closer'
	-- use 'jiangmiao/auto-pairs'

	-- Intellisense Engine
	use {'neoclide/coc.nvim', run = function() vim.fn['coc#util#install'](0) end }
	use 'codota/tabnine-vim'
	use {'codechips/coc-svelte', run = 'npm install'}

	-- Git Plugins
	-- Enable git changes to be shown in sign column
	use 'mhinz/vim-signify'
	use 'tpope/vim-fugitive'

	-- Syntax Highlighting
	-- Improved syntax highlighting and indentation
	use 'othree/yajs.vim'
	use 'HerringtonDarkholme/yats.vim'
	use 'pangloss/vim-javascript'


	-- Customized vim status line
	use 'vim-airline/vim-airline'

	-- Icons
	use 'ryanoasis/vim-devicons'

	-- Comment
	use 'tpope/vim-commentary'

	-- Svelte
	use 'evanleck/vim-svelte'

	use 'tpope/vim-repeat'
	use 'tpope/vim-surround'


	use 'editorconfig/editorconfig-vim'

	use 'justinmk/vim-sneak'
	use 'easymotion/vim-easymotion'

	use 'honza/vim-snippets'

	use 'morhetz/gruvbox'
	use {'dracula/vim', as = 'dracula'}
	use 'arcticicestudio/nord-vim'
	use 'joshdick/onedark.vim'
	use {'sonph/onehalf', rtp = 'vim'}
	use 'rakr/vim-one'


	use 'nvim-lua/popup.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'

end)
