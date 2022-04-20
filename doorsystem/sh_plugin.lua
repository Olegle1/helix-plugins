PLUGIN.name = "Door System"
PLUGIN.description = "Adds a simply configurable door system."
PLUGIN.author = "Skay™#2752"

--[[ DOOR SYSTEM TEMPLATE

   [2152] = { -- Map Creation ID of the door
      ["name"] = "Bridge Access", -- Display name of the door
      ["access"] = 2, -- Access of the door
	},   

]]

PLUGIN.access = {
	[1] = {
		["name"] = "Universal Access 1",
		["color"] = Color(0, 100, 255),
		["factions"] = {FACTION_CP, FACTION_GRUNT, FACTION_OTA, FACTION_CA, FACTION_DISPATCH},
		["sound"] = "buttons/combine_button2.wav",
	},
	[2] = {

		["name"] = "Universal Access 2",
		["color"] = Color(30, 220, 200),
		["factions"] = {FACTION_GRUNT, FACTION_OTA, FACTION_CA, FACTION_DISPATCH},
		["sound"] = "buttons/combine_button7.wav",
	},
	[3] = {
		 ["name"] = "Universal Access 3", -- Name of the door access to be displayed
		 ["color"] = Color(255, 0, 0), -- Color of the display
		 ["factions"] = {FACTION_CA, FACTION_DISPATCH}, -- Factions that are allowed to use the door
		 ["sound"] = "buttons/combine_button1.wav", -- Sound on opening the door
	},
}


PLUGIN.doors = {
   [6969] = { -- Map Creation ID of the door
      ["name"] = "Yo CP's come in boys.", -- Display name of the door
      ["access"] = 1, -- Access of the door
	},
}