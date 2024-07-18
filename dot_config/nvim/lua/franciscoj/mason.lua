local registry = require("mason-registry")

local M = {}

-- Receives a table of { name = "package", version = "v1.1.1" } and makes sure they are all installed.
-- `version` can be ommited
M.ensure_tools = function(packages)
	for _, package in ipairs(packages) do
		local p = registry.get_package(package["name"])

		if not p:is_installed() then
			p:install({ version = package["version"] })
		end
	end
end

return M
