-- local icons = require "nvim-nonicons"

-- 1) Carga web-devicons y sobreescribe con material-icon
local ok_devicons, devicons = pcall(require, "nvim-web-devicons")
if not ok_devicons then return end

local ok_mat, material_icon = pcall(require, "nvim-material-icon") -- DaikyXendo/nvim-material-icon
if ok_mat then
  devicons.setup({
    -- overrides puntuales tuyos
    override = {
      zsh = { icon = "", color = "#428850", cterm_color = "65", name = "Zsh" },
    },
    -- colores por icono
    color_icons = true,
    -- usa iconos por defecto cuando no exista match
    default = true,
    -- evita matches “accidentales” por nombre
    strict = true,
    override_by_filename = {
      [".gitignore"] = { icon = "", color = "#f1502f", name = "Gitignore" },
    },
    override_by_extension = {
      log = { icon = "", color = "#81e043", name = "Log" },
    },
  })

  -- Aplica el mapeo de material-icon como override general
  devicons.setup({ override = material_icon.get_icons() })
else
  -- Sin material-icon: usa solo devicons con tus overrides
  devicons.setup({
    override = {
      zsh = { icon = "", color = "#428850", cterm_color = "65", name = "Zsh" },
    },
    color_icons = true,
    default = true,
    strict = true,
  })
end

-- Opcional: ícono por defecto si no hay match
devicons.set_default_icon('', '#6d8086', 65)

-- 2) Telescope: reemplaza el prefix sin nvim-nonicons
local ok_tel, telescope = pcall(require, "telescope")
if ok_tel then
  telescope.setup({
    defaults = {
      -- Usa un glifo simple para lupa (sin dependencias extra)
      prompt_prefix = "    ",
      selection_caret = " ❯ ",
      entry_prefix = "   ",
    },
  })
end
