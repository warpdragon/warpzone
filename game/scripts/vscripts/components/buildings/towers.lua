-- Required by components/index
function InitModule(towerModule)
  if towerModule ~= nil then
    towerModule:Init()
  end
end

if towerModule == nil then
	DebugPrint ( '[buildings/towers] spawning towers' )
	towerModule = class({})
end


function towerModule:Init ()
	DebugPrint ( '[buildings/towers] initialize' )
	towerModule = self
	SpawnAirTowers()
	SpawnFireTowers()
	SpawnWaterTowers()
	SpawnEarthTowers()
end

function SpawnAirTowers()
	local point1cc = Entities:FindByName( nil, "tier1_cc_air"):GetAbsOrigin()
	local point1c = Entities:FindByName( nil, "tier1_c_air"):GetAbsOrigin()
	local unit1cc = CreateUnitByName("npc_dota_air_tower1_counter_clockwise", point1cc, true, nil, nil, DOTA_TEAM_GOODGUYS)
	unit1cc:SetRenderColor(244,223,88)
	local unit1c = CreateUnitByName("npc_dota_air_tower1_clockwise", point1c, true, nil, nil, DOTA_TEAM_GOODGUYS)
	unit1c:SetRenderColor(244,223,88)
	print ("warp towers air")
end

function SpawnFireTowers()
	local point1cc = Entities:FindByName( nil, "tier1_cc_fire"):GetAbsOrigin()
	local point1c = Entities:FindByName( nil, "tier1_c_fire"):GetAbsOrigin()
	local unit1cc = CreateUnitByName("npc_dota_air_tower1_counter_clockwise", point1cc, true, nil, nil, DOTA_TEAM_BADGUYS)
	unit1cc:SetRenderColor(255,33,49)
	local unit1c = CreateUnitByName("npc_dota_air_tower1_counter_clockwise", point1c, true, nil, nil, DOTA_TEAM_BADGUYS)
	unit1c:SetRenderColor(255,33,49)
	print ("warp towers fire")
end

function SpawnWaterTowers()
	local point1cc = Entities:FindByName( nil, "tier1_cc_water"):GetAbsOrigin()
	local point1c = Entities:FindByName( nil, "tier1_c_water"):GetAbsOrigin()
	local unit1cc = CreateUnitByName("npc_dota_water_tower1_counter_clockwise", point1cc, true, nil, nil, DOTA_TEAM_CUSTOM_1)
	unit1cc:SetRenderColor(96,192,255)
	local unit1c = CreateUnitByName("npc_dota_water_tower1_clockwise", point1c, true, nil, nil, DOTA_TEAM_CUSTOM_1)
	unit1c:SetRenderColor(96,192,255)
	print ("warp towers water")
end

function SpawnEarthTowers()
	local point1cc = Entities:FindByName( nil, "tier1_cc_earth"):GetAbsOrigin()
	local point1c = Entities:FindByName( nil, "tier1_c_earth"):GetAbsOrigin()
	local unit1cc = CreateUnitByName("npc_dota_earth_tower1_counter_clockwise", point1cc, true, nil, nil, DOTA_TEAM_CUSTOM_2)
	unit1cc:SetRenderColor(192,255,96)
	local unit1c = CreateUnitByName("npc_dota_earth_tower1_clockwise", point1c, true, nil, nil, DOTA_TEAM_CUSTOM_2)
	unit1c:SetRenderColor(192,255,96)
	print ("warp towers earth")
end
