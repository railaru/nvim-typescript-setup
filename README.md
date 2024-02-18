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
2. Clone this repo: `git clone https://github.com/railaru/modern-nvim-setup ~/.config/nvim`
3. Start Neo Vim in any directory on your system: `nvim`

## Customization
| Title | Description |
|--|--|
| Color hex | #232436 |
| Font | JetBrainsMono Nerd Font. Source: https://www.nerdfonts.com/font-downloads. I recommend one of the "nerdfonts" fonts, because the default system fonts often don't support file and folder icons. |
| Translucent effect | Je If you're using iTerm on Mac, you can reduce opacity and add some background blur for a translucent effect. |

## Cheat sheet

Quick reminder for nvim/vim commands.

### Commands

- `:w` to save
- `u` undo
- `ctrl` + `r` redo
- `g+g` go to the top of the file instantly
- `g+c` comment out the selected area. Wortk with JSX/TSX
- `ctrl + ]` to go back and forth between the implementation and definition.
- `shift + :`  go to enter a command mode
- `shift + h`  go to previous editor tab
- `shift + l`  go to next editor tab
- `shift + >`  indent by a tab
- `shift + <`  remove indent by a tab
- `:%s/oldterm/newterm/g` replace all matching references in the file. To use, first press `:` to open the command menu.
- `s` to search for text within the same file
- `0` go to start of a line
- `shift` + `]` or `[` jump between empty lines
- `~/.config/nvim`
- `:colorscheme github_dark` to change theme. Full list of themes https://github.com/projekt0n/github-nvim-theme?tab=readme-ov-file#supported-colorschemes--comparisons.

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

💡 You can copy a region and select a new region, and it will delete and add the copied area to the selection.

💡 Yanking also works with numbers, for example `y + 5 + j` (copy 5 lines to bottom)

## Custom keymaps
- `shift` + `f` find files using the Telescope plugin. Similar to the double shift in JetBrains IDEs.

## Neovim file Tree
- `up`, `down` navigate between files.
- `enter` select a file.
- `c` copy a file and make a copy with a new name.
-  `r` rename a file
-  `a` add a new file in the folder
- `space` + `e` toggle file tree


## Prepending branch name for git commit messages

To automatically prepend the project and task number from your branch name into your commit messages, you can utilize a Git hook, specifically the `prepare-commit-msg` hook. This hook allows you to manipulate the commit message before it is finalized.

#### End result:

| Branch name | Commit name |
|--|--|
| feature/ABC-123 | ABC-123: added a header |

Here's a step-by-step guide to achieve this:
-
1. **Locate Your Git Hooks Directory**:
   Every Git repository has a `.git/hooks` directory where you can place custom scripts to be executed at various stages of the Git workflow.

2. **Create a `prepare-commit-msg` Script**:
   You need to create a script named `prepare-commit-msg` in the `.git/hooks` directory. This script will be executed before the commit message editor is opened.

3. **Script to Extract Information from Branch Name**:
   The script should extract the project and task number from the branch name and prepend it to the commit message. Here's an example script in Bash:

   ```bash
   #!/bin/bash

   # The path to the file where the commit message is stored
   COMMIT_MSG_FILE=$1

   # Extract the branch name
   BRANCH_NAME=$(git symbolic-ref --short HEAD)

   # Use a regex to find the pattern 'ABC-XXX' where XXX is the task number
   if [[ $BRANCH_NAME =~ feature/(ABC-[0-9]+)-.* ]]; then
       # Prepend the extracted information to the commit message
       echo "${BASH_REMATCH[1]}: $(cat $COMMIT_MSG_FILE)" > $COMMIT_MSG_FILE
   fi

This script checks if the branch name matches the pattern and then prepends the project and task number (e.g., `ABC-287`) to the commit message.

**Make the Script Executable**: 
After saving the script in `.git/hooks/prepare-commit-msg`, make it executable:

`chmod +x .git/hooks/prepare-commit-msg`

**Test Your Setup**: 
Create a new commit on a branch that follows the naming convention. The script should automatically prepend the project and task number to your commit message.
    
**Project-Wide Setup (Optional)**: 

If you want this script to be used by anyone who clones the repository, you'll need to share it some other way, like committing it to the repository and having users set it up manually. Git doesn't clone the `.git/hooks` directory.


## Resources & Further reading:
- https://www.lazyvim.org/installation
- https://www.youtube.com/watch?v=N93cTbtLCIM
- https://github.com/jackMort/ChatGPT.nvim

### AI commits
- https://github.com/Nutlope/aicommits

### Grep library for string search
- https://github.com/BurntSushi/ripgrep#installation

### 💤 Built on top of LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.
