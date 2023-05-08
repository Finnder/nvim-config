local ensure_packer = function()
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})

vim.cmd [[packadd packer.nvim]]
return true
end
return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)

    use 'wbthomason/packer.nvim'
    use 'sainnhe/everforest'
    use 'ellisonleao/gruvbox.nvim'

    use 'nvim-tree/nvim-tree.lua'
    use 'nvim-tree/nvim-web-devicons'
    use 'nvim-lualine/lualine.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'jvirtanen/vim-octave'
    use 'f-person/git-blame.nvim'

    use 'kylechui/nvim-surround' 
        -- use ys<motion><delimiter>
        -- ys (add), cs(change), ds(delete) 
    use {

      'nvim-telescope/telescope.nvim', tag = '0.1.1',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

    use 'nvim-lua/popup.nvim'   
    use 'nvim-telescope/telescope-media-files.nvim'

    use { 'neoclide/coc.nvim', branch='release' }

    use 'dcampos/nvim-snippy'

-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins
if packer_bootstrap then
require('packer').sync()
end
end)