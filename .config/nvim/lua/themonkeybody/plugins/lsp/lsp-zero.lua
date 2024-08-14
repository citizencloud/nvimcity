return {
	"VonHeikemen/lsp-zero.nvim",
	config = function()
		vim.g.lsp_zero_extend_cmp = 0
		vim.g.lsp_zero_extend_lspconfig = 0

		local lsp_zero = require("lsp-zero")

		lsp_zero.on_attach(function(_, buffer)
			require("themonkeybody.core.keymap").lsp.all.map_to_buffer(buffer)
			require("themonkeybody.core.keymap").lsp.java.dap.map_to_buffer(buffer)
		end)
	end,
}
