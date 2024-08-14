return {
	"ixru/nvim-markdown",
	config = function()
		vim.keymap.set("n", "<S-Tab>", "<cmd><<<CR>") -- shift tab to unfold
	end,
}
