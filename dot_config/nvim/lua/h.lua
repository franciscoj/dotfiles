local H = {}

function H.has_value(tab, val)
	for index, value in ipairs(tab) do
		if value == val then
			return true
		end
	end

	return false
end

function H.nnoremap(lhs, rhs)
	vim.keymap.set("n", lhs, rhs, { silent = true })
end

function H.xnoremap(lhs, rhs)
	vim.keymap.set("x", lhs, rhs, { silent = true })
end

return H
