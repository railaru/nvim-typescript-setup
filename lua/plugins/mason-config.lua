return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "typescript-language-server",
        "stylua",
        "shellcheck", 
        "shfmt",
        "flake8",
      },
    },
  },
}