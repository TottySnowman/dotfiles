local wezterm = require("wezterm")

config = wezterm.config_builder()

config = {
  automatically_reload_config = true,
  enable_tab_bar = false,
  window_decorations = "RESIZE",
  color_scheme = "Catppuccin Macchiato",
  default_cursor_style = "BlinkingBar",
  font = wezterm.font("SauceCodePro Nerd Font", {weight="Black", stretch="Normal", style="Normal"}) -- (AKA: SauceCodePro NF, SauceCodePro NF Black)
}

return config
