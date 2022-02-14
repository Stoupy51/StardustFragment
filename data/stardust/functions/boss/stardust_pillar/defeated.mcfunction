execute as @a[distance=..200] at @e[limit=2] run loot give @s loot stardust:i/stardust_dungeon_key
execute as @a[distance=..200] at @e[limit=4] run loot give @s loot stardust:i/stardust_essence

tellraw @a[distance=..200] ["",{"text":"[Stardust","italic":false,"color":"dark_aqua"},{"text":"Fragment]","italic":false,"color":"aqua"},{"text":" The Stardust Pillar has been defeated."}]
scoreboard players remove StardustPillar StardustFragment_Data 1
kill @s
