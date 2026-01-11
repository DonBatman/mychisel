local USES = 200
local color = '#FF6700'
local TechnicMaxCharge = 300000
chisel = {}

chisel.materials = {}
chisel.mods = {}
chisel.selected = {}
chisel.active = {}
chisel.program = {}
chisel.mode = {}

local default_material = {
	{"default:cobble", 					"default_cobble", 								"Cobble"},
	{"default:sandstone",				"default_sandstone", 							"Sandstone"},
	{"default:clay",					"default_clay",  								"Clay"},
	{"default:coalblock",				"default_coal_block",  							"Coal Block"},
	{"default:stone",					"default_stone", 								"Stone"},
	{"default:desert_stone",			"default_desert_stone", 						"Desert Stone"},
	{"default:wood",					"default_wood", 								"Wood"},
	{"default:acacia_wood",				"default_acacia_wood", 							"Acacia Wood"},
	{"default:aspen_wood",				"default_aspen_wood", 							"Aspen Wood"},
	{"default:pine_wood",				"default_pine_wood", 							"Pine Wood"},
	{"default:desert_cobble",			"default_desert_cobble", 						"Desert Cobble"},
	{"default:junglewood",				"default_junglewood", 							"Jungle Wood"},
	{"default:sandstonebrick",			"default_sandstone_brick", 						"Sandstone Brick"},
	{"default:stonebrick",				"default_stone_brick", 							"Stone Brick"},
	{"default:desert_stonebrick",		"default_desert_stone_brick", 					"Desert Stone Brick"},
	{"default:steelblock", 				"default_steel_block", 							"Steel Block"},
	{"default:copperblock", 			"default_copper_block", 						"Copper Block"},
	{"default:bronzeblock", 			"default_bronze_block", 						"Bronze Block"},
	{"default:goldblock", 				"default_gold_block", 							"Gold Block"},
	{"default:tinblock", 				"default_tin_block", 							"Tin Block"},
	{"moreblocks:copperpatina", 		"moreblocks_copperpatina", 						"Copperpatina"},
	{"default:desert_sandstone",		"default_desert_sandstone", 					"Desert Sandstone"},
	{"default:desert_sandstone_brick",	"default_desert_sandstone_brick", 				"Desert Sandstonebrick"},
	{"default:silver_sandstone",		"default_silver_sandstone", 					"Silver Sandstone"},
	{"default:silver_sandstone_brick",	"default_silver_sandstone_brick", 				"Silver Sandstonebrick"},
	{"mywhiteblock:block",				"mywhiteblock_white^[colorize:#ffffff:200", 	"My White Block"},
	{"mywhiteblock:block_black",		"mywhiteblock_white^[colorize:#000000:240",		"Black"},
	{"mywhiteblock:block_blue",			"mywhiteblock_white^[colorize:#272dc8:200",		"Blue"},
	{"mywhiteblock:block_brown",		"mywhiteblock_white^[colorize:#190B07:160",		"Brown"},
	{"mywhiteblock:block_cyan",			"mywhiteblock_white^[colorize:#00ffff:120",		"Cyan"},
	{"mywhiteblock:block_darkgreen",	"mywhiteblock_white^[colorize:#071907:200",		"Dark Green"},
	{"mywhiteblock:block_darkgrey",		"mywhiteblock_white^[colorize:#000000:200",		"Dark Grey"},
	{"mywhiteblock:block_green",		"mywhiteblock_white^[colorize:#00ff00:160",		"Green"},
	{"mywhiteblock:block_grey",			"mywhiteblock_white^[colorize:#000000:160",		"Grey"},
	{"mywhiteblock:block_magenta",		"mywhiteblock_white^[colorize:#ff00ff:160",		"Magenta"},
	{"mywhiteblock:block_orange",		"mywhiteblock_white^[colorize:#ff7700:220",		"Orange"},
	{"mywhiteblock:block_pink",			"mywhiteblock_white^[colorize:#FE2E9A:200",		"Pink"},
	{"mywhiteblock:block_red",			"mywhiteblock_white^[colorize:#B40404:200",		"Red"},
	{"mywhiteblock:block_violet",		"mywhiteblock_white^[colorize:#2F0B3A:220",		"Violet"},
	{"mywhiteblock:block_white",		"mywhiteblock_white^[colorize:#ffffff:200",		"White"},
	{"mywhiteblock:block_yellow",		"mywhiteblock_white^[colorize:#ffff00:200",		"Yellow"},
	{"mywhiteblock:block_peachpuff",	"mywhiteblock_white^[colorize:#FFDAB9:200",		"Peachpuff"},
	{"mywhiteblock:block_navy",			"mywhiteblock_white^[colorize:#000080:200",		"Navy"},
	{"mywhiteblock:block_coral",		"mywhiteblock_white^[colorize:#FF7F50:200",		"Coral"},
	{"mywhiteblock:block_khaki",		"mywhiteblock_white^[colorize:#F0E68C:200",		"Khaki"},
	{"mywhiteblock:block_lime",			"mywhiteblock_white^[colorize:#00FF00:200",		"Lime"},
	{"mywhiteblock:block_light_pink",	"mywhiteblock_white^[colorize:#FFB6C1:200",		"Light Pink"},
	{"mywhiteblock:block_light_grey",	"mywhiteblock_white^[colorize:#D3D3D3:200",		"Light Grey"},
	{"mywhiteblock:block_purple",		"mywhiteblock_white^[colorize:#800080:200",		"Purple"},
	{"mywhiteblock:block_maroon",		"mywhiteblock_white^[colorize:#800000:200",		"Maroon"},
	{"mywhiteblock:block_aquamarine",	"mywhiteblock_white^[colorize:#7FFFD4:200",		"Aqua Marine"},
	{"mywhiteblock:block_chocolate",	"mywhiteblock_white^[colorize:#D2691E:200",		"Chocolate"},
	{"mywhiteblock:block_crimson",		"mywhiteblock_white^[colorize:#DC143C:200",		"Crimson"},
	{"mywhiteblock:block_olive",		"mywhiteblock_white^[colorize:#808000:200",		"Olive"},
	{"mywhiteblock:block_white_smoke",	"mywhiteblock_white^[colorize:#F5F5F5:200",		"White Smoke"},
	{"mywhiteblock:block_mistyrose",	"mywhiteblock_white^[colorize:#FFE4E1:200",		"Misty Rose"},
	{"mywhiteblock:block_orchid",		"mywhiteblock_white^[colorize:#DA70D6:200",		"Orchid"},
}



