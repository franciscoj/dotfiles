return {
	desc = "Run podman compose stop to ensure containers are stopped",
	---@diagnostic disable-next-line: unused-local
	constructor = function(_params)
		return {
			---@diagnostic disable-next-line: unused-local
			on_init = function(_self, _task)
				vim.notify("Running dev DB", vim.log.levels.INFO)
			end,
			---@diagnostic disable-next-line: unused-local
			on_dispose = function(_self, _task)
				vim.notify("Running podman compose stop", vim.log.levels.INFO)

				require("overseer").run_template({
					name = "podman compose stop",
				})
			end,
		}
	end,
}
