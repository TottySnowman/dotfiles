return {
	{
		"nvimdev/lspsaga.nvim",
		config = function()
			require("lspsaga").setup({
				lightbulb = { enable = false },
				diagnostic = {
					show_code_action = false,
					show_source = true,
				},
			})

			vim.keymap.set("n", "<leader>dd", "<cmd>Lspsaga show_line_diagnostics<CR>")
			vim.keymap.set("n", "<leader>dx", "<cmd>Lspsaga goto_definition<CR>")
		end,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
}
