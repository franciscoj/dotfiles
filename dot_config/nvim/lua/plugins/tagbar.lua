--# selene: allow(mixed_table)
return {
	{
		"preservim/tagbar",
		enabled = not vim.g.started_by_firenvim,
		cmd = {
			"TagbarOpen",
			"TagbarClose",
			"TagbarToggle",
			"Tagbar",
			"TagbarOpenAutoClose",
			"TagbarTogglePause",
			"TagbarSetFoldlevel",
			"TagbarShowTag",
			"TagbarCurrentTag",
			"TagbarGetTypeConfig",
			"TagbarDebug",
			"TagbarDebugEnd",
			"TagbarForceUpdate",
			"TagbarJump",
			"TagbarJumpPrev",
			"TagbarJumpNext",
		},
	},
}
