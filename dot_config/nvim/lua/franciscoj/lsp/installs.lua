-- This sets up all LSP servers that I want autoinstalled. If they are not on
-- the machine, a plugin will install them and then use a callback to configure
-- them.
local cfg = require("franciscoj.lsp.cfg")
local h = require("h")
local installer = require("nvim-lsp-installer")
local installable_servers = {
	"gopls",
	"rust_analyzer",
	"sumneko_lua",
	"yamlls",
}

for _, name in pairs(installable_servers) do
	local found, server = installer.get_server(name)
	if found then
		if not server:is_installed() then
			print("Installing LSP server: " .. name)
			server:install()
		end
	end
end

installer.on_server_ready(function(server)
	-- Only configure here the servers that I want autoinstalled
	if not h.has_value(installable_servers, server.name) then
		return
	end

	local defaults = cfg.defaults()

	-- These are server specific options for the ones that are automatically
	-- installed
	local server_opts = {
		["sumneko_lua"] = require("franciscoj.lsp.installs.sumneko_lua"),
		["gopls"] = require("franciscoj.lsp.installs.gopls"),
		["yamlls"] = require("franciscoj.lsp.installs.yamlls"),
	}

	-- Use the server's custom settings, if they exist, otherwise default to the
	-- default options
	local opts = server_opts[server.name] and server_opts[server.name]() or defaults
	server:setup(opts)
end)
