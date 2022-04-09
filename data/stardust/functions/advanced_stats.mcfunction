
tellraw @s [{"text":"\n[Stardust","color":"aqua"},{"text":"Fragment","color":"dark_aqua"},{"text":" Information]","color":"aqua"}]
tellraw @s [{"text":"Work In Progress","color":"gray"}]

#tellraw @s [{"text":"Stardust Ore Total Count: ","color":"gray"},{"score":{"name":"StardustOreCount","objective":"stardust.advanced_stats"},"color":"gold"}]
#tellraw @s [{"text":"Awakened Stardust Ore Total Count: ","color":"gray"},{"score":{"name":"AwakenedStardustOreCount","objective":"stardust.advanced_stats"},"color":"gold"}]
#tellraw @s [{"text":"Total Structures Count: ","color":"gray"},{"score":{"name":"StructureCount","objective":"stardust.advanced_stats"},"color":"gold"}]
#tellraw @s [{"text":"Total Grown Seeds Count: ","color":"gray"},{"score":{"name":"GrownSeedsCount","objective":"stardust.advanced_stats"},"color":"gold"}]

#execute store result score temp stardust.advanced_stats run scoreboard players get ChunkMarkerCount stardust.advanced_stats
#scoreboard players operation temp stardust.advanced_stats *= #5 simplenergy.data
#tellraw @s [{"text":"Explored Chunks: ","color":"gray"},{"score":{"name":"#temp","objective":"stardust.advanced_stats"},"color":"gold"}]

#tellraw @s [{"text":"Total Custom Mobs Count: ","color":"gray"},{"score":{"name":"StardustMobsCount","objective":"stardust.advanced_stats"},"color":"gold"}]
#tellraw @s [{"text":"Total Stardust Craft Count: ","color":"gray"},{"score":{"name":"StardustCraftCount","objective":"stardust.advanced_stats"},"color":"gold"}]
#tellraw @s [{"text":"Total Awakened Forge Craft Count: ","color":"gray"},{"score":{"name":"AwakenedForgeCraftCount","objective":"stardust.advanced_stats"},"color":"gold"}]
#tellraw @s [{"text":"Total Ultimate Forge Craft Count: ","color":"gray"},{"score":{"name":"UltimateForgeCraftCount","objective":"stardust.advanced_stats"},"color":"gold"}]

#tellraw @s [{"text":"Ultimate Boss Beaten: ","color":"gray"},{"score":{"name":"UltimateBossBeaten","objective":"stardust.advanced_stats"},"color":"gold"}]
#tellraw @s [{"text":"Stardust Guardian Beaten: ","color":"gray"},{"score":{"name":"StardustGuardianBeaten","objective":"stardust.advanced_stats"},"color":"gold"}]
#tellraw @s [{"text":"Stardust Pillar Beaten: ","color":"gray"},{"score":{"name":"StardustPillarBeaten","objective":"stardust.advanced_stats"},"color":"gold"}]

#scoreboard players reset temp stardust.advanced_stats
