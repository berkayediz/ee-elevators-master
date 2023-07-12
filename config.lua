-- Configuration table
Config = {}
Config.UseESX = false						-- Should ESX Framework be used?
Config.UseQBCore = true						-- Should QBCore Framework be used? (Ignored if Config.UseESX = true)
Config.ThirdEyeName = 'qb-target' 			-- Name of the third eye application
Config.Use3DText = true                     -- Should 3D text be used for interaction?
Config.NHMenu = false						-- Should NH-Context be used? [https://github.com/nighmares/nh-context]
Config.QBMenu = true						-- Should QB-Menu be used? (Ignored if Config.NHInput = true) [https://github.com/qbcore-framework/qb-input]
Config.OXLib = false						-- Should OX_lib be used? (Ignored if Config.NHInput or Config.QBInput = true) [https://github.com/overextended/ox_lib] !! Must add shared_script '@ox_lib/init.lua' and lua54 'yes' to fxmanifest!!
Config.ElevatorWaitTime = 1					-- How many seconds until the player arrives at their floor
Config.Notify = {
	enabled = true,							-- Display hint notification?
	distance = 3.0,							-- Distance from the elevator that the hint will show
	message = "Target the elevator to use"	-- Text of the hint notification
}
--[[
	USAGE
	To add an elevator, copy the table below and configure as needed:
		coords = vector3 coords of center of elevator
		heading = Direction facing out of the elevator
		level = What floor are they going to
		label = What is on that floor
		jobs = OPTIONAL: Table of job keys that are allowed to access that floor and value of minimum grade of each job
		items = OPTIONAL: Any items that are required to access that floor (only requires one of the items listed)
		jobAndItem = OPTIONAL: If true, you must you have a required job AND a required items. If false or nil no items are needed
	
]]

--[[
	ExampleElevator = {	
		{
			coords = vector3(xxx, yyy, zzz), heading = 0.0, level = "Floor 2", label = "Roof",
			jobs = {
				["police"] = 0,
				["ambulance"] = 0,
				["casino"] = 0,
			},
			items = {
				"casino_pass_bronze",
				"casino_pass_silver",
				"casino_pass_gold",
			}
		},
		{
			coords = vector3(xxx, yyy, zzz), heading = 0.0, level = "Floor 1", label = "Penthouse",
			jobs = {
				["police"] = 0,
				["ambulance"] = 0,
				["casino"] = 0,
			},
			items = {
				"casino_pass_gold",
			},
			jobAndItem = true
		},
		{
			coords = vector3(xxx, yyy, zzz), heading = 0.0, level = "Floor 0", label = "Ground"
		},
	},
]]

Config.Elevators = {
	VPDMainElevator = {	
		{
			coords = vector3(-1096.22, -850.763, 38.20), heading = 36.8, level = "Floor 6", label = "Roof Access",
			jobs = {
				["police"] = 0,
				["sheriff"] = 0,
				["ambulance"] = 0,
			},
		},
		{
			coords = vector3(-1096.22, -850.763, 34.40), heading = 36.8, level = "Floor 5", label = "Detective Bureau",
			jobs = {
				["police"] = 0,
				["sheriff"] = 0,
				["ambulance"] = 0,
			},
		},
		{
			coords = vector3(-1096.22, -850.763, 30.80), heading = 36.8, level = "Floor 4", label = "Operations Center",
			jobs = {
				["police"] = 0,
				["sheriff"] = 0,
				["ambulance"] = 0,
			},
		},
		{
			coords = vector3(-1096.22, -850.763, 27.00), heading = 36.8, level = "Floor 3", label = "Division Offices & Briefing Room",
			jobs = {
				["police"] = 0,
				["sheriff"] = 0,
				["ambulance"] = 0,
			},
		},
		{
			coords = vector3(-1096.22, -850.763, 23.00), heading = 36.8, level = "Floor 2", label = "Cafe",
			jobs = {
				["police"] = 0,
				["sheriff"] = 0,
				["ambulance"] = 0,
			},
		},
		{
			coords = vector3(-1096.22, -850.763, 19.00), heading = 36.8, level = "Floor 1", label = "Main Hall",
			jobs = {
				["police"] = 0,
				["sheriff"] = 0,
				["ambulance"] = 0,
			},
		},
		{
			coords = vector3(-1096.22, -850.763, 4.80), heading = 36.8, level = "Floor -1", label = "Detention Cells & Interrogation",
			jobs = {
				["police"] = 0,
				["sheriff"] = 0,
				["ambulance"] = 0,
			},
		},
		{
			coords = vector3(-1096.22, -850.763, 10.20), heading = 36.8, level = "Floor -2", label = "Crime Lab & Evidence Rooms",
			jobs = {
				["police"] = 0,
				["sheriff"] = 0,
				["ambulance"] = 0,
			},
		},
		{
			coords = vector3(-1096.22, -850.763, 13.70), heading = 36.8, level = "Floor -3", label = "Garage & Armory",
			jobs = {
				["police"] = 0,
				["sheriff"] = 0,
				["ambulance"] = 0,
			},
		},
	},
	
	VPDPublicElevator = {
		{
			coords = vector3(-1066.05, -833.71, 26.82318), heading = 36.1, level = "Floor 3", label = "Division Offices",
		},
		{
			coords = vector3(-1066.05, -833.71, 23.03471), heading = 36.1, level = "Floor 2", label = "UNDER RENOVATIONS",
			jobs = {
				["police"] = 0,
				["sheriff"] = 0,
				["ambulance"] = 0,
			},
		},
		{
			coords = vector3(-1066.05, -833.713, 18.9964), heading = 36.1, level = "Floor 1", label = "Main Hall",
		},
		{
			coords = vector3(-1066.05, -833.71, 4.88), heading = 36.1, level = "Floor -1", label = "Detention Cells & Interrogation",
			jobs = {
				["police"] = 0,
				["sheriff"] = 0,
				["ambulance"] = 0,
			},
		},
		{
			coords = vector3(-1066.05, -833.71, 10.27282), heading = 36.1, level = "Floor -2", label = "Crime Lab & Evidence Rooms",
			jobs = {
				["police"] = 0,
				["sheriff"] = 0,
				["ambulance"] = 0,
			}
		},
		{
			coords = vector3(-1066.05, -833.71, 13.69069), heading = 36.1, level = "Floor -3", label = "Garage & Armory",
			jobs = {
				["police"] = 0,
				["sheriff"] = 0,
				["ambulance"] = 0,
			},
		},
	},
	
	SkybarElevatorSouth = {
		{
			coords = vector3(315.49, -929.32, 52.81), heading = 176.67, level = "Skybar 5th Floor", label = "Bar Level for Skybar",
		},
		{
			coords = vector3(315.49, -929.32, 29.47), heading = 176.67, level = "Skybar Ground", label = "Street Level for Skybar",
		},
	},
	
	SkybarElevatorNorth = {
		{
			coords = vector3(309.81, -929.05, 52.81), heading = 176.67, level = "Skybar 5th Floor", label = "Bar Level for Skybar",
		},
		{
			coords = vector3(309.81, -929.05, 29.47), heading = 176.67, level = "Skybar Ground", label = "Street Level for Skybar",
		},
	},
	PillboxElevatorNorth = {
		{
			coords = vector3(332.37, -595.56, 43.28), heading = 70.65, level = "Upper Pillbox", label = "Pillbox - Main Floor",
		},
		{
			coords = vector3(344.31, -586.12, 28.79), heading = 252.84, level = "Lower Pillbox", label = "Pillbox - Lower Pillbox",
			jobs = {
				["police"] = 0,
				["ambulance"] = 0,
			},
		},
		{
			coords = vector3(340.05, -584.98, 28.79), heading = 88.21, level = "Parking", label = "Pillbox - Parking Facilities",
			jobs = {
				["police"] = 0,
				["ambulance"] = 0,
			},
		},
	},
	
	PillboxElevatorSouth = {
		{
			coords = vector3(330.45, -601.07, 43.28), heading = 67.64, level = "Upper Pillbox", label = "Pillbox - Main Floor",
		},
		{
			coords = vector3(345.68, -582.34, 28.79), heading = 248.30, level = "Lower Pillbox", label = "Pillbox - Lower Pillbox",
			jobs = {
				["police"] = 0,
				["ambulance"] = 0,
			},
		},
		{
			coords = vector3(341.58, -580.88, 28.79), heading = 70.59, level = "Parking", label = "Pillbox - Parking Facilities",
			jobs = {
				["police"] = 0,
				["ambulance"] = 0,
			},
		},
	},
	
	PillboxRoofTop = {
		{
			coords = vector3(338.52, -583.84, 74.16), heading = 254.13, level = "Rooftop", label = "Pillbox - HeliPad",
			jobs = {
				["police"] = 0,
				["ambulance"] = 2,
			},
		},
		{
			coords = vector3(327.17, -603.87, 43.28), heading = 338.36, level = "Upper Pillbox", label = "Pillbox - Main Floor",
			jobs = {
				["police"] = 0,
				["ambulance"] = 2,
			},
		},
	},	
}
