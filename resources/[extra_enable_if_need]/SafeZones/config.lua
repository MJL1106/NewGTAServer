Config = {}


-- Coords for all safezones
Config.zones = {
	{ ['x'] = 289.13, ['y'] = -554.21, ['z'] = 43.12}, -- Sandy Shores PD
	{ ['x'] = 264.58, ['y'] = -612.18, ['z'] = 42.43},
	{ ['x'] = -353.33, ['y'] = -640.2, ['z'] = 29.11},
	{ ['x'] = 396.4, ['y'] = -569.22, ['z'] = 28.53},
	{ ['x'] = 409.71, ['y'] = -962.54, ['z'] = 28.98},
	{ ['x'] = 493.73, ['y'] = -1026.47, ['z'] = 27.66},
	{ ['x'] = 406.49, ['y'] = -1034.14, ['z'] = 28.83},
	{ ['x'] = 9.8, ['y'] = -1589.3, ['z'] = 29.24},
	{ ['x'] = -2.39, ['y'] = -1604.35, ['z'] = 29.11},
	{ ['x'] = 12.63, ['y'] = -1617.9, ['z'] = 29.29},
	{ ['x'] = 28.74, ['y'] = -1601.6, ['z'] = 29.39},

}


Config.showNotification = true -- Show notification when in Safezone?
Config.safezoneMessage = "You are currently in a Safezone" -- Change the message that shows when you are in a safezone
Config.radius = 50.0 -- Change the RADIUS of the Safezone.
Config.speedlimitinSafezone = 30 -- Set a speed limit in a Safezone (MPH), Set to false to disable


-- Change the color of the notification
Config.notificationstyle = "success"
--Notification Styles
-- inform
-- error
-- success