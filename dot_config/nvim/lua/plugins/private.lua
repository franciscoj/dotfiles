if vim.fn.getftype("~/.config/private.nvim") ~= "dir" then
	return {}
end

return {
	{ dir = "~/.config/private.nvim/" },
}

