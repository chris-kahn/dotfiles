local mt  = {}

function mt.__newindex(_, k, v)
  vim.o[k]  = v
  vim.bo[k] = v
end

return setmetatable({}, mt)
