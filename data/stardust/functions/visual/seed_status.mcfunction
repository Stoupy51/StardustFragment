execute if entity @e[type=minecraft:glow_item_frame,tag=SF_SeedDone,distance=..2] run title @s actionbar [{"text":"The seed has","color":"green"},{"text":" finished growing, ","color":"yellow"},{"text":"you can now harvest it","color":"green"}]
execute if entity @e[type=minecraft:glow_item_frame,tag=SF_Seed,tag=!SF_SeedDone,distance=..2] run function stardust:visual/seed_status_2
