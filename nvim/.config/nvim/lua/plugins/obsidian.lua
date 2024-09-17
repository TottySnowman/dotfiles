return {
  "epwalsh/obsidian.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local config = require("obsidian")
    config.setup({
      workspaces = {
        {
          name = "personal",
          path = "/Users/paul-philippewortmann/Documents/Obsidian",
        },
        {
          name = "work",
          path = "/Users/paul-philippewortmann/Documents/Obsidian",
        },
      },

    })
  end,
}
