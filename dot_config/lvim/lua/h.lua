local H = {}

function H.nnoremap(key, cmd)
  vim.api.nvim_set_keymap("n", key, cmd, {noremap = true})
end

function H.tnoremap(key, cmd)
  vim.api.nvim_set_keymap("t", key, cmd, {noremap = true})
end

return H
