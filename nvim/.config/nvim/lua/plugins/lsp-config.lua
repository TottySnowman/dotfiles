return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"tsserver",
					"omnisharp",
					"gopls",
					"prismals",
					"texlab",
					"pylsp",
					"tailwindcss",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})

			lspconfig.pylsp.setup({
				capabilities = capabilities,
			})

			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
				root_dir = require("lspconfig").util.root_pattern(
					"vite.config.js",
					"vite.config.ts",
					"package.json",
					".git"
				),
			})

			lspconfig.omnisharp.setup({
				cmd = { "omnisharp" }, -- Ensure OmniSharp is in your PATH or specify the full path here
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					print("OmniSharp attached to buffer", bufnr)
					-- Enable completion triggered by <c-x><c-o>
					vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
					-- Setup keymaps for scrolling through overloads
					vim.api.nvim_buf_set_keymap(
						bufnr,
						"n",
						"<C-j>",
						"<cmd>lua vim.lsp.buf.signature_help()<CR>",
						{ noremap = true, silent = true }
					)
					vim.api.nvim_buf_set_keymap(
						bufnr,
						"i",
						"<C-j>",
						"<cmd>lua vim.lsp.buf.signature_help()<CR>",
						{ noremap = true, silent = true }
					)
				end,
				handlers = {
					["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
					["textDocument/signatureHelp"] = vim.lsp.with(
						vim.lsp.handlers.signature_help,
						{ border = "rounded" }
					),
				},
				settings = {
					-- Place additional settings for OmniSharp here if needed
					omnisharp = {
						useModernNet = true, -- Ensure it uses the modern .NET SDK
					},
				},
			})
			lspconfig.gopls.setup({
				capabilities = capabilities,
			})

			lspconfig.prismals.setup({
				capabilities = capabilities,
			})
			lspconfig.texlab.setup({
				capabilities = capabilities,
			})
			local function on_list(options)
				vim.fn.setqflist({}, " ", options)
				vim.cmd.cfirst()
			end
			vim.lsp.buf.definition({ on_list = on_list })
			vim.lsp.buf.references(nil, { on_list = on_list })

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help, { noremap = true, silent = true })
		end,
	},
}
