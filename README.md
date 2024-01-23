![Preview](https://raw.githubusercontent.com/railaru/modern-nvim-setup/main/img/preview.png)



# Modern Neovim setup
- A full-featured Neovim setup for modern web development.

## Features:
- Prettier
- TypeScript
- Eslint
- GitHub Copilot
- Fuzzy search (Telescope)
- File tree

## Getting started

1. Make sure you have Neo Vim and Git installed on your system.
2. Clone this repo: `git clone https://github.com/railaru/modern-nvim-setup/tree/main ~/.config/nvim`
3. Start Neo Vim in any directory on your system: `nvim`

## Customization
1. Color hex: #232436
2. Font JetBrainsMono Nerd Font. Source: https://www.nerdfonts.com/font-downloads

## Cheat sheet

Quick reminder for nvim/vim commands.

### Commands

- `:w` to save
- `gg` go to the top of the file instantly
- `ctrl + ]` to go back and forth between the implementation and definition.
- `shift + :`  go to enter a command mode
- `s` to search for text within the same file
- `~/.config/nvim`

You can combine commands. For example:
- `d + 3 + j` will delete 3 lines below.
- `d + w` will delete a word.

💡 Deleting also works as copying. You can delete a line and then type p to paste it somewhere else.

### Insert mode
- `i` enable insert mode
- `a` enable insert mode one letter forward.
- `esc` or `ctrl + c` or `ctrl + [` leave insert mode

### Visual mode:
- `v` enable visual mode
- `y` "yank" copy selected region. You can also type yy to automatically select the line for yanking. This is a similar action as dragging a selected region with mouse.
- `p` paste the selected region
- `shift + v`, "visual line mode", copy the region with the lines, not just the text.

💡 You can copy a region, select a new region and it will delete and add the copied region to the selection.

💡 Yanking also works with numbers, for example `y + 5 + j` (copy 5 lines to bottom)


## Resources & Further reading:
- https://dev.to/craftzdog/my-neovim-setup-for-react-typescript-tailwind-css-etc-58fb
- https://www.lazyvim.org/installation
- https://www.youtube.com/watch?v=N93cTbtLCIM
- https://github.com/jackMort/ChatGPT.nvim
- https://github.com/Nutlope/aicommits

### Grep library for string search
- https://github.com/BurntSushi/ripgrep#installation

### 💤 Built on top of LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.
