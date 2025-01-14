---@class cmp.Cache
---@field public entries any
local cache = {}

cache.new = function()
  local self = setmetatable({}, { __index = cache })
  self.entries = {}
  return self
end

---Get cache value
---@param key string
---@return any|nil
cache.get = function(self, key)
  key = self:key(key)
  if self.entries[key] ~= nil then
    return unpack(self.entries[key])
  end
  return nil
end

---Set cache value explicitly
---@param key string
---@vararg any
cache.set = function(self, key, ...)
  key = self:key(key)
  self.entries[key] = { ... }
end

---Ensure value by callback
---@param key string
---@param callback fun(): any
cache.ensure = function(self, key, callback)
  local value = self:get(key)
  if value == nil then
    self:set(key, callback())
  end
  return self:get(key)
end

---Clear all cache entries
cache.clear = function(self)
  self.entries = {}
end

---Create key
---@param key string|table
---@return string
cache.key = function(_, key)
  if type(key) == 'table' then
    return table.concat(key, ':')
  end
  return key
end

return cache

