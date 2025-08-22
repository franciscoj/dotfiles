--# selene: allow(mixed_table)
return {
	name = "DB server && iex -S mix phx.server",
	---@diagnostic disable-next-line: unused-local
	builder = function(_params)
		return {
			name = "DB server && iex -S mix phx.server",
			strategy = {
				"orchestrator",
				tasks = {
					{
						"podman compose up",
						"iex -S mix phx.server",
					},
				},
			},
		}
	end,

	condition = {
		callback = function(search)
			-- Make sure this is only present on Elixir projects with docker compose setup
			-- TODO(franciscoj): [On 22/08/2025] I might want to find a way to
			-- detect Phoenix projects instead.
			return vim.fs.root(search.dir, { "mix.exs" }) ~= nil
				and vim.fs.root(search.dir, { "compose.yml", "docker-compose.yml" }) ~= nil
		end,
	},
}
