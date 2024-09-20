local colorscheme = {}

-- todo
--      make it more configurable so i can share this online lol
--
--      add the other palenight syntax stuff
--      handle the top/bottom background stuff
--      handle dark/light themes
--      make the yaml_link come from config
--      add error msging for the setup

local utils = require("warp-theme.utils")
local colors = require("warp-theme.colors")

local function apply_highlights(highlights)
    for group, opts in pairs(highlights) do
        local gui = opts.style and "gui=" .. opts.style or "gui=NONE"
        local guifg = opts.fg and "guifg=" .. opts.fg or "guifg=NONE"
        local guibg = opts.bg and "guibg=" .. opts.bg or "guibg = NONE"
        vim.cmd(string.format("highlight %s %s %s %s", group, gui, guifg, guibg))
    end
end

colorscheme.setup = function(config)
    vim.cmd("highlight clear")
    if vim.fn.exists("syntax_on") then
        vim.cmd("syntax reset")
    end

    local name = "warp theme"
    vim.g.colors_name = name

    local yaml_table = utils.load_config(config.theme_link)
    local theme = colors.get_colors(yaml_table)
    apply_highlights(theme)

    vim.o.background = "dark"
end

return colorscheme
