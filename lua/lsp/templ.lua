---@brief
---
--- https://templ.guide
---
--- The official language server for the templ HTML templating language.

---@type vim.lsp.Config
return {
  cmd = { 'templ', 'lsp' },
  filetypes = { 'templ' },
  root_markers = { 'go.work', 'go.mod', '.git' },
  -- https://templ.guide/developer-tools/ide-support/#formatting
  on_attach = function()
    -- local templ_format = function()
    --   local bufnr = vim.api.nvim_get_current_buf()
    -- local filename = vim.api.nvim_buf_get_name(bufnr)
    -- local cmd = 'templ fmt ' .. vim.fn.shellescape(filename)
    --
    -- vim.fn.jobstart(cmd, {
    --   on_exit = function()
    --     -- Reload the buffer only if it's still the current buffer
    --     if vim.api.nvim_get_current_buf() == bufnr then vim.cmd 'e!' end
    --   end,
    --   })
    -- end

    vim.api.nvim_create_autocmd({ 'BufWritePre' }, { pattern = { '*.templ' }, callback = vim.lsp.buf.format })
  end,
}
