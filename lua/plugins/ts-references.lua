return {
  -- Treesitter text objects for selecting functions, classes, interfaces, etc.
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = function(_, opts)
      opts.textobjects = opts.textobjects or {}

      -- Select: visually select functions, classes, parameters, etc.
      opts.textobjects.select = {
        enable = true,
        lookahead = true, -- jump forward to the nearest text object
        keymaps = {
          -- Select outer/inner function
          ["af"] = { query = "@function.outer", desc = "Select outer function" },
          ["if"] = { query = "@function.inner", desc = "Select inner function" },
          -- Select outer/inner class (covers interfaces, types, enums in TS)
          ["ac"] = { query = "@class.outer", desc = "Select outer class/interface" },
          ["ic"] = { query = "@class.inner", desc = "Select inner class/interface" },
          -- Select parameter/argument
          ["aa"] = { query = "@parameter.outer", desc = "Select outer parameter" },
          ["ia"] = { query = "@parameter.inner", desc = "Select inner parameter" },
          -- Select conditional
          ["ai"] = { query = "@conditional.outer", desc = "Select outer conditional" },
          ["ii"] = { query = "@conditional.inner", desc = "Select inner conditional" },
          -- Select loop
          ["al"] = { query = "@loop.outer", desc = "Select outer loop" },
          ["il"] = { query = "@loop.inner", desc = "Select inner loop" },
        },
      }

      -- Move: jump between functions and classes
      opts.textobjects.move = {
        enable = true,
        set_jumps = true, -- add jumps to the jumplist
        goto_next_start = {
          ["]f"] = { query = "@function.outer", desc = "Next function start" },
          ["]c"] = { query = "@class.outer", desc = "Next class/interface start" },
        },
        goto_next_end = {
          ["]F"] = { query = "@function.outer", desc = "Next function end" },
          ["]C"] = { query = "@class.outer", desc = "Next class/interface end" },
        },
        goto_previous_start = {
          ["[f"] = { query = "@function.outer", desc = "Previous function start" },
          ["[c"] = { query = "@class.outer", desc = "Previous class/interface start" },
        },
        goto_previous_end = {
          ["[F"] = { query = "@function.outer", desc = "Previous function end" },
          ["[C"] = { query = "@class.outer", desc = "Previous class/interface end" },
        },
      }

      return opts
    end,
  },

  -- Telescope for displaying LSP references in a nice picker UI
  -- All under <leader>l to avoid conflicts with git keymaps
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- Find all references (like WebStorm's "Find Usages")
      {
        "<leader>lr",
        "<cmd>Telescope lsp_references<CR>",
        desc = "Find all references (usages)",
      },
      -- Go to definition
      {
        "<leader>ld",
        "<cmd>Telescope lsp_definitions<CR>",
        desc = "Go to definition",
      },
      -- Go to type definition
      {
        "<leader>ly",
        "<cmd>Telescope lsp_type_definitions<CR>",
        desc = "Go to type definition",
      },
      -- Go to implementation
      {
        "<leader>li",
        "<cmd>Telescope lsp_implementations<CR>",
        desc = "Go to implementation",
      },
      -- Find all symbols in the current document
      {
        "<leader>ls",
        "<cmd>Telescope lsp_document_symbols<CR>",
        desc = "Document symbols (functions, interfaces, etc.)",
      },
      -- Find all symbols in the entire workspace
      {
        "<leader>lS",
        "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>",
        desc = "Workspace symbols",
      },
    },
  },
}