if core.get_modpath( "bakedclay") then
	local clay = {
		{"white", "White"},
		{"grey", "Grey"},
		{"black", "Black"},
		{"red", "Red"},
		{"yellow", "Yellow"},
		{"green", "Green"},
		{"cyan", "Cyan"},
		{"blue", "Blue"},
		{"magenta", "Magenta"},
		{"orange", "Orange"},
		{"violet", "Violet"},
		{"brown", "Brown"},
		{"pink", "Pink"},
		{"dark_grey", "Dark Grey"},
		{"dark_green", "Dark Green"},
		{"natural", "Natural"}
	}

	for _, clay in pairs(clay) do
		table.insert(default_material,{"bakedclay:"..clay[1] , "baked_clay_" .. clay[1], clay[2] .. " Baked Clay"})
	end
end

-- Chatcommand to show loaded mods with names and number of styles and supported materials
core.register_chatcommand("chisel", {
	params = "",
	description = "Shows supported mods and materials in mychisel",
	privs = {interact = true},
	func = function(name, poi_name)

		for i in ipairs (chisel.mods) do
			local counter = 1
			local rawname = ""

			core.chat_send_player(name,core.colorize(color,i..") modname: "..chisel.mods[i][1].."   styles: "..chisel.mods[i][2]))
			if chisel.mods[i][1] == "default" then
				for j in ipairs (default_material) do
					core.chat_send_player(name, "     "..j..": "..default_material[j][1])
				end
			else
				for j in ipairs (chisel.materials) do
					if chisel.materials[j][3] ~= rawname then
						core.chat_send_player(name, "     "..counter..": "..chisel.materials[j][3])
						rawname = chisel.materials[j][3]
						counter = counter +1
					end
				end
			end
		end

	end,
})

-- global API

function chisel.register_node(modname, prefix, raw, design) -- global function to register new stuff
	local counter = chisel.count_stuff() +1
	chisel.materials [counter] = {}
	chisel.materials [counter][1] = modname
	chisel.materials [counter][2] = prefix
	chisel.materials [counter][3] = raw
	chisel.materials [counter][4] = design
end


