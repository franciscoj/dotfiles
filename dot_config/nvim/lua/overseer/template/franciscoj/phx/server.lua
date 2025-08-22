--# selene: allow(mixed_table)
return {
	name = "iex -S mix phx.server",
	desc = "Runs phoenix server",
	---@diagnostic disable-next-line: unused-local
	builder = function(_params)
		return {
			cmd = "iex",
			args = { "-S", "mix", "phx.server" },
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
			return vim.fs.root(search.dir, { "mix.exs" }) ~= nil
		end,
	},
}
