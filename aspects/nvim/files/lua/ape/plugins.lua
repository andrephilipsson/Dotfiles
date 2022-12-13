local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data")
        .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({
            "git",
            "clone",
            "--depth",
            "1",
            "https://github.com/wbthomason/packer.nvim",
            install_path,
        })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

require("packer").startup(function(use)
    use({
        "wbthomason/packer.nvim",
        lock = true,
    })

    use({
        "marko-cerovac/material.nvim",
        lock = true,
    })

    use({
        "nvim-lualine/lualine.nvim",
        lock = true,
        requires = { "kyazdani42/nvim-web-devicons", opt = true, lock = true },
    })

    use({
        "lewis6991/gitsigns.nvim",
        lock = true,
    })

    use({
        "lukas-reineke/indent-blankline.nvim",
        lock = true,
    })

    use({
        "github/copilot.vim",
        lock = true,
    })

    use({
        "hrsh7th/nvim-cmp",
        lock = true,
    })

    use({
        "petertriho/cmp-git",
        lock = true,
        requires = "nvim-lua/plenary.nvim",
    })

    use({
        "hrsh7th/cmp-path",
        lock = true,
    })

    use({
        "hrsh7th/cmp-buffer",
        lock = true,
    })

    use({
        "hrsh7th/cmp-nvim-lua",
        lock = true,
    })

    use({
        "hrsh7th/cmp-nvim-lsp",
        lock = true,
    })

    use({
        "hrsh7th/cmp-emoji",
        lock = true,
    })

    use({
        "hrsh7th/cmp-cmdline",
        lock = true,
    })

    use({
        "f3fora/cmp-spell",
        lock = true,
    })

    use({
        "hrsh7th/cmp-nvim-lsp-signature-help",
        lock = true,
    })

    use({
        "neovim/nvim-lspconfig",
        lock = true,
    })

    use({
        "folke/neodev.nvim",
        lock = true,
    })

    use({ "L3MON4D3/LuaSnip", tag = "v1.1.*" })

    use({
        "numToStr/Comment.nvim",
        tag = "v0.7.*",
    })

    use({
        "saadparwaiz1/cmp_luasnip",
        lock = true,
        requires = { "L3MON4D3/LuaSnip", tag = "v1.1.*" },
    })

    use({
        "nvim-treesitter/nvim-treesitter",
        lock = true,
        run = function()
            local ts_update =
                require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
    })

    use({
        "JoosepAlviste/nvim-ts-context-commentstring",
        lock = true,
    })

    use({
        "nvim-tree/nvim-tree.lua",
        requires = {
            "nvim-tree/nvim-web-devicons",
            lock = true,
        },
        lock = true,
    })

    if packer_bootstrap then
        require("packer").sync()
    end
end)

vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "plugins.lua",
    command = "PackerCompile",
})
