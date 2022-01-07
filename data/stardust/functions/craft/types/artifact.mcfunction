#Health Artifacts
	scoreboard players set Temp StardustFragment_Data -1
	execute as @s[tag=!StardustFragment_FoundCraft] if data storage stardust:items all.Crafting[{tag:{StardustFragment_HealthArtifactLv1:1b}}] store result score Temp StardustFragment_Data run data get storage stardust:items all.Crafting[{tag:{StardustFragment_HealthArtifactLv1:1b}}]
	execute if score Temp StardustFragment_Data matches 0 run function stardust:craft/items/artifacts/health_lv2
	scoreboard players set Temp StardustFragment_Data -1
	execute as @s[tag=!StardustFragment_FoundCraft] if data storage stardust:items all.Crafting[{tag:{StardustFragment_HealthArtifactLv2:1b}}] store result score Temp StardustFragment_Data run data get storage stardust:items all.Crafting[{tag:{StardustFragment_HealthArtifactLv2:1b}}]
	execute if score Temp StardustFragment_Data matches 0 run function stardust:craft/items/artifacts/health_lv3
	scoreboard players set Temp StardustFragment_Data -1
	execute as @s[tag=!StardustFragment_FoundCraft] if data storage stardust:items all.Crafting[{tag:{StardustFragment_HealthArtifactLv3:1b}}] store result score Temp StardustFragment_Data run data get storage stardust:items all.Crafting[{tag:{StardustFragment_HealthArtifactLv3:1b}}]
	execute if score Temp StardustFragment_Data matches 0 run function stardust:craft/items/artifacts/health_lvmax

#Damage Artifacts
	scoreboard players set Temp StardustFragment_Data -1
	execute as @s[tag=!StardustFragment_FoundCraft] if data storage stardust:items all.Crafting[{tag:{StardustFragment_DamageArtifactLv1:1b}}] store result score Temp StardustFragment_Data run data get storage stardust:items all.Crafting[{tag:{StardustFragment_DamageArtifactLv1:1b}}]
	execute if score Temp StardustFragment_Data matches 0 run function stardust:craft/items/artifacts/damage_lv2
	scoreboard players set Temp StardustFragment_Data -1
	execute as @s[tag=!StardustFragment_FoundCraft] if data storage stardust:items all.Crafting[{tag:{StardustFragment_DamageArtifactLv2:1b}}] store result score Temp StardustFragment_Data run data get storage stardust:items all.Crafting[{tag:{StardustFragment_DamageArtifactLv2:1b}}]
	execute if score Temp StardustFragment_Data matches 0 run function stardust:craft/items/artifacts/damage_lv3
	scoreboard players set Temp StardustFragment_Data -1
	execute as @s[tag=!StardustFragment_FoundCraft] if data storage stardust:items all.Crafting[{tag:{StardustFragment_DamageArtifactLv3:1b}}] store result score Temp StardustFragment_Data run data get storage stardust:items all.Crafting[{tag:{StardustFragment_DamageArtifactLv3:1b}}]
	execute if score Temp StardustFragment_Data matches 0 run function stardust:craft/items/artifacts/damage_lvmax

#Speed Artifacts
	scoreboard players set Temp StardustFragment_Data -1
	execute as @s[tag=!StardustFragment_FoundCraft] if data storage stardust:items all.Crafting[{tag:{StardustFragment_SpeedArtifactLv1:1b}}] store result score Temp StardustFragment_Data run data get storage stardust:items all.Crafting[{tag:{StardustFragment_SpeedArtifactLv1:1b}}]
	execute if score Temp StardustFragment_Data matches 0 run function stardust:craft/items/artifacts/speed_lv2
	scoreboard players set Temp StardustFragment_Data -1
	execute as @s[tag=!StardustFragment_FoundCraft] if data storage stardust:items all.Crafting[{tag:{StardustFragment_SpeedArtifactLv2:1b}}] store result score Temp StardustFragment_Data run data get storage stardust:items all.Crafting[{tag:{StardustFragment_SpeedArtifactLv2:1b}}]
	execute if score Temp StardustFragment_Data matches 0 run function stardust:craft/items/artifacts/speed_lv3
	scoreboard players set Temp StardustFragment_Data -1
	execute as @s[tag=!StardustFragment_FoundCraft] if data storage stardust:items all.Crafting[{tag:{StardustFragment_SpeedArtifactLv3:1b}}] store result score Temp StardustFragment_Data run data get storage stardust:items all.Crafting[{tag:{StardustFragment_SpeedArtifactLv3:1b}}]
	execute if score Temp StardustFragment_Data matches 0 run function stardust:craft/items/artifacts/speed_lvmax

#No Craft Found
	#execute as @s[tag=!StardustFragment_FoundCraft] unless data storage stardust:items all.Crafting[{Slot:16b,tag:{StardustFragment_StardustArtifact:1b}}] run function stardust:craft/no_craft_found
