return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				digestif = {},
				ltex = {
					settings = {
						checkFrequency = "save",
					},
				},
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
