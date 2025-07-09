return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = {
          settings = {
            typescript = {
              suggest = {
                includeCompletionsForModuleExports = true,
                includeCompletionsForImportStatements = true,
              },
              preferences = {
                includePackageJsonAutoImports = "auto",
                importModuleSpecifier = "relative",
              },
            },
            javascript = {
              suggest = {
                includeCompletionsForModuleExports = true,
                includeCompletionsForImportStatements = true,
              },
              preferences = {
                includePackageJsonAutoImports = "auto",
                importModuleSpecifier = "relative",
              },
            },
          },
        },
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      
      opts.completion = opts.completion or {}
      opts.completion.completeopt = "menu,menuone,noinsert"
      
      opts.mapping = vim.tbl_extend("force", opts.mapping or {}, {
        ["<CR>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            local entry = cmp.get_selected_entry()
            if entry and entry.source.name == "nvim_lsp" then
              cmp.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
              })
              
              vim.defer_fn(function()
                vim.lsp.buf.code_action({
                  filter = function(action)
                    return action.kind and action.kind:match("source%.addMissingImports")
                  end,
                  apply = true,
                })
              end, 100)
            else
              cmp.confirm({ select = true })
            end
          else
            fallback()
          end
        end, { "i", "s" }),
      })
      
      return opts
    end,
  },
}