return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				marksman = {},
			},
		},
	},
	{
		"stevearch/conform.nvim",
		opts = {
			formatters_by_ft = {
				markdown = { "mdformat", "deno_fmt" },
			},
		},
	},
}
