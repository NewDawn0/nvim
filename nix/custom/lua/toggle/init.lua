local M = {}

---@type table<string, boolean>
M.state = { }

---@class ToggleConfig
---@field notify boolean Whether to notify on toggle
M.config = {
  notify = true,
}

---@param cfg ToggleConfig
M.setup = function(cfg)
  M.config = vim.tbl_deep_extend("force", M.config, cfg or {})
end

---@param name string Name of the toggle
---@return boolean    Value of the toggle
M.toggle = function(name)
  M.state[name] = false or not M.state[name]
  if M.config.notify then
    vim.notify(string.format("%s: %s", name, M.state[name]), vim.log.levels.INFO)
  end
  return M.state[name]
end

return M
