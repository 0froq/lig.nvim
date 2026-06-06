---@diagnostic disable: undefined-global
local template = require('lig.colors.template')

local M = {}

M.get_palette = template.get_palette
M.gen_triad = template.gen_triad

M.get_palette()

return M
