return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
    "davidmh/cspell.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
    local cspell = require('cspell')
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.csharpier,
				require("none-ls.diagnostics.eslint_d"),
        cspell.code_actions,
        cspell.diagonstics,
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
