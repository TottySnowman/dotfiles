return {
  "lervag/vimtex",
  lazy = false,
  config = function()
    vim.g.vimtex_view_method = "skim"
    vim.g.vimtex_view_general_viewer = "skim"
  end,
}
