local reg = require("mason-registry")

function get_path(package_name)
  local package = reg.get_package(package_name)

  return package:get_install_path()
end

function ensure_tools()
  local packages = {
    { name = "golangci-lint", version = "v1.49.0" },
    { name = "goimports", version = "latest" },
    { name = "delve", version = "latest" },
  }

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
