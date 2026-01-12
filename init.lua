chisel = {}


dofile(minetest.get_modpath("mychisel").."/chisel.lua")
dofile(minetest.get_modpath("mychisel").."/nodes.lua")


if core.get_modpath("lucky_block") then
	lucky_block:add_blocks({
		{"dro", {"mychisel:chisel"}, 1},
	})
end





