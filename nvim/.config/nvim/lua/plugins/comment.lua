return require('Comment').setup({
	mappings = {
		---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
		basic = true,
		---Extra mapping; `gco`, `gcO`, `gcA`
		extra = true,
		---Extended mapping; `g>` `g<` `g>[count]{motion}` `g<[count]{motion}`
		extended = false,
	}
})
