-- This is the entry-point to your game mode and should be used primarily to precache models/particles/sounds/etc

GAME_VERSION = "0.1"

require('internal/logging')

CustomNetTables:SetTableValue("info", "version", { value = GAME_VERSION })
local mode = ""
if IsInToolsMode() then
  mode = "Tools Mode"
elseif GameRules:IsCheatMode() then
  mode = "Cheat Mode"
end
CustomNetTables:SetTableValue("info", "mode", { value = mode })
CustomNetTables:SetTableValue("info", "datetime", { value = GetSystemDate() .. " " .. GetSystemTime() })

require('internal/vconsole')
require('internal/eventwrapper')
require('internal/util')
require('gamemode')
require('precache')
require('libraries/keyvalues')

function Precache( context )

  for _,Item in pairs( g_ItemPrecache ) do
    PrecacheItemByNameAsync( Item, function( item ) end )
  end

   for _,Unit in pairs( g_UnitPrecache ) do
    PrecacheUnitByNameAsync( Unit, function( unit ) end )
  end

   for _,Model in pairs( g_ModelPrecache ) do
    PrecacheResource( "model", Model, context  )
  end

  for _,Particle in pairs( g_ParticlePrecache ) do
    PrecacheResource( "particle", Particle, context  )
  end

  for _,ParticleFolder in pairs( g_ParticleFolderPrecache ) do
    PrecacheResource( "particle_folder", ParticleFolder, context )
  end

  for _,Sound in pairs( g_SoundPrecache ) do
    PrecacheResource( "soundfile", Sound, context )
  end

  local allheroes = LoadKeyValues('scripts/npc/npc_heroes.txt')
  for key,value in pairs(LoadKeyValues('scripts/npc/herolist.txt')) do
    if value == 1 then
      local hero = string.sub(key, 15)
      -- PrecacheResource("particle_folder", "particles/econ/items/" .. hero, context)
      PrecacheResource("model_folder", "particles/heroes/" .. hero, context)
    end
  end
end

function Activate()
  GameRules.GameMode = GameMode()
  GameRules.GameMode:_InitGameMode()
end
