return {
  "vimichael/floatingtodo.nvim",
  config = function()
    require("floatingtodo").setup({
      target_file = "~/Documents/programming/notes/todo.md",
      border = "rounded" -- single, rounded, etc.
    })
  end
}
