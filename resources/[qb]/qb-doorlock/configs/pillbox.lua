

-- pb1 created by Otaku Sensei
Config.DoorList['pillbox-pb1'] = {
    authorizedJobs = { ['ambulance'] = 0, ['police'] = 0 },
    doorRate = 1.0,
    doorType = 'double',
    doors = {
        {objName = -1700911976, objYaw = 160.00003051758, objCoords = vec3(316.065704, -578.347718, 43.433910)},
        {objName = -434783486, objYaw = 160.00003051758, objCoords = vec3(318.484680, -579.228150, 43.433910)}
    },
    locked = false,
    distance = 1.5,
    doorLabel = 'pbi1',
}

-- pb9 created by Otaku Sensei
Config.DoorList['pillbox-pb9'] = {
    objYaw = 249.98275756836,
    authorizedJobs = { ['ambulance'] = 0 },
    doorLabel = 'pb9',
    locked = true,
    objName = 854291622,
    distance = 2,
    doorType = 'door',
    objCoords = vec3(313.480072, -595.458312, 43.433910),
    fixText = false,
    doorRate = 1.0,
}

-- -434783486 created by MJL
Config.DoorList['pillbox--MainHall'] = {
    doors = {
        {objName = -434783486, objYaw = 249.98275756836, objCoords = vec3(328.136444, -592.776062, 43.433910)},
        {objName = -1700911976, objYaw = 249.98275756836, objCoords = vec3(327.256012, -595.195007, 43.433910)}
    },
    authorizedJobs = { ['ambulance'] = 0 },
    doorType = 'double',
    doorRate = 1.0,
    doorLabel = 'MainHall',
    distance = 2,
    locked = true,
}

-- -434783486 created by MJL
Config.DoorList['pillbox--WardB'] = {
    authorizedJobs = { ['ambulance'] = 0 },
    doorLabel = 'WardB',
    doorType = 'double',
    locked = true,
    doors = {
        {objName = -434783486, objYaw = 340.00003051758, objCoords = vec3(324.236023, -589.226196, 43.433910)},
        {objName = -1700911976, objYaw = 340.00003051758, objCoords = vec3(326.654999, -590.106628, 43.433910)}
    },
    doorRate = 1.0,
    distance = 2,
}

-- -1700911976 created by MJL
Config.DoorList['pillbox--WardBB'] = {
    authorizedJobs = { ['ambulance'] = 0 },
    doorLabel = 'WardB',
    doorType = 'double',
    locked = true,
    doors = {
        {objName = -1700911976, objYaw = 249.98275756836, objCoords = vec3(325.669464, -580.459595, 43.433910)},
        {objName = -434783486, objYaw = 249.98275756836, objCoords = vec3(326.549896, -578.040649, 43.433910)}
    },
    doorRate = 1.0,
    distance = 2,
}

-- -434783486 created by MJL
Config.DoorList['pillbox--Surgery1'] = {
    doors = {
        {objName = -434783486, objYaw = 340.00003051758, objCoords = vec3(317.842560, -573.465881, 43.433910)},
        {objName = -1700911976, objYaw = 340.00003051758, objCoords = vec3(320.261536, -574.346313, 43.433910)}
    },
    doorLabel = 'Surgery1',
    doorType = 'double',
    distance = 2,
    doorRate = 1.0,
    authorizedJobs = { ['ambulance'] = 0 },
    locked = true,
}

-- -434783486 created by MJL
Config.DoorList['pillbox--434783486'] = {
    locked = true,
    doorLabel = 'Surgery2',
    authorizedJobs = { ['ambulance'] = 0 },
    doors = {
        {objName = -434783486, objYaw = 340.00003051758, objCoords = vec3(323.237549, -575.429443, 43.433910)},
        {objName = -1700911976, objYaw = 340.00003051758, objCoords = vec3(325.656525, -576.309937, 43.433910)}
    },
    doorType = 'double',
    doorRate = 1.0,
    distance = 2,
}

-- 854291622 created by MJL
Config.DoorList['pillbox-854291622'] = {
    doorLabel = 'Surgery2',
    authorizedJobs = { ['ambulance'] = 0 },
    objYaw = 340.00003051758,
    doorType = 'door',
    objName = 854291622,
    locked = true,
    objCoords = vec3(339.004974, -586.703369, 43.433910),
    fixText = false,
    doorRate = 1.0,
    distance = 2,
}