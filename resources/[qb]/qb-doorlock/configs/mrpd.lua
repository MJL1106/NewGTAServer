

-- -1603817716 created by MJL
Config.DoorList['MRPD-BackGate'] = {
    objCoords = vec3(488.894806, -1017.211975, 27.149349),
    authorizedJobs = { ['police'] = 0 },
    objName = -1603817716,
    doorType = 'sliding',
    fixText = false,
    objYaw = 90.0,
    doorRate = 1.0,
    distance = 5,
    doorLabel = 'Back Gate',
    locked = true,
}

-- -692649124 created by MJL
Config.DoorList['MRPD-BackDD'] = {
    doorType = 'double',
    doors = {
        {objName = -692649124, objYaw = 180.00001525879, objCoords = vec3(469.774261, -1014.406006, 26.483816)},
        {objName = -692649124, objYaw = 0.0, objCoords = vec3(467.368622, -1014.406006, 26.483816)}
    },
    locked = true,
    doorRate = 1.0,
    distance = 5,
    doorLabel = 'Back Double Door',
    authorizedJobs = { ['police'] = 0 },
}

-- 149284793 created by MJL
Config.DoorList['MRPD-ProcessingDD'] = {
    doorType = 'double',
    doors = {
        {objName = 149284793, objYaw = 89.999977111816, objCoords = vec3(471.375824, -1010.197876, 26.405483)},
        {objName = 149284793, objYaw = 270.19003295898, objCoords = vec3(471.367859, -1007.793396, 26.405483)}
    },
    locked = true,
    doorRate = 1.0,
    distance = 2,
    doorLabel = 'Processing DD',
    authorizedJobs = { ['police'] = 0 },
}

-- -53345114 created by MJL
Config.DoorList['MRPD--CellEntrance'] = {
    objCoords = vec3(476.615692, -1008.875427, 26.480055),
    authorizedJobs = { ['police'] = 0 },
    objName = -53345114,
    doorType = 'door',
    fixText = false,
    objYaw = 270.13998413086,
    doorRate = 1.0,
    distance = 1.0,
    doorLabel = 'Cells Entrance',
    locked = true,
}

-- 149284793 created by MJL
Config.DoorList['MRPD-interrogation'] = {
    doorType = 'double',
    doorRate = 1.0,
    doorLabel = 'Interrogation',
    doors = {
        {objName = 149284793, objYaw = 180.00001525879, objCoords = vec3(482.068573, -997.909973, 26.406504)},
        {objName = 149284793, objYaw = 0.0, objCoords = vec3(479.663757, -997.909973, 26.406504)}
    },
    authorizedJobs = { ['police'] = 0 },
    locked = true,
    distance = 2,
}

-- 149284793 created by MJL
Config.DoorList['MRPD-Intteroback'] = {
    doorLabel = 'InterrogationBack',
    doorRate = 1.0,
    doorType = 'double',
    doors = {
        {objName = 149284793, objYaw = 270.00003051758, objCoords = vec3(479.062408, -985.032349, 26.405483)},
        {objName = 149284793, objYaw = 89.999977111816, objCoords = vec3(479.062408, -987.437561, 26.405483)}
    },
    authorizedJobs = { ['police'] = 0 },
    distance = 2,
    locked = true,
}

-- -692649124 created by MJL
Config.DoorList['MRPD--Evidence'] = {
    doorRate = 1.0,
    objName = -692649124,
    distance = 2,
    fixText = false,
    doorLabel = 'Evidence',
    objYaw = 134.97177124023,
    objCoords = vec3(475.832336, -990.483948, 26.405483),
    authorizedJobs = { ['police'] = 0 },
    locked = true,
    doorType = 'door',
}

-- 149284793 created by MJL
Config.DoorList['MRPD-Identi'] = {
    distance = 2,
    doorType = 'door',
    doorLabel = 'Identificaiton',
    authorizedJobs = { ['police'] = 0 },
    objCoords = vec3(478.289154, -997.910095, 26.405483),
    objYaw = 180.00001525879,
    fixText = false,
    objName = 149284793,
    locked = true,
    doorRate = 1.0,
}

