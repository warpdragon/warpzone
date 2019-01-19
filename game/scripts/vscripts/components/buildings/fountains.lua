-- Required by components/index
function InitModule(fountainModule)
  if fountainModule ~= nil then
    fountainModule:Init()
  end
end

if fountainModule == nil then
	DebugPrint ( '[buildings/fountains] spawning fountains' )
	fountainModule = class({})
end


function fountainModule:Init ()
	DebugPrint ( '[buildings/fountains] initialize' )
	fountainModule = self
	SpawnAirFountain()
	SpawnFireFountain()
	SpawnWaterFountain()
	SpawnEarthFountain()
end

function SpawnAirFountain()
	local pointFountain = Entities:FindByName( nil, "fountain_air"):GetAbsOrigin()
	local unitFountain = CreateUnitByName("npc_dota_air_fountain", pointFountain, true, nil, nil, DOTA_TEAM_GOODGUYS)
	unitFountain:SetRenderColor(244,223,88)
	print ("warp fountain air")
end

function SpawnFireFountain()
	local pointFountain = Entities:FindByName( nil, "fountain_fire"):GetAbsOrigin()
	local unitFountain = CreateUnitByName("npc_dota_fire_fountain", pointFountain, true, nil, nil, DOTA_TEAM_BADGUYS)
	unitFountain:SetRenderColor(255,33,49)
	print ("warp fountain fire")
end

function SpawnWaterFountain()
	local pointFountain = Entities:FindByName( nil, "fountain_water"):GetAbsOrigin()
	local unitFountain = CreateUnitByName("npc_dota_water_fountain", pointFountain, true, nil, nil, DOTA_TEAM_CUSTOM_1)
	unitFountain:SetRenderColor(96,192,255)
	print ("warp fountain water")
end

function SpawnEarthFountain()
	local pointFountain = Entities:FindByName( nil, "fountain_earth"):GetAbsOrigin()
	local unitFountain = CreateUnitByName("npc_dota_earth_fountain", pointFountain, true, nil, nil, DOTA_TEAM_CUSTOM_2)
	unitFountain:SetRenderColor(192,255,96)
	print ("warp fountain earth")
end
