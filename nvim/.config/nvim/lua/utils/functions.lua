local vim = vim

local x = {}

---@param on_attach fun(client, buffer)
function x.on_attach(on_attach)
  vim.api.nvim_create_autocmd("lspattach", {
    callback = function(args)
      local buffer = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      on_attach(client, buffer)
    end,
  })
end

function x.starts_with(str, start)
  return str:sub(1, #start) == start
end

function x.is_table(to_check)
  return type(to_check) == "table"
end

function x.has_key(t, key)
  for t_key, _ in pairs(t) do
    if t_key == key then
      return true
    end
  end
  return false
end

function x.has_value(t, val)
  for _, value in ipairs(t) do
    if value == val then
      return true
    end
  end
  return false
end

function x.tprint(table)
  print(vim.inspect(table))
end

function x.tprint_keys(table)
  for k in pairs(table) do
    print(k)
  end
end

x.reload = function()
  local presentreload, reload = pcall(require, "plenary.reload")
  if presentreload then
    local counter = 0

    for modulename in pairs(package.loaded) do
      if x.starts_with(modulename, "lt.") then
        reload.reload_module(modulename)
        counter = counter + 1
      end
    end
    -- clear nvim-mapper keys
    vim.g.mapper_records = nil
    vim.notify("reloaded " .. counter .. " modules!")
  end
end

function x.is_macunix()
  return vim.fn.has("macunix")
end

function x.link_highlight(from, to, override)
  local hl_exists, _ = pcall(vim.api.nvim_get_hl_by_name, from, false)
  if override or not hl_exists then
    -- vim.cmd(("highlight link %s %s"):format(from, to))
    vim.api.nvim_set_hl(0, from, { link = to })
  end
end

x.highlight = function(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

x.highlight_bg = function(group, col)
  vim.api.nvim_set_hl(0, group, { bg = col })
end

-- define fg color
-- @param group group
-- @param color color
x.highlight_fg = function(group, col)
  vim.api.nvim_set_hl(0, group, { fg = col })
end

-- define bg and fg color
-- @param group group
-- @param fgcol fg color
-- @param bgcol bg color
x.highlight_fg_bg = function(group, fgcol, bgcol)
  vim.api.nvim_set_hl(0, group, { bg = bgcol, fg = fgcol })
end

x.from_highlight = function(hl)
  local result = {}
  local list = vim.api.nvim_get_hl_by_name(hl, true)
  for k, v in pairs(list) do
    local name = k == "background" and "bg" or "fg"
    result[name] = string.format("#%06x", v)
  end
  return result
end

x.get_color_from_terminal = function(num, default)
  local key = "terminal_color_" .. num
  return vim.g[key] and vim.g[key] or default
end

x.cmd = function(name, command, desc)
  vim.api.nvim_create_user_command(name, command, desc)
end

x.autocmd = function(evt, opts)
  vim.api.nvim_create_autocmd(evt, opts)
end
return x
