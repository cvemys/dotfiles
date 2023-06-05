vim.g.loaded_netrw = 1 -- optional for nvim-tree
vim.g.loaded_netrwPlugin = 1 -- optional for nvim-tree

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.o.hlsearch = false
vim.wo.number = true
vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus"
vim.o.breakindent = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.wo.signcolumn = "yes"
vim.o.termguicolors = true

plugins = {
    {
        "nvim-treesitter/nvim-treesitter",
	-- TODO: Add configuration!
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        config = function()
            require("telescope").setup({
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true, -- override the generic sorter
                        override_file_sorter = true, -- override the file sorter
                        case_mode = "smart_case", -- or "ignore_case" or "respect_case"uzzy = true,
                    },
                },
            })
            require("telescope").load_extension("fzf")
            vim.keymap.set("n", "<C-_>", ":Telescope live_grep<CR>") -- it's actually C-/ 😐
            vim.keymap.set("n", "*", ":Telescope grep_string<CR>")
        end,
    },

    {
        "nvim-tree/nvim-tree.lua",
        lazy = false,
        config = function()
            require("nvim-tree").setup()
            vim.keymap.set("n", "<leader>f", ":NvimTreeToggle<CR>")
        end,
        dependencies = "nvim-tree/nvim-web-devicons",
    },
    {
        'f-person/git-blame.nvim',
        init = function()
            vim.g.gitblame_enabled = 0
        end,
        config = function()
            vim.keymap.set('n','<leader>g',':GitBlameToggle<CR>')
        end,
    },
}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- install plugins
require("lazy").setup(plugins)
