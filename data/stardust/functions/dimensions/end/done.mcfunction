tp @a[tag=StardustFragment_Temp] @e[type=armor_stand,tag=StardustFragment_LoadEnd,limit=1]
execute if score Chunk StardustFragment_Data matches 0 at @e[type=armor_stand,tag=StardustFragment_LoadEnd,limit=1] run forceload remove ~ ~
scoreboard players reset Chunk StardustFragment_Data
kill @e[type=armor_stand,tag=StardustFragment_LoadEnd]
tag @a[tag=StardustFragment_Temp] remove StardustFragment_Temp
scoreboard players set EndBuilt StardustFragment_Data 1
execute in minecraft:the_end run forceload add 0 0 0 0
execute in minecraft:the_end positioned 0 -64 0 unless entity @e[tag=SimplEnergy_Forceload,dx=15,dy=319,dz=15] run summon marker ~ ~ ~ {Tags:["SimplEnergy_Forceload","global.forceload"]}
execute in minecraft:the_end run setblock 0 255 0 end_portal
