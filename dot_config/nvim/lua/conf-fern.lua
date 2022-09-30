return function()
  -- Fern conf

  vim.g["fern#renderer"] = "nerdfont"

  local id = vim.api.nvim_create_augroup("fern-glyph-colors", { clear = false })
  vim.api.nvim_clear_autocmds({ group = id })
  vim.api.nvim_create_autocmd({ "FileType" }, {
    group = id,
    pattern = { "fern" },
    callback = "glyph_palette#apply",
  })
end
