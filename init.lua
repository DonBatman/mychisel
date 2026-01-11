chisel = {}


dofile(minetest.get_modpath("mychisel").."/chisel.lua")
dofile(minetest.get_modpath("mychisel").."/nodes.lua")


lucky_block:add_blocks({
	{"dro", {"mychisel:chisel"}, 1},
})






