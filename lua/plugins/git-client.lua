return {
    {
        "tpope/vim-fugitive",
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end,
    },
    {
        "sindrets/diffview.nvim",
        cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewFileHistory" },
        keys = {
            { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview Open" },
            { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File History (current file)" },
            { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "File History (branch)" },
        },
        opts = {},
    },
}
