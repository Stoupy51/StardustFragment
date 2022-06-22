
advancement grant @s only stardust:visible/stuff/life_crystal
advancement revoke @s only stardust:use/life_crystal
scoreboard players add @s stardust.life_crystals 1

attribute @s[scores={stardust.life_crystals=1..20}] minecraft:generic.max_health modifier remove 2013-0-0-0-0
function stardust:utils/update_health

tellraw @s[scores={stardust.life_crystals=21..}] [{"text":"You have collected enough life crystals to use them!","color":"green"}]
advancement grant @s[scores={stardust.life_crystals=20..}] only stardust:visible/stuff/life_crystal_max
