return {
	"Djancyp/better-comments.nvim",
	config = function()
		require("better-comment").Setup({
			tags = {
				{
					name = "?",
					fg = "#89b4fa",
					bg = "",
					bold = true,
					virtual_text = "",
				},
				{
					name = "->",
					fg = "#a6e3a1",
					bg = "",
					bold = false,
					virtual_text = "",
				},
			},
		})
	end,
}
