local autoexbbmin, autoexbbmax = vec3(517.3389, -226.6246, 49.33173), vec3(553.9767, -164.4719, 60.05186)
if not DoesScenarioBlockingAreaExist(autoexbbmin, autoexbbmax) then
  AddScenarioBlockingArea(autoexbbmin, autoexbbmax, 0, 1, 1, 1)
end
Citizen.CreateThread(function()


RequestIpl("gabz_pillbox_milo_")

	interiorID = GetInteriorAtCoords(311.2546, -592.4204, 42.32737)
	
	
	if IsValidInterior(interiorID) then
		RemoveIpl("rc12b_fixed")
		RemoveIpl("rc12b_destroyed")
		RemoveIpl("rc12b_default")
		RemoveIpl("rc12b_hospitalinterior_lod")
		RemoveIpl("rc12b_hospitalinterior")

	RefreshInterior(interiorID)
	
	end
	
end)
local coords = vec(-1179.292, -891.4589, 13.93344)
local model = `prop_bs_map_door_01`

CreateThread(function()
	CreateModelHide(coords.xyz, 2.0, model, 1)
end)

