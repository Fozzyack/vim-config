require("sfm").setup({
  file_nesting = {
    enabled = true, -- controls whether file nesting is enabled
    expand = true, -- controls whether nested files are expanded by default
    patterns = {
      { "*.cs", { "$(capture).*.cs" } },
      { "*.ts", { "$(capture).js", "$(capture).d.ts.map", "$(capture).*.ts", "$(capture)_*.js", "$(capture)_*.ts" } },
      { "go.mod", { "go.sum" } },
    }, -- controls how files get nested
  }
})

function AutoStartSFM()
    vim.cmd("SFMToggle")
end

-- Uncomment the next line to auto start sfm
-- AutoStartSFM()


