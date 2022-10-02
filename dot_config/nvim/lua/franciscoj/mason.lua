local reg = require("mason-registry")
local path = require("mason-core.path")

-- receives a package name and returns the path to its binary
local function get_path(package_name)
	return path.concat({ vim.fn.stdpath("data"), "mason", "bin", package_name })
end

-- Receives a table of { name = "package", version = "v1.1.1" } and makes sure they are all installed.
-- `version` can be ommited
local function ensure_tools(packages)
	for _, package in ipairs(packages) do
		local p = reg.get_package(package["name"])

		if not p:is_installed() then
			p:install({ version = package["version"] })
		end
	end
end

return {
	get_path = get_path,
	ensure_tools = ensure_tools,
}
