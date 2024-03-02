Config = {}

Config.Translation = function(source, name, reason)
    return '~b~[~y~'..source..'~b~] ~b~'..name..'~s~ \n~o~REASON~s~: ~r~'..reason;
end

Config.Reasons = {
    ['timed out'] = 'Timed Out',
    ['crash'] = 'Crashed',
    ['Exiting'] = 'Exiting',
    ['Disconnected.'] = 'Disconnected',
}
