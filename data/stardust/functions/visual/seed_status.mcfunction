scoreboard players set Success stardust.data 0
execute if entity @e[type=glow_item_frame,tag=stardust.seed_done,distance=..1] run title @s actionbar [{"text":"The seed has","italic":false,"color":"green"},{"text":" finished growing, ","italic":false,"color":"yellow"},{"text":"you can now harvest it","italic":false,"color":"green"}]
execute if entity @e[type=glow_item_frame,tag=stardust.seed,tag=!stardust.seed_done,distance=..1] run function stardust:visual/seed_status_2
