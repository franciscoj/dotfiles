return {
	desc = "Run podman compose stop to ensure containers are stopped",
	---@diagnostic disable-next-line: unused-local
	constructor = function(_params)
		return {
			---@diagnostic disable-next-line: unused-local
			on_init = function(_self, _task)
				vim.notify("Running dev DB", vim.log.levels.INFO)

				-- When the task is running, make sure that compose is stopped
				-- before NVim exists
				vim.api.nvim_create_autocmd("VimLeavePre", {
					pattern = "*",
					callback = function()
						-- Run the stop command sync so that vim doesn't exit
						-- before it has stopped
						vim.system({ "podman", "compose", "stop" }):wait()

						vim.notify("Stopping development DB", vim.log.levels.INFO)
					end,
				})
			end,
			---@diagnostic disable-next-line: unused-local
			on_exit = function(_self, _task)
				vim.notify("Running podman compose stop", vim.log.levels.INFO)
				require("overseer").run_template({
					name = "podman compose stop",
				})
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
