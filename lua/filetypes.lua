-- [[ Custom filetypes ]]

vim.filetype.add {
  pattern = {
    -- GitHub Actions workflow files
    ['.*/.github/workflows/.*%.yml'] = 'yaml.ghaction',
    ['.*/.github/workflows/.*%.yaml'] = 'yaml.ghaction',
  },
}
