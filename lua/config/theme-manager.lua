local M = {}

-- Theme configurations
M.themes = {
  dark = {
    { name = "tokyonight-night", display = "Tokyo Night" },
    { name = "gruvbox", display = "Gruvbox Dark" },
    { name = "catppuccin-mocha", display = "Catppuccin Mocha" },
  },
  light = {
    { name = "tokyonight-day", display = "Tokyo Night Day" },
    { name = "everforest", display = "Everforest Light" },
    { name = "catppuccin-latte", display = "Catppuccin Latte" },
  }
}

-- Get system appearance (macOS)
function M.get_system_appearance()
  local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
  if handle then
    local result = handle:read("*a")
    handle:close()
    return result:match("Dark") and "dark" or "light"
  end
  return "dark" -- fallback
end

-- Set colorscheme with error handling
function M.set_colorscheme(theme_name)
  local ok, _ = pcall(vim.cmd.colorscheme, theme_name)
  if ok then
    vim.g.theme_preference = theme_name
    print("Theme changed to: " .. theme_name)
  else
    print("Failed to load theme: " .. theme_name)
  end
end

-- Sync with system theme
function M.sync_with_system()
  local appearance = M.get_system_appearance()
  local current_themes = M.themes[appearance]
  if current_themes and #current_themes > 0 then
    M.set_colorscheme(current_themes[1].name)
  end
end

-- Toggle between dark and light themes
function M.toggle_theme_mode()
  local current = vim.g.theme_preference or M.themes.dark[1].name
  local is_dark = false
  
  -- Check if current theme is dark
  for _, theme in ipairs(M.themes.dark) do
    if theme.name == current then
      is_dark = true
      break
    end
  end
  
  -- Switch to opposite mode
  local target_mode = is_dark and "light" or "dark"
  local target_themes = M.themes[target_mode]
  if target_themes and #target_themes > 0 then
    M.set_colorscheme(target_themes[1].name)
  end
end

-- Cycle through themes in current mode
function M.cycle_theme()
  local current = vim.g.theme_preference or M.themes.dark[1].name
  local current_mode = "dark"
  local current_index = 1
  
  -- Find current theme and mode
  for mode, theme_list in pairs(M.themes) do
    for i, theme in ipairs(theme_list) do
      if theme.name == current then
        current_mode = mode
        current_index = i
        break
      end
    end
  end
  
  -- Get next theme in current mode
  local theme_list = M.themes[current_mode]
  local next_index = (current_index % #theme_list) + 1
  M.set_colorscheme(theme_list[next_index].name)
end

-- Show theme picker
function M.show_theme_picker()
  local themes_flat = {}
  for mode, theme_list in pairs(M.themes) do
    for _, theme in ipairs(theme_list) do
      table.insert(themes_flat, {
        name = theme.name,
        display = theme.display .. " (" .. mode .. ")",
        mode = mode
      })
    end
  end
  
  vim.ui.select(themes_flat, {
    prompt = "Select theme:",
    format_item = function(item)
      return item.display
    end,
  }, function(choice)
    if choice then
      M.set_colorscheme(choice.name)
    end
  end)
end

-- Auto-sync with system on startup
function M.setup_auto_sync()
  -- Sync on startup
  vim.defer_fn(function()
    if not vim.g.theme_preference then
      M.sync_with_system()
    end
  end, 100)
  
  -- Create autocmd to watch for system changes (requires external tool)
  -- This is a basic implementation - for real-time sync you'd need a background process
  vim.api.nvim_create_user_command("SyncTheme", M.sync_with_system, {})
end

return M