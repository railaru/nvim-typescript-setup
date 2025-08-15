return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = {
    "DiffviewOpen",
    "DiffviewClose", 
    "DiffviewToggleFiles",
    "DiffviewFocusFiles",
    "DiffviewRefresh",
    "DiffviewFileHistory"
  },
  config = function()
    require("diffview").setup({
      diff_binaries = false,
      enhanced_diff_hl = false,
      git_cmd = { "git" },
      hg_cmd = { "hg" },
      use_icons = true,
      show_help_hints = true,
      watch_index = true,
      icons = {
        folder_closed = "",
        folder_open = "",
      },
      signs = {
        fold_closed = "",
        fold_open = "",
        done = "✓",
      },
      view = {
        default = {
          layout = "diff2_horizontal",
          winbar_info = false,
        },
        merge_tool = {
          layout = "diff3_horizontal",
          disable_diagnostics = true,
          winbar_info = true,
        },
        file_history = {
          layout = "diff2_horizontal",
          winbar_info = false,
        },
      },
      file_panel = {
        listing_style = "tree",
        tree_options = {
          flatten_dirs = true,
          folder_statuses = "only_folded",
        },
        win_config = {
          position = "left",
          width = 35,
          win_opts = {}
        },
      },
      file_history_panel = {
        log_options = {
          git = {
            single_file = {
              diff_merges = "combined",
            },
            multi_file = {
              diff_merges = "first-parent",
            },
          },
        },
        win_config = {
          position = "bottom",
          height = 16,
          win_opts = {}
        },
      },
      commit_log_panel = {
        win_config = {
          win_opts = {},
        }
      },
      default_args = {
        DiffviewOpen = {},
        DiffviewFileHistory = {},
      },
      hooks = {},
      keymaps = {
        disable_defaults = false,
        view = {
          {
            "n",
            "<tab>",
            function()
              require("diffview.actions").select_next_entry()
            end,
            { desc = "Open the diff for the next file" }
          },
          {
            "n",
            "<s-tab>",
            function()
              require("diffview.actions").select_prev_entry()
            end,
            { desc = "Open the diff for the previous file" }
          },
          {
            "n",
            "gf",
            function()
              require("diffview.actions").goto_file()
            end,
            { desc = "Open the file in the previous tabpage" }
          },
          {
            "n",
            "<C-w><C-f>",
            function()
              require("diffview.actions").goto_file_split()
            end,
            { desc = "Open the file in a new split" }
          },
          {
            "n",
            "<C-w>gf",
            function()
              require("diffview.actions").goto_file_tab()
            end,
            { desc = "Open the file in a new tabpage" }
          },
          {
            "n",
            "<leader>e",
            function()
              require("diffview.actions").toggle_files()
            end,
            { desc = "Toggle the file panel." }
          },
          {
            "n",
            "<leader>b",
            function()
              require("diffview.actions").toggle_files()
            end,
            { desc = "Toggle the file panel" }
          },
          {
            "n",
            "g<C-x>",
            function()
              require("diffview.actions").cycle_layout()
            end,
            { desc = "Cycle through available layouts." }
          },
          {
            "n",
            "[x",
            function()
              require("diffview.actions").prev_conflict()
            end,
            { desc = "In the merge-tool: jump to the previous conflict" }
          },
          {
            "n",
            "]x",
            function()
              require("diffview.actions").next_conflict()
            end,
            { desc = "In the merge-tool: jump to the next conflict" }
          },
          {
            "n",
            "<leader>co",
            function()
              require("diffview.actions").conflict_choose("ours")
            end,
            { desc = "Choose the OURS version of a conflict" }
          },
          {
            "n",
            "<leader>ct",
            function()
              require("diffview.actions").conflict_choose("theirs")
            end,
            { desc = "Choose the THEIRS version of a conflict" }
          },
          {
            "n",
            "<leader>cb",
            function()
              require("diffview.actions").conflict_choose("base")
            end,
            { desc = "Choose the BASE version of a conflict" }
          },
          {
            "n",
            "<leader>ca",
            function()
              require("diffview.actions").conflict_choose("all")
            end,
            { desc = "Choose all the versions of a conflict" }
          },
          {
            "n",
            "dx",
            function()
              require("diffview.actions").conflict_choose("none")
            end,
            { desc = "Delete the conflict region" }
          },
          {
            "n",
            "<leader>cO",
            function()
              require("diffview.actions").conflict_choose_all("ours")
            end,
            { desc = "Choose the OURS version of a conflict for the whole file" }
          },
          {
            "n",
            "<leader>cT",
            function()
              require("diffview.actions").conflict_choose_all("theirs")
            end,
            { desc = "Choose the THEIRS version of a conflict for the whole file" }
          },
        },
        diff1 = {
          { "n", "g?", function() require("diffview.actions").help("view") end, { desc = "Open the help panel" } },
        },
        diff2 = {
          { "n", "g?", function() require("diffview.actions").help("view") end, { desc = "Open the help panel" } },
        },
        diff3 = {
          {
            { "n", "x" },
            "2do",
            { desc = "Obtain the diff hunk from the OURS version of the file" }
          },
          {
            { "n", "x" },
            "3do",
            { desc = "Obtain the diff hunk from the THEIRS version of the file" }
          },
          { "n", "g?", function() require("diffview.actions").help("view") end, { desc = "Open the help panel" } },
        },
        diff4 = {
          {
            { "n", "x" },
            "1do",
            { desc = "Obtain the diff hunk from the MERGE_HEAD version of the file" }
          },
          {
            { "n", "x" },
            "2do",
            { desc = "Obtain the diff hunk from the MERGE_HEAD version of the file" }
          },
          {
            { "n", "x" },
            "3do",
            { desc = "Obtain the diff hunk from the THEIRS version of the file" }
          },
          { "n", "g?", function() require("diffview.actions").help("view") end, { desc = "Open the help panel" } },
        },
        file_panel = {
          {
            "n",
            "j",
            function()
              require("diffview.actions").next_entry()
            end,
            { desc = "Bring the cursor to the next file entry" }
          },
          {
            "n",
            "<down>",
            function()
              require("diffview.actions").next_entry()
            end,
            { desc = "Bring the cursor to the next file entry" }
          },
          {
            "n",
            "k",
            function()
              require("diffview.actions").prev_entry()
            end,
            { desc = "Bring the cursor to the previous file entry." }
          },
          {
            "n",
            "<up>",
            function()
              require("diffview.actions").prev_entry()
            end,
            { desc = "Bring the cursor to the previous file entry." }
          },
          {
            "n",
            "<cr>",
            function()
              require("diffview.actions").select_entry()
            end,
            { desc = "Open the diff for the selected entry." }
          },
          {
            "n",
            "o",
            function()
              require("diffview.actions").select_entry()
            end,
            { desc = "Open the diff for the selected entry." }
          },
          {
            "n",
            "l",
            function()
              require("diffview.actions").select_entry()
            end,
            { desc = "Open the diff for the selected entry." }
          },
          {
            "n",
            "<2-LeftMouse>",
            function()
              require("diffview.actions").select_entry()
            end,
            { desc = "Open the diff for the selected entry." }
          },
          {
            "n",
            "-",
            function()
              require("diffview.actions").toggle_stage_entry()
            end,
            { desc = "Stage / unstage the selected entry." }
          },
          {
            "n",
            "S",
            function()
              require("diffview.actions").stage_all()
            end,
            { desc = "Stage all entries." }
          },
          {
            "n",
            "U",
            function()
              require("diffview.actions").unstage_all()
            end,
            { desc = "Unstage all entries." }
          },
          {
            "n",
            "X",
            function()
              require("diffview.actions").restore_entry()
            end,
            { desc = "Restore entry to the state on the left side." }
          },
          {
            "n",
            "L",
            function()
              require("diffview.actions").open_commit_log()
            end,
            { desc = "Open the commit log panel." }
          },
          {
            "n",
            "zo",
            function()
              require("diffview.actions").open_fold()
            end,
            { desc = "Expand fold" }
          },
          {
            "n",
            "h",
            function()
              require("diffview.actions").close_fold()
            end,
            { desc = "Collapse fold" }
          },
          {
            "n",
            "zc",
            function()
              require("diffview.actions").close_fold()
            end,
            { desc = "Collapse fold" }
          },
          {
            "n",
            "za",
            function()
              require("diffview.actions").toggle_fold()
            end,
            { desc = "Toggle fold" }
          },
          {
            "n",
            "zR",
            function()
              require("diffview.actions").open_all_folds()
            end,
            { desc = "Expand all folds" }
          },
          {
            "n",
            "zM",
            function()
              require("diffview.actions").close_all_folds()
            end,
            { desc = "Collapse all folds" }
          },
          {
            "n",
            "<c-b>",
            function()
              require("diffview.actions").scroll_view(-0.25)
            end,
            { desc = "Scroll the view up" }
          },
          {
            "n",
            "<c-f>",
            function()
              require("diffview.actions").scroll_view(0.25)
            end,
            { desc = "Scroll the view down" }
          },
          {
            "n",
            "<tab>",
            function()
              require("diffview.actions").select_next_entry()
            end,
            { desc = "Open the diff for the next file" }
          },
          {
            "n",
            "<s-tab>",
            function()
              require("diffview.actions").select_prev_entry()
            end,
            { desc = "Open the diff for the previous file" }
          },
          {
            "n",
            "gf",
            function()
              require("diffview.actions").goto_file()
            end,
            { desc = "Open the file in the previous tabpage" }
          },
          {
            "n",
            "<C-w><C-f>",
            function()
              require("diffview.actions").goto_file_split()
            end,
            { desc = "Open the file in a new split" }
          },
          {
            "n",
            "<C-w>gf",
            function()
              require("diffview.actions").goto_file_tab()
            end,
            { desc = "Open the file in a new tabpage" }
          },
          {
            "n",
            "i",
            function()
              require("diffview.actions").listing_style()
            end,
            { desc = "Toggle between 'list' and 'tree' views" }
          },
          {
            "n",
            "f",
            function()
              require("diffview.actions").toggle_flatten_dirs()
            end,
            { desc = "Flatten empty subdirectories in tree listing style." }
          },
          {
            "n",
            "R",
            function()
              require("diffview.actions").refresh_files()
            end,
            { desc = "Update stats and entries in the file list." }
          },
          {
            "n",
            "<leader>e",
            function()
              require("diffview.actions").toggle_files()
            end,
            { desc = "Toggle the file panel" }
          },
          {
            "n",
            "<leader>b",
            function()
              require("diffview.actions").toggle_files()
            end,
            { desc = "Toggle the file panel" }
          },
          {
            "n",
            "g<C-x>",
            function()
              require("diffview.actions").cycle_layout()
            end,
            { desc = "Cycle through available layouts." }
          },
          {
            "n",
            "[x",
            function()
              require("diffview.actions").prev_conflict()
            end,
            { desc = "In the merge-tool: jump to the previous conflict" }
          },
          {
            "n",
            "]x",
            function()
              require("diffview.actions").next_conflict()
            end,
            { desc = "In the merge-tool: jump to the next conflict" }
          },
          { "n", "g?", function() require("diffview.actions").help("file_panel") end, { desc = "Open the help panel" } },
          {
            "n",
            "<leader>cO",
            function()
              require("diffview.actions").conflict_choose_all("ours")
            end,
            { desc = "Choose the OURS version of a conflict for the whole file" }
          },
          {
            "n",
            "<leader>cT",
            function()
              require("diffview.actions").conflict_choose_all("theirs")
            end,
            { desc = "Choose the THEIRS version of a conflict for the whole file" }
          },
        },
        file_history_panel = {
          { "n", "g!", function() require("diffview.actions").options() end, { desc = "Open the option panel" } },
          {
            "n",
            "<C-A-d>",
            function()
              require("diffview.actions").open_in_diffview()
            end,
            { desc = "Open the entry under the cursor in a diffview" }
          },
          {
            "n",
            "y",
            function()
              require("diffview.actions").copy_hash()
            end,
            { desc = "Copy the commit hash of the entry under the cursor" }
          },
          {
            "n",
            "L",
            function()
              require("diffview.actions").open_commit_log()
            end,
            { desc = "Show commit details" }
          },
          {
            "n",
            "zR",
            function()
              require("diffview.actions").open_all_folds()
            end,
            { desc = "Expand all folds" }
          },
          {
            "n",
            "zM",
            function()
              require("diffview.actions").close_all_folds()
            end,
            { desc = "Collapse all folds" }
          },
          {
            "n",
            "j",
            function()
              require("diffview.actions").next_entry()
            end,
            { desc = "Bring the cursor to the next file entry" }
          },
          {
            "n",
            "<down>",
            function()
              require("diffview.actions").next_entry()
            end,
            { desc = "Bring the cursor to the next file entry" }
          },
          {
            "n",
            "k",
            function()
              require("diffview.actions").prev_entry()
            end,
            { desc = "Bring the cursor to the previous file entry." }
          },
          {
            "n",
            "<up>",
            function()
              require("diffview.actions").prev_entry()
            end,
            { desc = "Bring the cursor to the previous file entry." }
          },
          {
            "n",
            "<cr>",
            function()
              require("diffview.actions").select_entry()
            end,
            { desc = "Open the diff for the selected entry." }
          },
          {
            "n",
            "o",
            function()
              require("diffview.actions").select_entry()
            end,
            { desc = "Open the diff for the selected entry." }
          },
          {
            "n",
            "<2-LeftMouse>",
            function()
              require("diffview.actions").select_entry()
            end,
            { desc = "Open the diff for the selected entry." }
          },
          {
            "n",
            "<c-b>",
            function()
              require("diffview.actions").scroll_view(-0.25)
            end,
            { desc = "Scroll the view up" }
          },
          {
            "n",
            "<c-f>",
            function()
              require("diffview.actions").scroll_view(0.25)
            end,
            { desc = "Scroll the view down" }
          },
          {
            "n",
            "<tab>",
            function()
              require("diffview.actions").select_next_entry()
            end,
            { desc = "Open the diff for the next file" }
          },
          {
            "n",
            "<s-tab>",
            function()
              require("diffview.actions").select_prev_entry()
            end,
            { desc = "Open the diff for the previous file" }
          },
          {
            "n",
            "gf",
            function()
              require("diffview.actions").goto_file()
            end,
            { desc = "Open the file in the previous tabpage" }
          },
          {
            "n",
            "<C-w><C-f>",
            function()
              require("diffview.actions").goto_file_split()
            end,
            { desc = "Open the file in a new split" }
          },
          {
            "n",
            "<C-w>gf",
            function()
              require("diffview.actions").goto_file_tab()
            end,
            { desc = "Open the file in a new tabpage" }
          },
          {
            "n",
            "<leader>e",
            function()
              require("diffview.actions").toggle_files()
            end,
            { desc = "Toggle the file panel" }
          },
          {
            "n",
            "<leader>b",
            function()
              require("diffview.actions").toggle_files()
            end,
            { desc = "Toggle the file panel" }
          },
          {
            "n",
            "g<C-x>",
            function()
              require("diffview.actions").cycle_layout()
            end,
            { desc = "Cycle through available layouts." }
          },
          { "n", "g?", function() require("diffview.actions").help("file_history_panel") end, { desc = "Open the help panel" } },
        },
        option_panel = {
          { "n", "<tab>", function() require("diffview.actions").select_entry() end, { desc = "Change the current option" } },
          { "n", "q", function() require("diffview.actions").close() end, { desc = "Close the panel" } },
          { "n", "g?", function() require("diffview.actions").help("option_panel") end, { desc = "Open the help panel" } },
        },
        help_panel = {
          { "n", "q", function() require("diffview.actions").close() end, { desc = "Close help menu" } },
          { "n", "<esc>", function() require("diffview.actions").close() end, { desc = "Close help menu" } },
        },
      },
    })
  end,
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Open DiffView" },
    { "<leader>gc", "<cmd>DiffviewClose<cr>", desc = "Close DiffView" },
    { "<leader>gh", "<cmd>DiffviewFileHistory<cr>", desc = "Open DiffView File History" },
    { "<leader>gm", "<cmd>DiffviewOpen HEAD~1<cr>", desc = "Open DiffView for merge conflicts" },
    { "<leader>gr", "<cmd>DiffviewRefresh<cr>", desc = "Refresh DiffView" },
  },
}