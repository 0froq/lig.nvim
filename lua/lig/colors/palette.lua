---@diagnostic disable: undefined-global
local M = {}

---@class Colors
local color = {
  rose = {
    "#f7c7c7", -- 1 亮：比原来略提亮，适合作为错误前景或浅背景
    "#e79a9a", -- 2 中：保持原色，主用
    "#a45b5b", -- 3 暗：略压暗，作为深色前景/hover
  },
  coral = {
    "#f6bf9f", -- 1 亮：比原来稍暖、亮一点
    "#e0926d", -- 2 中：保留原色，适合作为主 action
    "#9b5a36", -- 3 暗：略增对比，靠近 rose[3] 的明度
  },
  amber = {
    "#f1d89b", -- 1 亮：稍提亮，让 1 在所有色相里明度更一致
    "#d7b366", -- 2 中：略收饱和，减少刺眼感
    "#916f3b", -- 3 暗：压一点，和 coral[3]、olive[3] 在同一明度带
  },
  cyan = {
    "#a2e1e1", -- 1 亮：微提亮，和 teal[1]/azure[1] 亮度对齐
    "#68b7b7", -- 2 中：略降亮度，让 1/2 差距更明显
    "#3a7878", -- 3 暗：略加深，接近 teal[3] 明度
  },
  teal = {
    "#9adcc0", -- 1 亮：稍提亮一点，避免比 cyan[1] 更暗
    "#60b89a", -- 2 中：略压饱和以便长时间阅读
    "#376f5a", -- 3 暗：稍加深，和 cyan[3]/emerald[3] 对齐
  },
  azure = {
    "#aacdf7", -- 1 亮：略提亮，使数字/布尔在暗背景下更清晰
    "#6fa8f0", -- 2 中：保留原色，作为主 ref
    "#3f6496", -- 3 暗：稍收亮度，对齐 indigo[3]/iris[3]
  },
  indigo = {
    "#b8bae8", -- 1 亮：微提亮，避免比 azure[1] 暗太多
    "#8286d4", -- 2 中：略降亮度，与 azure[2]/iris[2] 持平
    "#4c4f93", -- 3 暗：稍压深，作为强 ref/特殊状态
  },
  moss = {
    "#bedba6", -- 1 亮：提亮一点，便于做 diff.add 浅背景
    "#87b173", -- 2 中：略压饱和，少一点“荧光绿”的感受
    "#526b46", -- 3 暗：调整到与 teal[3]/olive[3] 接近的明度
  },
  olive = {
    "#d6cf95", -- 1 亮：略调亮，避免比 amber[1] 暗
    "#a69c60", -- 2 中：收灰一点，避免过分抢眼
    "#6a643a", -- 3 暗：轻微统一到同一暗度层
  },
  emerald = {
    "#a3e4b8", -- 1 亮：比原来略亮，和 teal[1] 对称
    "#69c493", -- 2 中：微调靠近 teal[2] 的明度
    "#387a55", -- 3 暗：和 teal[3]/moss[3] 在同一亮度带
  },
  sage = {
    "#cadcc7", -- 1 亮：略提亮，适合作 info/淡边框
    "#98b29a", -- 2 中：稍提亮，与 moss[2] 接近
    "#627662", -- 3 暗：略压深，让 1/3 差更明显
  },
  mauve = {
    "#d2b7e0", -- 1 亮：轻微提亮，统一到 iris/rose 的亮度区
    "#a67dbe", -- 2 中：收一点灰，长看不腻
    "#6a4f88", -- 3 暗：与 plum[3]/indigo[3] 明度对齐
  },
  plum = {
    "#e1b9d5", -- 1 亮：稍亮一点，适合用在 subtle 选择或强调
    "#b57aa7", -- 2 中：饱和略收，使其不压过 rose
    "#774d70", -- 3 暗：统一到深紫系的暗度层
  },
  iris = {
    "#b8b7e5", -- 1 亮：微调对齐 indigo[1]/mauve[1]
    "#8885c8", -- 2 中：稍降亮度，避免与 azure[2] 差太多
    "#545295", -- 3 暗：轻微下压，作为更深的蓝紫 ref/装饰
  },
}

---@class GrayScale
local gray_scale = {
  black       = "#000000",
  white       = "#ffffff",

  soft_50    = "#fff9f5",
  soft_100   = "#e7e2de",
  soft_200   = "#cfcac7",
  soft_300   = "#b7b3b0",
  soft_400   = "#9f9c99",
  soft_500   = "#878583",
  soft_600   = "#6f6d6c",
  soft_700   = "#575655",
  soft_800   = "#3f3f3e",
  soft_900   = "#272727",
  soft_950   = "#0f1010",
}

M.get_palette = function(style)
  -- concat table
  if style == "light" then
    for k, v in pairs(color) do
      color[k] = { v[3], v[2], v[1] }
    end
  end

  ---@class Palette: GrayScale, Colors
  palette = vim.tbl_deep_extend("force", color, gray_scale)

  return palette
end

M.get_palette()

return M
