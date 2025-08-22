--# selene: allow(mixed_table)
return {
	name = "podman compose stop",
	desc = "Stops a running podman compose",
	---@diagnostic disable-next-line: unused-local
	builder = function(_params)
		return {
			cmd = "podman",
			args = { "compose", "stop" },
			strategy = {
				"toggleterm",
				open_on_start = false,
			},
		}
	end,
	condition = {
		callback = function(search)
			-- Make sure this is only present on Elixir projects
			-- TODO(franciscoj): [On 22/08/2025] I might want to find a way to
			-- detect Phoenix projects instead.
			return vim.fs.root(search.dir, { "compose.yml", "docker-compose.yml" }) ~= nil
		end,
	},
}
