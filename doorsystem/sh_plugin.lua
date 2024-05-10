local PLUGIN = PLUGIN

PLUGIN.name = "Door System"
PLUGIN.description = "Adds a simply configurable door system."
PLUGIN.author = "eon (bloodycop)"
PLUGIN.license = [[
Copyright 2024 eon (bloodycop)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
]]


--[[ DOOR SYSTEM TEMPLATE

   ["mapname"] = { -- use status in console
		{
			id = 3965, -- Map Creation ID of the door
			name = "Yo CP's come in boys.", -- Display name of the door
			access = 1 -- Access of the door
		},
	}

]]

ix.util.Include("cl_hooks.lua")
ix.util.Include("sv_hooks.lua")
ix.util.Include("sh_entity.lua")
PLUGIN.access = {
	[1] = {
		name = "Universal Access 1",
		color= Color(0, 100, 255),
		checkAccess = function(ply)
			return ( ply:Team() == FACTION_MPF or ply:Team() == FACTION_OTA )
		end,
		snd = "buttons/combine_button2.wav"
	},
	[2] = {
		name = "Universal Access 2",
		color = Color(30, 220, 200),
		checkAccess = function(ply)
			return ( ply:Team() == FACTION_OTA )
		end,
		snd = "buttons/combine_button7.wav"
	},
	[3] = {
		name = "Universal Access 3", -- Name of the door access to be displayed
		color = Color(255, 0, 0), -- Color of the display
		checkAccess = function(ply)
			return ( ply:Team() == FACTION_OTA )
		end, -- Factions that are allowed to use the door
		snd = "buttons/combine_button1.wav" -- Sound on opening the door
	},
}


PLUGIN.doors = {
	["rp_city17_conflictstudios"] = {
		{
			id = 3965, -- Map Creation ID of the door
			name = "Yo CP's come in boys.", -- Display name of the door
			access = 1 -- Access of the door
		},
		{
			id = 3966,
			name = "cat",
			access = 1
		},
		{	
			id = 4110,
			name = "drugs",
			access = 2	
		}
	},
	["rp_nc_d47_v2"] = {
		{
			id = 2380,
			name = "hi",
			access = 1
		}
	}
}