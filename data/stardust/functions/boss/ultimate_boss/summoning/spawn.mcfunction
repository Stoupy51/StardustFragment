
#Advancement
advancement grant @a[distance=..200] only stardust:visible/adventure/summon_ultimate_boss
execute if score #ultimate_boss stardust.data matches 1.. run advancement grant @a[distance=..200] only stardust:visible/adventure/multiple_ultimate_boss
scoreboard objectives add stardust.damage_taken_ub minecraft.custom:damage_taken

#Summon Ultimate Boss & Slaves
summon ender_dragon ~ ~ ~ {DragonPhase:1,Health:1000.0f,AbsorptionAmount:11500.0f,Glowing:1b,Attributes:[{Name:"generic.max_health",Base:1000.0d}],Silent:1,Tags:["stardust.ultimate_boss","stardust.dragon"],Team:"stardust.team",ActiveEffects:[{Id:11,Amplifier:3,Duration:2147483647,ShowParticles:0b}],CustomName:'[{"text":"U","italic":false,"color":"dark_purple","bold":true},{"text":"l","italic":false,"color":"blue"},{"text":"t","italic":false,"color":"dark_aqua"},{"text":"i","italic":false,"color":"aqua"},{"text":"m","italic":false,"color":"green"},{"text":"a","italic":false,"color":"yellow"},{"text":"t","italic":false,"color":"gold"},{"text":"e","italic":false,"color":"dark_red"},{"text":" B","italic":false,"color":"dark_purple"},{"text":"o","italic":false,"color":"blue"},{"text":"s","italic":false,"color":"dark_aqua"},{"text":"s","italic":false,"color":"aqua"}]'}
scoreboard players operation #temp stardust.data = UltimateSlaveCount stardust.config
execute if score #temp stardust.data matches 1.. positioned ~ ~-20 ~ run function stardust:boss/ultimate_boss/summoning/slave
scoreboard players add @e[tag=stardust.dragon,limit=1,sort=random] stardust.data 17
scoreboard players add @e[tag=stardust.dragon,limit=1,sort=random] stardust.data 9
scoreboard players add @e[tag=stardust.dragon,limit=1,sort=random] stardust.data 5

#Summon End crystals
summon end_crystal 12 76 -40
summon end_crystal 33 103 -25
summon end_crystal 42 88 0
summon end_crystal 33 97 24
summon end_crystal 12 82 39
summon end_crystal -13 79 39
summon end_crystal -34 94 24
summon end_crystal -42 91 -1
summon end_crystal -34 100 -25
summon end_crystal -13 85 -40
execute as @e[type=end_crystal,predicate=stardust:in_dim/ultimate] at @s positioned ~ ~-0.5 ~ run function stardust:boss/ultimate_boss/summoning/end_crystals

#Bossbar
bossbar remove stardust:ultimate_boss
bossbar add stardust:ultimate_boss [{"text":"U","italic":false,"color":"dark_purple","bold":true},{"text":"l","italic":false,"color":"blue"},{"text":"t","italic":false,"color":"dark_aqua"},{"text":"i","italic":false,"color":"aqua"},{"text":"m","italic":false,"color":"green"},{"text":"a","italic":false,"color":"yellow"},{"text":"t","italic":false,"color":"gold"},{"text":"e","italic":false,"color":"dark_red"},{"text":" B","italic":false,"color":"dark_purple"},{"text":"o","italic":false,"color":"blue"},{"text":"s","italic":false,"color":"dark_aqua"},{"text":"s","italic":false,"color":"aqua"}]
bossbar set stardust:ultimate_boss players @a[distance=..500]
bossbar set stardust:ultimate_boss max 1000
bossbar set stardust:ultimate_boss value 1000
bossbar set stardust:ultimate_boss color red
bossbar set stardust:ultimate_boss style notched_10

#Other
fill -2 61 2 2 61 -2 air replace end_portal
execute as @a at @s run playsound entity.wither.spawn master @s
tellraw @a ["",{"text":"[Stardust","italic":false,"color":"dark_aqua"},{"text":"Fragment] ","italic":false,"color":"aqua"},{"text":"The "},{"text":"U","italic":false,"color":"dark_purple"},{"text":"l","italic":false,"color":"blue"},{"text":"t","italic":false,"color":"dark_aqua"},{"text":"i","italic":false,"color":"aqua"},{"text":"m","italic":false,"color":"green"},{"text":"a","italic":false,"color":"yellow"},{"text":"t","italic":false,"color":"gold"},{"text":"e","italic":false,"color":"dark_red"},{"text":" B","italic":false,"color":"dark_purple"},{"text":"o","italic":false,"color":"blue"},{"text":"s","italic":false,"color":"dark_aqua"},{"text":"s","italic":false,"color":"aqua"},{"text":" has awoken!"}]
scoreboard players reset #ultimate_summoning stardust.data
scoreboard players set #ultimate_boss stardust.data 1
