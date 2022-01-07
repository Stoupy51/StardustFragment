#Health Artifacts
	scoreboard players set Temp SF_Data -1
	execute as @s[tag=!SF_FoundCraft] if data storage stardust:items all.Crafting[{tag:{SF_HealthArtifactLv1:1b}}] store result score Temp SF_Data run data get storage stardust:items all.Crafting[{tag:{SF_HealthArtifactLv1:1b}}]
	execute if score Temp SF_Data matches 0 run function stardust:craft/items/artifacts/health_lv2
	scoreboard players set Temp SF_Data -1
	execute as @s[tag=!SF_FoundCraft] if data storage stardust:items all.Crafting[{tag:{SF_HealthArtifactLv2:1b}}] store result score Temp SF_Data run data get storage stardust:items all.Crafting[{tag:{SF_HealthArtifactLv2:1b}}]
	execute if score Temp SF_Data matches 0 run function stardust:craft/items/artifacts/health_lv3
	scoreboard players set Temp SF_Data -1
	execute as @s[tag=!SF_FoundCraft] if data storage stardust:items all.Crafting[{tag:{SF_HealthArtifactLv3:1b}}] store result score Temp SF_Data run data get storage stardust:items all.Crafting[{tag:{SF_HealthArtifactLv3:1b}}]
	execute if score Temp SF_Data matches 0 run function stardust:craft/items/artifacts/health_lvmax

#Damage Artifacts
	scoreboard players set Temp SF_Data -1
	execute as @s[tag=!SF_FoundCraft] if data storage stardust:items all.Crafting[{tag:{SF_DamageArtifactLv1:1b}}] store result score Temp SF_Data run data get storage stardust:items all.Crafting[{tag:{SF_DamageArtifactLv1:1b}}]
	execute if score Temp SF_Data matches 0 run function stardust:craft/items/artifacts/damage_lv2
	scoreboard players set Temp SF_Data -1
	execute as @s[tag=!SF_FoundCraft] if data storage stardust:items all.Crafting[{tag:{SF_DamageArtifactLv2:1b}}] store result score Temp SF_Data run data get storage stardust:items all.Crafting[{tag:{SF_DamageArtifactLv2:1b}}]
	execute if score Temp SF_Data matches 0 run function stardust:craft/items/artifacts/damage_lv3
	scoreboard players set Temp SF_Data -1
	execute as @s[tag=!SF_FoundCraft] if data storage stardust:items all.Crafting[{tag:{SF_DamageArtifactLv3:1b}}] store result score Temp SF_Data run data get storage stardust:items all.Crafting[{tag:{SF_DamageArtifactLv3:1b}}]
	execute if score Temp SF_Data matches 0 run function stardust:craft/items/artifacts/damage_lvmax

#Speed Artifacts
	scoreboard players set Temp SF_Data -1
	execute as @s[tag=!SF_FoundCraft] if data storage stardust:items all.Crafting[{tag:{SF_SpeedArtifactLv1:1b}}] store result score Temp SF_Data run data get storage stardust:items all.Crafting[{tag:{SF_SpeedArtifactLv1:1b}}]
	execute if score Temp SF_Data matches 0 run function stardust:craft/items/artifacts/speed_lv2
	scoreboard players set Temp SF_Data -1
	execute as @s[tag=!SF_FoundCraft] if data storage stardust:items all.Crafting[{tag:{SF_SpeedArtifactLv2:1b}}] store result score Temp SF_Data run data get storage stardust:items all.Crafting[{tag:{SF_SpeedArtifactLv2:1b}}]
	execute if score Temp SF_Data matches 0 run function stardust:craft/items/artifacts/speed_lv3
	scoreboard players set Temp SF_Data -1
	execute as @s[tag=!SF_FoundCraft] if data storage stardust:items all.Crafting[{tag:{SF_SpeedArtifactLv3:1b}}] store result score Temp SF_Data run data get storage stardust:items all.Crafting[{tag:{SF_SpeedArtifactLv3:1b}}]
	execute if score Temp SF_Data matches 0 run function stardust:craft/items/artifacts/speed_lvmax

#No Craft Found
	#execute as @s[tag=!SF_FoundCraft] unless data storage stardust:items all.Crafting[{Slot:16b,tag:{SF_StardustArtifact:1b}}] run function stardust:craft/no_craft_found
