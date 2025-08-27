return {
  dir = "~/automata/repos/xTacobaco/cursor-agent.nvim",
  -- "xTacobaco/cursor-agent.nvim",
  config = function()
    vim.keymap.set("n", "<leader>ca", ":CursorAgent<CR>", { desc = "Cursor Agent: Toggle terminal" })
    vim.keymap.set("v", "<leader>ca", ":CursorAgentSelection<CR>", { desc = "Cursor Agent: Send selection" })
    vim.keymap.set("n", "<leader>cA", ":CursorAgentBuffer<CR>", { desc = "Cursor Agent: Send buffer" })
    require("cursor-agent").setup({
      window = {
        layout = "split",
        split = {
            side = 'bottom'
        }
      }
    })
  end,
}
