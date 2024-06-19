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
    use 'tpope/vim-fugitive'
    use 'neovim/nvim-lspconfig'
    use 'sainnhe/gruvbox-material'
    use 'jnurmine/Zenburn'
    use 'AlessandroYorba/Sierra'
    use 'mrcjkb/haskell-tools.nvim'
    use 'mattn/emmet-vim'
    use "luckasRanarison/tailwind-tools.nvim"

    use {'golang/tools', run = 'GO111MODULE=on go install golang.org/x/tools/gopls@latest'}

    use 'marko-cerovac/material.nvim'

    use {
        "mcchrish/zenbones.nvim",
        requires = "rktjmp/lush.nvim"
    }
    
    local lspconfig = require 'lspconfig'

    lspconfig.gdscript.setup{
        cmd={ 'nc', '127.0.0.1', '6005' },
        filetypes = { 'gd', 'gdscript', 'gdscript3' },
        root_dir = lspconfig.util.root_pattern("project.godot", ".git"),
    }

    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })


    use {
        'junegunn/fzf',
        run = function() vim.fn['fzf#install']() end
    }
    use 'junegunn/fzf.vim'

    use 'nvim-lua/popup.nvim'   
    use 'nvim-telescope/telescope-media-files.nvim'

    use { 'neoclide/coc.nvim', branch='release' }

    use 'dcampos/nvim-snippy'

if packer_bootstrap then
require('packer').sync()
end
end)
