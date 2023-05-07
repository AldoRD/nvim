local status, bufferline = pcall(require, "bufferline")
if not status then
	return
end

local colors = {
	color_1 = "#fdf6e3",
	color_2 = "#1f2335",
	color_3 = "#232433",
	color_4 = "#657b83",
}

bufferline.setup({
	options = {
		mode = "tabs",
		separator_style = "thin",
		always_show_bufferline = false,
		show_buffer_close_icons = false,
		show_close_icon = false,
		color_icons = true,
		offsets = {
			{
				filetype = "coc-explorer",
				highlight = "Directory",
				text = "File Explorer",
				text_align = "center",
			},
		},
	},
	highlights = {
		separator = {
			fg = colors.color_2,
			bg = colors.color_3,
		},
		separator_selected = {
			fg = colors.color_2,
		},
		background = {
			fg = colors.color_4,
			bg = colors.color_3,
		},
		buffer_selected = {
			fg = colors.color_1,
			bold = true,
		},
		fill = {
			bg = colors.color_2,
		},
		modified = {
			bg = colors.color_3,
		},
		modified_visible = {
			bg = colors.color_3,
		},
		pick = {
			bg = colors.color_3,
		},
		pick_visible = {
			bg = colors.color_3,
		},
	},
})

vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", {})
vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", {})
vim.keymap.set("n", "<leader>ge", "<Cmd>BufferLinePick<CR>", { silent = true })
