Config = {}

Config.Translation = function(source, name, reason)
    return source.. " " ..name..'~s~ \nREASON: ~r~'..reason;
end

Config.Reasons = {
    ['timed out'] = 'Timed Out',
    ['crash'] = 'Crashed',
    ['Exiting'] = 'Exited',
    ['Disconnected.'] = 'Disconnected',
}
