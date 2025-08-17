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
}
