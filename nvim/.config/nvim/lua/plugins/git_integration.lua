return {
	{
		"tpope/vim-fugitive",

		config = function() end,
	},
	{
		"lewis6991/gitsigns.nvim",

		config = function()
			require("gitsigns").setup(
        {
          current_line_blame = true,
        }
      )
			vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
		end,
	},
}