-- -96679321 created by MJL
Config.DoorList['MRPD--lower1'] = {
    authorizedJobs = { ['police'] = 0 },
    distance = 2,
    doors = {
        {objName = -96679321, objYaw = 270.00003051758, objCoords = vec3(471.375305, -987.437378, 26.405483)},
        {objName = -1406685646, objYaw = 270.00003051758, objCoords = vec3(471.375305, -985.031921, 26.405483)}
    },
    doorType = 'double',
    doorLabel = 'Lower1',
    locked = true,
    doorRate = 1.0,
}

-- -288803980 created by MJL
Config.DoorList['MRPD--lower2'] = {
    doors = {
        {objName = -288803980, objYaw = 0.0, objCoords = vec3(467.522217, -1000.543701, 26.405483)},
        {objName = -288803980, objYaw = 180.00001525879, objCoords = vec3(469.927368, -1000.543701, 26.405483)}
    },
    doorLabel = 'Lower2',
    distance = 2,
    doorRate = 1.0,
    locked = true,
    doorType = 'double',
    authorizedJobs = { ['police'] = 0 },
}

-- 1830360419 created by MJL
Config.DoorList['MRPD-GargeToCells1'] = {
    fixText = false,
    objName = 1830360419,
    doorType = 'door',
    authorizedJobs = { ['police'] = 0 },
    doorLabel = 'GarageToCells1',
    objYaw = 89.870010375977,
    doorRate = 1.0,
    objCoords = vec3(464.156555, -997.509277, 26.370705),
    locked = true,
    distance = 2,
}

-- 1830360419 created by MJL
Config.DoorList['MRPD-GtCell2'] = {
    objName = 1830360419,
    doorLabel = 'GtoCells2',
    authorizedJobs = { ['police'] = 0 },
    distance = 2,
    locked = true,
    doorType = 'door',
    objYaw = 269.79000854492,
    fixText = false,
    objCoords = vec3(464.159058, -974.665588, 26.370705),
    doorRate = 1.0,
}

-- 2130672747 created by MJL
Config.DoorList['MRPD-Garage1'] = {
    objName = 2130672747,
    doorLabel = 'Garage1',
    authorizedJobs = { ['police'] = 0 },
    distance = 7,
    locked = true,
    doorType = 'sliding',
    objYaw = 0.0,
    fixText = false,
    objCoords = vec3(452.300507, -1000.771667, 26.696609),
    doorRate = 1.0,
}

-- 2130672747 created by MJL
Config.DoorList['MRPD-Garage2'] = {
    locked = true,
    objCoords = vec3(431.411926, -1000.771667, 26.696609),
    doorType = 'sliding',
    objName = 2130672747,
    doorRate = 1.0,
    objYaw = 0.0,
    distance = 7,
    fixText = false,
    authorizedJobs = { ['police'] = 0 },
    doorLabel = 'Garage2',
}

-- -1406685646 created by MJL
Config.DoorList['MRPD--Lobby1'] = {
    locked = true,
    objCoords = vec3(440.520081, -977.601074, 30.823193),
    doorType = 'door',
    objName = -1406685646,
    doorRate = 1.0,
    objYaw = 0.0,
    distance = 2,
    fixText = false,
    authorizedJobs = { ['police'] = 0 },
    doorLabel = 'Lobby1',
}

-- -1406685646 created by MJL
Config.DoorList['MRPD--lobby2'] = {
    fixText = false,
    authorizedJobs = { ['police'] = 0 },
    doorRate = 1.0,
    doorType = 'door',
    objName = -96679321,
    distance = 2,
    objYaw = 180.00001525879,
    locked = true,
    objCoords = vec3(440.520081, -986.233459, 30.823193),
    doorLabel = 'Lobby2',
}

-- -288803980 created by MJL
Config.DoorList['MRPD--PressRoom'] = {
    distance = 2,
    authorizedJobs = { ['police'] = 0 },
    doorRate = 1.0,
    locked = true,
    doors = {
        {objName = -288803980, objYaw = 270.00003051758, objCoords = vec3(438.197083, -993.911255, 30.823193)},
        {objName = -288803980, objYaw = 89.999977111816, objCoords = vec3(438.197083, -996.316650, 30.823193)}
    },
    doorType = 'double',
    doorLabel = 'PressRoom',
}

