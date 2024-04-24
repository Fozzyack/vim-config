local ob = require('obsidian')

ob.setup(
    {
        workspaces = {
            {
            name = "Knowledge",
            path = "~/Documents/ObsidianVault/Knowledge",
        }
        },
    completion = {

        nvim_cmp = true,
        min_chars = 2,
    },
    }
)

vim.cmd('set conceallevel=2')
