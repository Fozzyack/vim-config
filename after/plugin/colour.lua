
function setColour(colour) 
    colour = colour or 'everforest'
    vim.cmd.colorscheme(colour)
    vim.api.nvim_set_hl(0, "Normal", { bg = "None" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "None" })
end

setColour()
