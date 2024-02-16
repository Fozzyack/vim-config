require('poimandres').setup {}
require('nightcity').setup({
    style = 'afterlife',
    on_highlights = function(groups, c )
        groups.String = { fg = c.yellow, bg = c.none }
    end
})

require('material').setup({
    disable = {
        colored_cursor = true,
    },
})
function setColour(colour) 
    colour = colour or 'nightcity'
    vim.g.material_style = 'deep ocean'
    vim.cmd.colorscheme(colour)
--    vim.api.nvim_set_hl(0, "Normal", { bg = "None" })
--    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "None" })
end

setColour()