-- -1547307588 created by MJL
Config.DoorList['MRPD--OuterDoorParking'] = {
    distance = 2,
    authorizedJobs = { ['police'] = 0 },
    doorRate = 1.0,
    locked = true,
    doors = {
        {objName = -1547307588, objYaw = 0.0, objCoords = vec3(440.739197, -998.746216, 30.815304)},
        {objName = -1547307588, objYaw = 180.00001525879, objCoords = vec3(443.061768, -998.746216, 30.815304)}
    },
    doorType = 'double',
    doorLabel = 'OuterDoorParking',
}

-- -1547307588 created by MJL
Config.DoorList['MRPD--OuterDoor2'] = {
    locked = true,
    doors = {
        {objName = -1547307588, objYaw = 180.00001525879, objCoords = vec3(458.208740, -972.254272, 30.815308)},
        {objName = -1547307588, objYaw = 0.0, objCoords = vec3(455.886169, -972.254272, 30.815308)}
    },
    authorizedJobs = { ['police'] = 0 },
    doorLabel = 'OuterDoor2',
    distance = 2,
    doorType = 'double',
    doorRate = 1.0,
}

-- -96679321 created by MJL
Config.DoorList['MRPD--CaptainsOffice'] = {
    objCoords = vec3(458.654327, -990.649780, 30.823193),
    authorizedJobs = { ['police'] = 0 },
    objYaw = 270.00003051758,
    doorType = 'door',
    locked = true,
    objName = -96679321,
    fixText = false,
    doorLabel = 'CaptainsOffice',
    doorRate = 1.0,
    distance = 2,
}

-- -288803980 created by MJL
Config.DoorList['MRPD--SeriousCrimes'] = {
    locked = true,
    doors = {
        {objName = -288803980, objYaw = 89.999977111816, objCoords = vec3(469.440613, -987.437683, 30.823193)},
        {objName = -288803980, objYaw = 270.00003051758, objCoords = vec3(469.440613, -985.031311, 30.823193)}
    },
    authorizedJobs = { ['police'] = 0 },
    doorLabel = 'SeriousCrimes',
    distance = 2,
    doorType = 'double',
    doorRate = 1.0,
}

-- -96679321 created by MJL
Config.DoorList['MRPD--BriefRoom'] = {
    doorRate = 1.0,
    authorizedJobs = { ['police'] = 0 },
    locked = true,
    doorType = 'double',
    doorLabel = 'BriefRoom',
    distance = 2,
    doors = {
        {objName = -96679321, objYaw = 180.00001525879, objCoords = vec3(472.977692, -989.824707, 30.823193)},
        {objName = -1406685646, objYaw = 180.00001525879, objCoords = vec3(475.383698, -989.824707, 30.823193)}
    },
}

-- -96679321 created by MJL
Config.DoorList['MRPD--LAb'] = {
    doorType = 'double',
    locked = true,
    doorLabel = 'LAb',
    distance = 2,
    authorizedJobs = { ['police'] = 0 },
    doors = {
        {objName = -96679321, objYaw = 270.00003051758, objCoords = vec3(479.753387, -988.620361, 30.823193)},
        {objName = -1406685646, objYaw = 270.00003051758, objCoords = vec3(479.753387, -986.215088, 30.823193)}
    },
    doorRate = 1.0,
}

-- -692649124 created by MJL
Config.DoorList['MRPD--Armory'] = {
    doorType = 'door',
    locked = true,
    doorLabel = 'Armory',
    fixText = false,
    authorizedJobs = { ['police'] = 0 },
    objCoords = vec3(479.750732, -999.629028, 30.789167),
    doorRate = 1.0,
    objYaw = 89.999977111816,
    objName = -692649124,
    distance = 2,
}

-- -1406685646 created by MJL
Config.DoorList['MRPD--BriefSingle'] = {
    doorType = 'door',
    locked = true,
    doorLabel = 'BriefSingle',
    fixText = false,
    authorizedJobs = { ['police'] = 0 },
    objCoords = vec3(476.751160, -999.630676, 30.823193),
    doorRate = 1.0,
    objYaw = 89.999977111816,
    objName = -1406685646,
    distance = 2,
}

-- -692649124 created by MJL
Config.DoorList['MRPD--Armory2'] = {
    locked = true,
    fixText = false,
    objCoords = vec3(487.437836, -1000.189270, 30.786972),
    doorLabel = 'Armory2',
    objName = -692649124,
    distance = 2,
    doorType = 'door',
    authorizedJobs = { ['police'] = 0 },
    doorRate = 1.0,
    objYaw = 181.28001403809,
}

