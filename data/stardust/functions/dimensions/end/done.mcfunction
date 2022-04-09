tp @a[tag=stardust.temp] @e[type=armor_stand,tag=stardust.load_end,limit=1]
execute if score #chunk stardust.data matches 0 at @e[type=armor_stand,tag=stardust.load_end,limit=1] run forceload remove ~ ~
scoreboard players reset #chunk stardust.data
kill @e[type=armor_stand,tag=stardust.load_end]
tag @a[tag=stardust.temp] remove stardust.temp
scoreboard players set #end_built stardust.data 2
tellraw @a [{"text":"[Stardust","color":"dark_aqua"},{"text":"Fragment] ","color":"aqua"},{"text":"The End has been initialized!","color":"white"}]
execute in minecraft:the_end run forceload add 600 600
execute in minecraft:the_end positioned 0 -64 0 unless entity @e[tag=stardust.force_load,dx=15,dy=319,dz=15] run summon marker ~ ~ ~ {Tags:["stardust.force_load","global.forceload"]}
execute in minecraft:the_end run setblock 600 255 600 end_portal
