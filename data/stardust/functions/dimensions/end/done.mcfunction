tp @a[tag=StardustFragment_Temp] @e[type=armor_stand,tag=StardustFragment_LoadEnd,limit=1]
execute if score Chunk StardustFragment_Data matches 0 at @e[type=armor_stand,tag=StardustFragment_LoadEnd,limit=1] run forceload remove ~ ~
scoreboard players reset Chunk StardustFragment_Data
kill @e[type=armor_stand,tag=StardustFragment_LoadEnd]
tag @a[tag=StardustFragment_Temp] remove StardustFragment_Temp
scoreboard players set EndBuilt StardustFragment_Data 2
tellraw @a [{"text":"[Stardust","color":"dark_aqua"},{"text":"Fragment] ","color":"aqua"},{"text":"The End has been initialized!","color":"white"}]
execute in minecraft:the_end run forceload add 600 600
execute in minecraft:the_end positioned 0 -64 0 unless entity @e[tag=StardustFragment_Forceload,dx=15,dy=319,dz=15] run summon marker ~ ~ ~ {Tags:["StardustFragment_Forceload","global.forceload"]}
execute in minecraft:the_end run setblock 600 255 600 end_portal
