Config = {}


-- Coords for all safezones
Config.zones = {
	{ ['x'] = 300, ['y'] = -589.22, ['z'] = 43.28},
}


Config.showNotification = false -- Show notification when in Safezone?
Config.safezoneMessage = "You are currently in a Safezone" -- Change the message that shows when you are in a safezone
Config.radius = 60 -- Change the RADIUS of the Safezone.
Config.speedlimitinSafezone = 250 -- Set a speed limit in a Safezone (MPH), Set to false to disable


-- Change the color of the notification
Config.notificationstyle = "success"
--Notification Styles
-- inform
-- error
-- success