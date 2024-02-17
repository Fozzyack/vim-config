require('poimandres').setup {}
require('nightcity').setup({
    on_highlights = function(groups, c )
        groups.String = { fg = c.yellow, bg = c.none }
    end
})

require('material').setup({
    disable = {
        colored_cursor = true,
    },
})

local function setColour(colour)
    vim.cmd.colorscheme(colour)
    print(colour)
end

local function getColour()
    return string.format("#%06x", vim.api.nvim_get_hl_by_name("Normal", true).background)
end


local schemes ={ "nightcity-afterlife", "nightcity-kabuki", "material", "material-deep-ocean", "material-palenight", "poimandres", "abscs", "miasma" }
local index = 1
local transparent = false
setColour(schemes[index])
local current_colour = getColour()

vim.keymap.set("n", "<leader>r", function ()
    if transparent then
        vim.api.nvim_set_hl(0, "Normal", { bg = current_colour })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = current_colour })
    else
        vim.api.nvim_set_hl(0, "Normal", { bg = "None" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "None"})
    end
    transparent = not transparent
end)


vim.keymap.set("n", "<leader>n", function ()
    index = ((index) % #schemes) + 1
    setColour(schemes[index])
    current_colour = getColour()
    if transparent then
        vim.api.nvim_set_hl(0, "Normal", { bg = "None" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "None" })
    end
end)





