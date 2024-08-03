-- Markdown Preview for Neovim
-- https://github.com/iamcco/markdown-preview.nvim

return {
  "iamcco/markdown-preview.nvim",
  ft = {
    'markdown'
  },
  cmd = "MarkdownPreview",
  config = function()
    vim.fn["mkdp#util#install"]()

    vim.keymap.set('n', '<leader>mds', ':MarkdownPreview<CR>', { desc = "Start Markdown Preview" })
    vim.keymap.set('n', '<leader>mdx', ':MarkdownPreviewStop<CR>', { desc = "Stop Markdown Preview" })
  end
}
