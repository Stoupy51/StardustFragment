
tellraw @s [{"text":"\n[Stardust","color":"aqua"},{"text":"Fragment","color":"dark_aqua"},{"text":" Information]","color":"aqua"}]

tellraw @s [{"text":"Stardust Ore Total Count: ","color":"gray"},{"score":{"name":"StardustOreCount","objective":"StardustFragment_AdvancedStats"},"color":"gold"}]
tellraw @s [{"text":"Awakened Stardust Ore Total Count: ","color":"gray"},{"score":{"name":"AwakenedStardustOreCount","objective":"StardustFragment_AdvancedStats"},"color":"gold"}]
tellraw @s [{"text":"Total Structures Count: ","color":"gray"},{"score":{"name":"StructureCount","objective":"StardustFragment_AdvancedStats"},"color":"gold"}]
tellraw @s [{"text":"Total Grown Seeds Count: ","color":"gray"},{"score":{"name":"GrownSeedsCount","objective":"StardustFragment_AdvancedStats"},"color":"gold"}]

execute store result score Temp StardustFragment_AdvancedStats run scoreboard players get ChunkMarkerCount StardustFragment_AdvancedStats
scoreboard players operation Temp StardustFragment_AdvancedStats *= 5 SimplEnergy_Data
tellraw @s [{"text":"Explored Chunks: ","color":"gray"},{"score":{"name":"Temp","objective":"StardustFragment_AdvancedStats"},"color":"gold"}]

tellraw @s [{"text":"Total Custom Mobs Count: ","color":"gray"},{"score":{"name":"StardustMobsCount","objective":"StardustFragment_AdvancedStats"},"color":"gold"}]
tellraw @s [{"text":"Total Stardust Craft Count: ","color":"gray"},{"score":{"name":"StardustCraftCount","objective":"StardustFragment_AdvancedStats"},"color":"gold"}]
tellraw @s [{"text":"Total Awakened Forge Craft Count: ","color":"gray"},{"score":{"name":"AwakenedForgeCraftCount","objective":"StardustFragment_AdvancedStats"},"color":"gold"}]
tellraw @s [{"text":"Total Ultimate Forge Craft Count: ","color":"gray"},{"score":{"name":"UltimateForgeCraftCount","objective":"StardustFragment_AdvancedStats"},"color":"gold"}]

tellraw @s [{"text":"Ultimate Boss Beaten: ","color":"gray"},{"score":{"name":"UltimateBossBeaten","objective":"StardustFragment_AdvancedStats"},"color":"gold"}]
tellraw @s [{"text":"Stardust Guardian Beaten: ","color":"gray"},{"score":{"name":"StardustGuardianBeaten","objective":"StardustFragment_AdvancedStats"},"color":"gold"}]
tellraw @s [{"text":"Stardust Pillar Beaten: ","color":"gray"},{"score":{"name":"StardustPillarBeaten","objective":"StardustFragment_AdvancedStats"},"color":"gold"}]

scoreboard players reset Temp StardustFragment_AdvancedStats
