return {
	name = "iex -S mix phx.server",
	desc = "Runs phoenix server",
	---@diagnostic disable-next-line: unused-local
	builder = function(_params)
		return {
			cmd = "iex",
			args = { "-S", "mix", "phx.server" },
		}
	end,
}
