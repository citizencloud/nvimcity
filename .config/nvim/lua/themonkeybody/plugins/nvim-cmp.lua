return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"L3MON4D3/LuaSnip",
		"onsails/lspkind.nvim",
	},
	config = function()
		require("luasnip.loaders.from_vscode").lazy_load()

		local lsp_zero = require("lsp-zero")
		local cmp = require("cmp")

		lsp_zero.extend_cmp()

		cmp.setup({
			preselect = "item",
			mapping = cmp.mapping.preset.insert({
				["<Tab>"] = lsp_zero.cmp_action().tab_complete(),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
				["<C-f>"] = lsp_zero.cmp_action().luasnip_jump_forward(),
				["<C-b>"] = lsp_zero.cmp_action().luasnip_jump_backward(),
			}),
			formatting = {
				format = require("lspkind").cmp_format(),
			},
		})
	end,
}