function chisel.add_mod(modname,number)                     -- global function to init a new mod for the chisel.
	local counter = chisel.count_mods() +1
	chisel.mods [counter] = {}
	chisel.mods [counter][1] = modname
	chisel.mods [counter][2] = number
	core.log("action","[CHISEL] Added mod "..modname .. " with " .. number.." styles to mychisel") -- log loaded mods to debug.txt
end



function chisel.count_stuff()  -- how many materials have been registered already ?
	local counter = 0
	for i in ipairs (chisel.materials) do counter = counter +1 end
	return counter
end



function chisel.count_mods()   -- how many different mods are registered ?

	local counter = 0
	for i in ipairs (chisel.mods) do counter = counter +1 end
	return counter
end




-- init chisel for each player joining

local function chiselinit(name)
	chisel.selected[name] = 1
	chisel.active[name] = "default"
	chisel.program[name] = 1
	chisel.mode[name] = "1"
end

core.register_on_joinplayer(function(player)
	chiselinit(player:get_player_name())
end)

-- end init

local function parti(pos)
	core.add_particlespawner({
		amount = 25,
		time = 0.3,
		minpos = pos,
		maxpos = pos,
		minvel = {x=2, y=0.2, z=2},
		maxvel = {x=-2, y=2, z=-2},
		minacc = {x=0, y=-6, z=0},
		maxacc = {x=0, y=-10, z=0},
		minexptime = 0.2,
		maxexptime = 1,
		minsize = 0.2,
		maxsize = 2,
		collisiondetection = true,
		texture = "mychisel_parti.png"
	})
end

local function chiselcut(pos,user,node)
	local name = user:get_player_name()

	for i in ipairs (chisel.materials) do
		local material = chisel.materials[i]

		if material[1] == chisel.active[name] then
			if node.name == material[3] and material[4] == chisel.materials[chisel.program[name]][4] then
				local stack = ItemStack(material[1]..":"..material[2].."_"..material[4])
				if not stack:is_known() then
					return false
				end

				core.set_node(pos, {
					name = stack:get_name(),
					param2 = core.dir_to_facedir(user:get_look_dir())
				})
				return true
			end
		end
	end
end

local chisel_modes = {
	["1"] = {desc = "Chisel 4 Edges",    cut = "mychisel:chiseled_%s"},
	["2"] = {desc = "Horizontal Groove", cut = "mychisel:horizontal_%s"},
	["3"] = {desc = "Vertical Groove",   cut = "mychisel:vertical_%s"},
	["4"] = {desc = "Cross Grooves",     cut = "mychisel:cross_%s"},
	["5"] = {desc = "Square",            cut = "mychisel:square_%s"}
}

local function change_mode(user, choice)
	-- choice = true:  choose next program
	-- choice = false: choose next mode
	local name = user:get_player_name()

	if not choice then
		local player_program = chisel.program[name]
		player_program = player_program + 1
		if player_program > chisel.mods[chisel.selected[name]][2] then
			player_program = 1
		end

		chisel.program[name] = player_program
		core.chat_send_player(name, core.colorize(color, chisel.materials[player_program][4]))
		return
	end

	local player_mode = tostring((tonumber(chisel.mode[name]) or 0) + 1)
	if not chisel_modes[player_mode] then
		player_mode = "1"
	end

	chisel.mode[name] = player_mode
	core.chat_send_player(name, core.colorize(color, chisel_modes[player_mode].desc))
end


local function chiselme(pos, user, node)
	local name = user:get_player_name()

	for i in ipairs (default_material) do
		local item = default_material[i][1]
		local mat = default_material[i][2]
		--local desc = default_material[i][3]
		local cmode = chisel_modes[chisel.mode[name]]
		local newnode

		if cmode then
			if node.name == item then
				newnode = cmode.cut:format(mat .. "1")
			elseif node.name == cmode.cut:format(mat .. "1") then
				newnode = cmode.cut:format(mat .. "2")
			elseif node.name == cmode.cut:format(mat .. "2") then
				newnode = cmode.cut:format(mat .. "3")
			elseif node.name == cmode.cut:format(mat .. "3") then
				newnode = cmode.cut:format(mat .. "4")
			end
		end
		if newnode then
			core.swap_node(pos, {
				name = newnode,
				param2 = core.dir_to_facedir(user:get_look_dir())
			})
			parti(pos)
		end
	end
end


