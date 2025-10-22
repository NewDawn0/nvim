local M = {}

M.setKeymap = function(keymaps)
  for mode, maps in pairs(keymaps) do
    for key, cmd in pairs(maps) do
      vim.keymap.set(mode, key, cmd[1], { silent = false, noremap = false, desc = cmd.desc })
    end
  end
end

return M
