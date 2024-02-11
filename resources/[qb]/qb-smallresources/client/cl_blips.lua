  local blips = {
  

  {title="Vanilla Unicorn", colour=8, id=121, scale = 0.6, x = 128.70, y = -1298.43, z = 29.23}, -- Vanilla Unicorn
  --{title="City Hall", colour=25, id=438, scale = 0.8, x = -541.94, y = -210.19, z = 37.64}, -- City Hall
 -- {title="Court", colour=37, id=89, scale = 0.8, x = 243.46, y = -1092.3, z = 29.29}, -- Court
  {title="Billiard Club", colour=9, id=490, scale = 0.6, x = -1596.9, y = -991.28, z = 13.08}, -- Park Ranger
  {title="Medicine Delivery", colour=47, id=51, scale = 0.6, x = 68.68, y = -1569.61, z = 29.6}, -- Park Ranger
  --{title="Movie Theater", colour=2, id=790, scale = 1.0, x = 337.21, y = 185.17, z = 103.0}, -- Park Ranger
  --{title="Fish Sales", colour=3, id=304, scale = 0.7, x = -1847.46, y = -1191.5, z = 14.14}, -- Fish Sales
  --{title="Hunting Sales", colour=3, id=442, scale = 0.7, x = 569.32, y = 2796.66, z = 14.14}, -- Hunting Sales
  --{title="The Gallery", colour=18, id=617, scale = 0.6, x = -424.27, y = 22.29, z = 46.27}, -- The Gallery
  --{title="Driving School", colour=44, id=380, scale = 0.6, x = -37.73, y = -205.63, z = 45.78}, -- Driving School
  --{title="Vespucci Arcade", colour=61, id=484, scale = 0.7, x = -1651.37, y = -1082.33, z = 13.15}, -- Vespucci Arcade
  --{title="Bobcat Security", colour=2, id=498, scale = 0.7, x = 880.89, y = -2258.30, z = 32.53}, -- Bobcat Security
  ---{title="Burger Shot", colour=8, id=106, scale = 0.7, x = 133.08, y = -1462.69, z = 29.35}, -- Burger Shot
  --{title="Downtown Cab Co.", colour=5, id=56, scale = 0.7, x = 906.43, y = -175.15, z = 74.08}, -- Downtown Cab Co.
 -- {title="Tuner Shop", colour=7, id=326, scale = 0.7, x = 155.79, y = -3031.23, z = 7.04}, -- Tuner Shop

}





Citizen.CreateThread(function()
      for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, info.scale)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	    BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)