
advancement grant @s only stardust:visible/stuff/life_crystal
advancement revoke @s only stardust:use/life_crystal
execute unless score LifeCrystalDisabled stardust.config matches 1 run scoreboard players add @s stardust.life_crystals 1

attribute @s[scores={stardust.life_crystals=1..20}] generic.max_health modifier remove 2013-0-0-0-0
execute unless score LifeCrystalDisabled stardust.config matches 1 run function stardust:utils/update_health

execute if score LifeCrystalDisabled stardust.config matches 1 run playsound entity.villager.no ambient @s
execute if score LifeCrystalDisabled stardust.config matches 1 run tellraw @s {"text":"Stardust Fragment Warning: Life Crystals are disabled on this server.","color":"gold"}
execute unless score LifeCrystalDisabled stardust.config matches 1 run tellraw @s[scores={stardust.life_crystals=21..}] [{"text":"You have collected enough life crystals that you can no longer use them!","color":"green"}]
advancement grant @s[scores={stardust.life_crystals=20..}] only stardust:visible/stuff/life_crystal_max
