
execute as @a[distance=..200] at @e[limit=2] run loot give @s loot stardust:i/stardust_dungeon_key
execute as @a[distance=..200] at @e[limit=4] run loot give @s loot stardust:i/stardust_essence

tellraw @a[distance=..200] ["",{"text":"[Stardust","italic":false,"color":"dark_aqua"},{"text":"Fragment]","italic":false,"color":"aqua"},{"text":" The Stardust Pillar has been defeated."}]
execute as @a[distance=..200] at @s run playsound stardust:stardust_pillar_death master @s
scoreboard players remove #stardust_pillar stardust.data 1
kill @s
