local M = {}

local Toggle = {}

---@class   Toggle
---@field   values  any[]     Values to cycle through
---@field   value   any       Current value
---@field   next    fun():any Get the next value (same as Toggle:next())

---@class   ToggleConfig
---@field   on  fun(value:any)? Run function with the current value

---@param   values any[]?         Values to cycle through (default: {true, false})
---@param   config ToggleConfig?  Toggle configuration
---@return  Toggle                New Toggle instance
function Toggle:new(values, config)
  local self = setmetatable({}, { __index = Toggle })
  self._idx   = 1
  self.values = (values == nil or #values == 0) and {false, true} or values
  self.config = config or {}
  self.value  = self.values[self._idx]
  self.next   = function(...) return Toggle.next(self, ...) end
  return self
end

---@return any  Current value
function Toggle:next()
  self._idx   = self._idx % #self.values + 1
  self.value  = self.values[self._idx]
  if self.config.on then self.config.on(self.value) end
  return self.value
end

---@return any  Current value
function Toggle:val()
  return self.value
end

M.Toggle = Toggle
M.new    = function(...) return Toggle:new(...) end

---@type table<string, Toggle>
M.toggles = {}

return M