-- -692649124 created by MJL
Config.DoorList['MRPD--ShootingRange'] = {
    distance = 2,
    locked = true,
    doorType = 'double',
    doors = {
        {objName = -692649124, objYaw = 0.0, objCoords = vec3(485.613342, -1002.901978, 30.786972)},
        {objName = -692649124, objYaw = 180.00001525879, objCoords = vec3(488.018433, -1002.901978, 30.786972)}
    },
    doorRate = 1.0,
    authorizedJobs = { ['police'] = 0 },
    doorLabel = 'ShootingRange',
}

-- -96679321 created by MJL
Config.DoorList['MRPD--Interview1'] = {
    locked = true,
    fixText = false,
    objYaw = 0.0,
    objName = -96679321,
    distance = 2,
    doorRate = 1.0,
    objCoords = vec3(459.945404, -990.705322, 35.103981),
    doorType = 'door',
    authorizedJobs = { ['police'] = 0 },
    doorLabel = 'Interview1',
}

-- -96679321 created by MJL
Config.DoorList['MRPD--Interview2'] = {
    authorizedJobs = { ['police'] = 0 },
    objCoords = vec3(459.945404, -981.074158, 35.103981),
    doorRate = 1.0,
    doorType = 'door',
    doorLabel = 'Interview2',
    objYaw = 180.00001525879,
    fixText = false,
    objName = -1406685646,
    locked = true,
    distance = 2,
}

-- -96679321 created by MJL
Config.DoorList['MRPD--Meeting1'] = {
    objCoords = vec3(448.986816, -981.578491, 35.103764),
    locked = true,
    distance = 2,
    doorRate = 1.0,
    objYaw = 134.97177124023,
    doorType = 'door',
    authorizedJobs = { ['police'] = 0 },
    fixText = false,
    objName = -96679321,
    doorLabel = 'Meeting1',
}

-- -1406685646 created by MJL
Config.DoorList['MRPD--Meeting2'] = {
    objCoords = vec3(448.986816, -990.200745, 35.103764),
    locked = true,
    distance = 2,
    doorRate = 1.0,
    objYaw = 45.028198242188,
    doorType = 'door',
    authorizedJobs = { ['police'] = 0 },
    fixText = false,
    objName = -1406685646,
    doorLabel = 'Meeting2',
}

-- -96679321 created by MJL
Config.DoorList['MRPD--Dispatch'] = {
    authorizedJobs = { ['police'] = 0 },
    distance = 2,
    locked = true,
    doorType = 'door',
    objCoords = vec3(448.984558, -995.526367, 35.103764),
    doorLabel = 'Dispatch',
    objYaw = 134.97177124023,
    fixText = false,
    doorRate = 1.0,
    objName = -96679321,
}

-- -692649124 created by MJL
Config.DoorList['MRPD--Helipad'] = {
    authorizedJobs = { ['police'] = 0 },
    distance = 2,
    locked = true,
    doorType = 'door',
    objCoords = vec3(464.308563, -984.528442, 43.771240),
    doorLabel = 'Helipad',
    objYaw = 89.999977111816,
    fixText = false,
    doorRate = 1.0,
    objName = -692649124,
}

-- -53345114 created by MJL
Config.DoorList['MRPD--CellDoor1'] = {
    objName = -53345114,
    doorType = 'door',
    fixText = false,
    locked = true,
    authorizedJobs = { ['police'] = 0 },
    objCoords = vec3(477.912598, -1012.188660, 26.480055),
    objYaw = 0.0,
    distance = 1.0,
    doorRate = 1.0,
    doorLabel = 'CellDoor1',
}

-- -53345114 created by MJL
Config.DoorList['MRPD--CellDoor2'] = {
    doorType = 'door',
    locked = true,
    distance = 1.0,
    doorLabel = 'CellDoor2',
    doorRate = 1.0,
    fixText = false,
    objName = -53345114,
    objCoords = vec3(480.912811, -1012.188660, 26.480055),
    authorizedJobs = { ['police'] = 0 },
    objYaw = 0.0,
}

