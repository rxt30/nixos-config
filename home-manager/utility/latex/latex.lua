return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				digestif = {},
			},
		},
	},
	{
		"stevearch/conform.nvim",
		opts = {
			formatters_by_ft = {
				tex = { "latexindent" },
				plaintex = { "latexindent" },
			},
		},
	},
}
