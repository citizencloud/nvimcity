vim.g.mapleader = " "

local map = function(mode, l, r, desc)
	vim.keymap.set(mode, l, r, { desc = desc })
end

local map_to_buffer = function(buffer, mode, l, r, desc)
	vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
end

local M = {}

M.default = {
	map = function()
		map("n", "<LEADER>l", "<CMD>Lazy<CR>", "Open Lazy")

		-- window movements
		map("n", "<C-h>", "<C-w>h", "Go to left window")
		map("n", "<C-j>", "<C-w>j", "Go to lower window")
		map("n", "<C-k>", "<C-w>k", "Go to upper window")
		map("n", "<C-l>", "<C-w>l", "Go to right window")

		-- window management
		map("n", "<leader>sv", "<C-w>v", "Split window vertically")
		map("n", "<leader>sh", "<C-w>s", "Split window horizontally")
		map("n", "<leader>se", "<C-w>=", "Make splits equal size")
		map("n", "<leader>sx", "<cmd>close<CR>", "Close current split")

		-- buffer movements
		map("n", "<leader>nb", "<cmd>bnext<CR>", "Next buffer")
		map("n", "<leader>pb", "<cmd>bprevious<CR>", "Previous buffer")
	end,
}

M.telescope = {
	map = function()
		local builtin = require("telescope.builtin")
		local egrepify = require("telescope").extensions.egrepify

		map("n", "<LEADER>ff", function()
			return builtin.find_files({ hidden = true })
		end, "[F]ind [F]iles")
		map("n", "<LEADER>fs", egrepify.egrepify, "[F]ind by [G]rep")
	end,
}

M.lsp = {
	all = {
		map_to_buffer = function(buffer)
			local trouble = require("trouble")

			map_to_buffer(buffer, "n", "<LEADER>gd", function()
				trouble.toggle("lsp_definitions")
			end, "[G]oto [D]efinitions")
			map_to_buffer(buffer, "n", "<LEADER>gD", function()
				trouble.toggle("lsp_type_definitions")
			end, "[G]oto [T]ype [D]efinitions")
			map_to_buffer(buffer, "n", "<LEADER>gr", function()
				trouble.toggle("lsp_references")
			end, "[G]oto [R]eferences")
			map_to_buffer(buffer, "n", "<LEADER>gi", function()
				trouble.toggle("lsp_implementations")
			end, "[G]oto [I]mplementations")
			map_to_buffer(buffer, "n", "<LEADER>ca", vim.lsp.buf.code_action, "[C]ode [A]ctions")
		end,
	},
	java = {
		dap = {
			map_to_buffer = function(buffer)
				local jdtls = require("jdtls")
				local dapui = require("dapui")

				map_to_buffer(buffer, "n", "<LEADER>dt", jdtls.test_class, "[T]est Class")
				map_to_buffer(buffer, "n", "<LEADER>dc", dapui.close, "[C]lose")
				map_to_buffer(buffer, "n", "<LEADER>do", dapui.open, "[O]pen")
			end,
		},
	},
}

return M
