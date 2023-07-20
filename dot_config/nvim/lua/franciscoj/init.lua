-- This adds some global methods that are useful when debuggin the development of Lua stuff inside neovim itself.

-- P prints the inspection of whatever thing is given. Useful in order to see
-- what's inside a table for example. In addition it returns the same value
-- again, which makes it great debug the value of things in place
_G.P = function(v)
	print(vim.inspect(v))

	return v
end

_G.RELOAD = function(...)
	return require("plenary.reload").reload_module(...)
end

_G.R = function(name)
	_G.RELOAD(name)

	return require(name)
end