local chisel_def = {
	description = "Chisel",
	inventory_image = "mychisel_chisel.png",
	wield_image = "mychisel_chisel.png",
	-- on_use is specific

	on_place = function(itemstack, user, pointed_thing)
		local number = chisel.count_mods()
		local keys = user:get_player_control()
		local name = user:get_player_name()
		local node = core.get_node(pointed_thing.under)

		-- chisel can be repaired with an anvil
		if node.name == "anvil:anvil" then
			core.item_place(itemstack, user, pointed_thing)
			return itemstack
		end

		-- change design mode of chisel by pressing sneak while right-clicking
		if not keys.sneak then
			if chisel.active[name] == "default" then
				change_mode(user,true)
			else
				change_mode(user,false)
			end
		else
			chisel.selected[name] = chisel.selected[name] + 1
			if chisel.selected[name] > chisel.count_mods() then
				chisel.selected[name] = 1
			end

			chisel.active[name] = chisel.mods[chisel.selected[name]][1]
			core.chat_send_player(
				user:get_player_name(),
				core.colorize(color, " ***>>> switched to mod: "..chisel.active[name])
			)
		end
		return itemstack
	end
}

if not core.get_modpath("technic") then
	chisel_def.on_use = function(itemstack, user, pointed_thing)
		if pointed_thing.type ~= "node" then
			return
		end

		local pos = pointed_thing.under
		local node = core.get_node(pos)
		local name = user:get_player_name()
		local cut = false

		if core.is_protected(pos, user:get_player_name()) then
			core.record_protection_violation(pos, user:get_player_name())
			return
		end

		if chisel.active[name] == "default" then
			chiselme(pos,user,node)
		else
			cut = chiselcut(pos,user,node)
		end

		if not core.settings:get_bool("creative_mode") and cut then
			itemstack:add_wear(65535 / (USES - 1))
		end

		return itemstack
	end

	core.register_tool("mychisel:chisel", chisel_def)

	core.register_craft({
		output = "mychisel:chisel",
		recipe = {
			{"default:steel_ingot"},
			{"wool:brown"},
		},
	})

else -- technic is installed

	local S = technic.getter
	local chisel_charge_per_node = math.floor(TechnicMaxCharge / USES)

	chisel_def.description = S("Chisel")

	if technic.plus then
		chisel_def.max_charge = TechnicMaxCharge
		chisel_def.on_use = function(itemstack, user, pointed_thing)
			if pointed_thing.type ~= "node" then
				return
			end

			local pos = pointed_thing.under
			local node = core.get_node(pos)
			local name = user:get_player_name()

			if core.is_protected(pos, name) then
				core.record_protection_violation(pos, name)
				return
			end

			if technic.use_RE_charge(itemstack, chisel_charge_per_node) then
				if chisel.active[name] == "default" then
					chiselme(pos,user,node)
				else
					chiselcut(pos,user,node)
				end
				return itemstack
			end
		end
		technic.register_power_tool("mychisel:chisel", chisel_def)
	else
		technic.register_power_tool("mychisel:chisel",TechnicMaxCharge)

		chisel_def.wear_represents = "technic_RE_charge"
		chisel_def.on_refill = technic.refill_RE_charge
		chisel_def.on_use = function(itemstack, user, pointed_thing)
			if pointed_thing.type ~= "node" then
				return
			end

			local pos = pointed_thing.under
			local node = core.get_node(pos)
			local name = user:get_player_name()

			if core.is_protected(pos, user:get_player_name()) then
				core.record_protection_violation(pos, user:get_player_name())
				return
			end

			local meta = core.deserialize(itemstack:get_metadata())
			if not meta or not meta.charge or
					meta.charge < chisel_charge_per_node then
				return
			end

			if chisel.active[name] == "default" then
				chiselme(pos,user,node)
			else
				chiselcut(pos,user,node)
			end
			meta.charge = meta.charge - chisel_charge_per_node

			if not technic.creative_mode then
				technic.set_RE_wear(itemstack, meta.charge, TechnicMaxCharge)
				itemstack:set_metadata(core.serialize(meta))
			end

			return itemstack
		end,

		core.register_tool("mychisel:chisel", chisel_def)
	end

	core.register_craft({
		output = "mychisel:chisel",
		recipe = {
			{"default:diamond", "default:diamond" ,              "default:diamond"},
			{"",                "technic:stainless_steel_ingot", ""},
			{"",                "technic:battery",               ""},
		}
	})
end

chisel.add_mod("default",5)
