return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				digestif = {},
				ltex = {},
				texlab = {},
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
