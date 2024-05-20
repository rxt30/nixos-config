return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				pyright = {},
				-- pylsp = {},
			},
		},
	},
	{
		"stevearch/conform.nvim",
		opts = {
			formatters_by_ft = {
				python = { "black" },
			},
		},
	},
}
