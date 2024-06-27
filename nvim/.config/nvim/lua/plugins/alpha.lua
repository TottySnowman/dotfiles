return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"BlakeJC94/alpha-nvim-fortune",
	},

	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		local fortune = require("alpha.fortune")
		local telescope = require("telescope")

		dashboard.section.header.val = {
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                     ]],
			[[       ████ ██████           █████      ██                     ]],
			[[      ███████████             █████                             ]],
			[[      █████████ ███████████████████ ███   ███████████   ]],
			[[     █████████  ███    █████████████ █████ ██████████████   ]],
			[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
			[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
			[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
		}

		local function expand_path(path)
			return path:gsub("~", vim.fn.expand("~")):gsub("%$([%w_]+)", vim.fn.getenv)
		end

		-- Define a function to use Telescope file browser to change directory
		local function browse_and_change_directory()
			local path = expand_path("$HOME/Documents/Programming")
			if path == "" then
				print("No path entered")
				return
			end

			telescope.extensions.file_browser.file_browser({
				cwd = path,
				prompt_title = "Browse Directory",
				attach_mappings = function(_, map)
					map("i", "<CR>", function(prompt_bufnr)
						local selection = require("telescope.actions.state").get_selected_entry()
						require("telescope.actions").close(prompt_bufnr)
						local selected_dir = selection.path
						if vim.fn.isdirectory(selected_dir) == 1 then
							vim.cmd("cd " .. selected_dir)
							print("Changed directory to " .. selected_dir)
						else
							print("Selected item is not a directory")
						end
					end)
					return true
				end,
			})
		end
		-- Create a custom button for changing directories

    local searchFolderIcon = '\u{f0968}'
		local button_change_dir = dashboard.button("d", searchFolderIcon .."  > Change Directory", browse_and_change_directory)
		dashboard.section.buttons.val = {
			dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("f", '\u{f021e}' .. "  > Find file", ":cd $HOME/Documents/Programming | Telescope find_files<CR>"),
			button_change_dir,
			dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
			dashboard.button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
			dashboard.button("q", '\u{f530}' .. "  > Quit NVIM", ":qa<CR>"),
		}
		dashboard.section.footer.val = fortune()
		alpha.setup(dashboard.opts)
	end,
}
