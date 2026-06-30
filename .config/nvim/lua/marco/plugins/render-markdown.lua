return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- provides the markdown/markdown_inline parsers
    "nvim-tree/nvim-web-devicons", -- icons for code block language labels
  },
  config = function()
    require("render-markdown").setup({})

    -- toggle the in-buffer rendering on/off
    vim.keymap.set("n", "<leader>mr", "<cmd>RenderMarkdown toggle<CR>", { desc = "Toggle Markdown rendering" })
  end,
}
