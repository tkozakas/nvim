vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '*Jenkinsfile*',
  callback = function()
    vim.bo.filetype = 'groovy'
  end,
  desc = 'Set Jenkinsfile filetype to groovy for syntax highlighting',
})

-- Write current directory to file on exit so shell can cd to it
vim.api.nvim_create_autocmd('VimLeavePre', {
  callback = function()
    local cwd = vim.fn.getcwd()
    local file = vim.fn.expand('~/.config/nvim/.last_dir')
    vim.fn.writefile({cwd}, file)
  end,
  desc = 'Save current directory on exit for shell integration',
})
