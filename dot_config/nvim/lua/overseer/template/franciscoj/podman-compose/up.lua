return {
	name = "podman compose up",
	desc = "Runs podman compose",
	---@diagnostic disable-next-line: unused-local
	builder = function(_params)
		return {
			cmd = "podman",
			args = { "compose", "up" },
		}
	end,
}
