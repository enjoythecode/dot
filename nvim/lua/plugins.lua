require("nvim-web-devicons").setup()
require("nvim-tree").setup({
	view = {
		adaptive_size = true,
		mappings = {
			custom_only = true, -- cumbersome, but required for me to actually get a set up that works for me
			list = {
				{key = "l", action = "edit"}
			}
		}
	}
})
require("nvim-lsp-installer").setup {automatic_installation = true}
-- require("lspconfig").pyribht.setup {}
-- require'lspconfig'.gopls.setup{}
