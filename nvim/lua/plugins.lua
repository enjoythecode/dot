require("nvim-web-devicons").setup()
require("lualine").setup()
require("leap").add_default_mappings()
require'nvim-treesitter.configs'.setup {
	ensure_installed = { "python", "markdown", "lua", "vim" }
}


-- I think this thing was superseded by mason??
-- require("nvim-lsp-installer").setup {automatic_installation = true}
--
require("lint").linters_by_ft = {
	cpp = {"cpplint", }
}

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
-- require("formatter").setup {
  --<esc>logging = true,
  --<esc>log_level = vim.log.levels.WARN,
  --<esc>filetype = {
    --<esc>cpp = {
	  --<esc>function ()
		  --<esc>local settings = require("formatter.filetypes.cpp").clangformat();
		  --<esc>table.insert(settings.args, '--style="{SortIncludes: false}"')
		  --<esc>return settings
	  --<esc>end
	--<esc>}
  --<esc>}
--<esc>}
-- order per README in https://github.com/williamboman/mason-lspconfig.nvim
require("mason").setup()
require("mason-lspconfig").setup()
require("lspconfig").haxe_language_server.setup {}

require("mason-tool-installer").setup {
	ensure_installed = {
		"clang-format",
		"cpplint",
		"haxe-language-server",
	},
	auto_update = true,
	run_on_start = true,
	start_delay = 1000 -- milliseconds
}


local cmp = require'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'ultisnips' },
  }, {
    { name = 'buffer' },
  })
})

cmp.setup.filetype('beancount', {
  sources = cmp.config.sources({
    { name = 'beancount',
		option = {
			account = "~/S/beans/sinan.beancount"
		}
	},
    { name = "ultisnips" }
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

vim.api.nvim_create_autocmd("BufRead,BufNewFile", {
  pattern = "*.hx",
  command = "set filetype=haxe",

})
