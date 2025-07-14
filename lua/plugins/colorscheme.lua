return {
  -- Dark themes
  { "ellisonleao/gruvbox.nvim" },
  { "folke/tokyonight.nvim" },
  { "catppuccin/nvim", name = "catppuccin" },
  
  -- Light themes
  { "sainnhe/everforest" },
  { "rebelot/kanagawa.nvim" },
  
  -- Theme manager configuration
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        -- Get system appearance on macOS
        local function get_system_appearance()
          local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
          if handle then
            local result = handle:read("*a")
            handle:close()
            return result:match("Dark") and "dark" or "light"
          end
          return "dark" -- fallback
        end
        
        -- Theme configurations
        local themes = {
          dark = {
            "tokyonight-night",
            "gruvbox", 
            "catppuccin-mocha"
          },
          light = {
            "tokyonight-day",
            "everforest",
            "catppuccin-latte"
          }
        }
        
        -- Get saved theme preference or use system default
        local saved_theme = vim.g.theme_preference
        if not saved_theme then
          local appearance = get_system_appearance()
          saved_theme = themes[appearance][1]
        end
        
        return saved_theme
      end,
    },
  },
}
