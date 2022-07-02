require("nvim-web-devicons").setup()
require'nvim-treesitter.configs'.setup {
	ensure_installed = { "python", "markdown", "lua", "vim" }
}
require("nvim-lsp-installer").setup {automatic_installation = true}
require("toggleterm").setup()
-- require("lspconfig").pyribht.setup {}
-- require'lspconfig'.gopls.setup{}
