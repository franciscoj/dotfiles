local reg = require("mason-registry")

function get_path(package_name)
  local package = reg.get_package(package_name)

  return package:get_install_path()
end

-- Receives a table of { name = "package", version = "v1.1.1" } and makes sure they are all installed.
function ensure_tools(packages)
  for idx, package in ipairs(packages) do
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
