execute if entity @e[type=glow_item_frame,tag=SF_SeedDone,distance=..2] run title @s actionbar [{"text":"The seed has","italic":false,"color":"green"},{"text":" finished growing, ","italic":false,"color":"yellow"},{"text":"you can now harvest it","italic":false,"color":"green"}]
execute if entity @e[type=glow_item_frame,tag=SF_Seed,tag=!SF_SeedDone,distance=..2] run function stardust:visual/seed_status_2
