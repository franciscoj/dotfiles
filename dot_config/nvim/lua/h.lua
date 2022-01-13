local H = {}

local opts = { noremap = true, silent = true }

function H.nnoremap(key, cmd)
	vim.api.nvim_set_keymap("n", key, cmd, opts)
end

function H.tnoremap(key, cmd)
	vim.api.nvim_set_keymap("t", key, cmd, opts)
end

function H.inoremap(key, cmd)
	vim.api.nvim_set_keymap("i", key, cmd, opts)
end

function H.xnoremap(key, cmd)
	vim.api.nvim_set_keymap("x", key, cmd, opts)
end

function H.has_value(tab, val)
	for index, value in ipairs(tab) do
		if value == val then
			return true
		end
	end

	return false
end

return H