-- -53345114 created by MJL
Config.DoorList['MRPD--CellDoor3'] = {
    locked = true,
    distance = 1.0,
    fixText = false,
    doorRate = 1.0,
    doorType = 'door',
    authorizedJobs = { ['police'] = 0 },
    objCoords = vec3(483.912720, -1012.188660, 26.480055),
    objYaw = 0.0,
    objName = -53345114,
    doorLabel = 'CellDoor3',
}

-- -53345114 created by MJL
Config.DoorList['MRPD--CellDoor4'] = {
    doorLabel = 'CellDoor4',
    fixText = false,
    distance = 1.0,
    objName = -53345114,
    locked = true,
    authorizedJobs = { ['police'] = 0 },
    objCoords = vec3(486.913116, -1012.188660, 26.480055),
    doorType = 'door',
    objYaw = 0.0,
    doorRate = 1.0,
}

-- -53345114 created by MJL
Config.DoorList['MRPD--CellDoor5'] = {
    doorRate = 1.0,
    doorType = 'door',
    objYaw = 180.00001525879,
    fixText = false,
    objCoords = vec3(484.176422, -1007.734375, 26.480055),
    distance = 1.0,
    locked = true,
    authorizedJobs = { ['police'] = 0 },
    doorLabel = 'CellDoor5',
    objName = -53345114,
}

-- -53345114 created by MJL
Config.DoorList['MRPD--CellExit'] = {
    fixText = false,
    objName = -53345114,
    authorizedJobs = { ['police'] = 0 },
    objYaw = 180.00001525879,
    doorLabel = 'CellExit',
    doorType = 'door',
    objCoords = vec3(481.008362, -1004.117981, 26.480055),
    distance = 1.0,
    locked = true,
    doorRate = 1.0,
}

-- -1406685646 created by MJL
Config.DoorList['MRPD--InterroRoom2'] = {
    fixText = false,
    objName = -1406685646,
    authorizedJobs = { ['police'] = 0 },
    objYaw = 270.00003051758,
    doorLabel = 'InterroRoom2',
    doorType = 'door',
    objCoords = vec3(482.670258, -995.728516, 26.405483),
    distance = 2,
    locked = true,
    doorRate = 1.0,
}

-- -1406685646 created by MJL
Config.DoorList['MRPD--ObservRoom2'] = {
    doorLabel = 'ObservRoom2',
    authorizedJobs = { ['police'] = 0 },
    locked = true,
    fixText = false,
    distance = 2,
    doorRate = 1.0,
    objYaw = 270.00003051758,
    doorType = 'door',
    objCoords = vec3(482.669922, -992.299133, 26.405483),
    objName = -1406685646,
}

-- -1406685646 created by MJL
Config.DoorList['MRPD--InterroRoom1'] = {
    locked = true,
    objName = -1406685646,
    doorType = 'door',
    fixText = false,
    objYaw = 270.00003051758,
    objCoords = vec3(482.670135, -987.579163, 26.405483),
    doorLabel = 'InterroRoom1',
    distance = 2,
    doorRate = 1.0,
    authorizedJobs = { ['police'] = 0 },
}

-- -1406685646 created by MJL
Config.DoorList['MRPD--ObserveRoom2'] = {
    doorRate = 1.0,
    objCoords = vec3(482.669434, -983.986816, 26.405483),
    locked = true,
    authorizedJobs = { ['police'] = 0 },
    fixText = false,
    distance = 2,
    doorLabel = 'ObserveRoom2',
    objYaw = 270.00003051758,
    doorType = 'door',
    objName = -1406685646,
}

-- -1635161509 created by MJL
Config.DoorList['MRPD--BollardsRight'] = {
    distance = 4,
    objYaw = 270.0,
    fixText = false,
    doorLabel = 'BollardsRight',
    objCoords = vec3(410.025787, -1028.318970, 28.418146),
    doorRate = 1.0,
    objName = -1635161509,
    doorType = 'sliding',
    locked = true,
    authorizedJobs = { ['police'] = 0 },
}

-- -1868050792 created by MJL
Config.DoorList['MRPD--1868050792'] = {
    objYaw = 269.99862670898,
    doorLabel = 'BollardLeft',
    fixText = false,
    distance = 4,
    objCoords = vec3(410.025787, -1020.156555, 28.401999),
    authorizedJobs = { ['police'] = 0 },
    objName = -1868050792,
    doorType = 'sliding',
    locked = true,
    doorRate = 1.0,
}