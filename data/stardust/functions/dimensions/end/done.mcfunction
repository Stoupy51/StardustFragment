tp @a[tag=SF_Temp] @e[type=armor_stand,tag=SF_LoadEnd,limit=1]
execute if score Chunk SF_Data matches 0 at @e[type=armor_stand,tag=SF_LoadEnd,limit=1] run forceload remove ~ ~
scoreboard players reset Chunk SF_Data
kill @e[type=armor_stand,tag=SF_LoadEnd]
tag @a[tag=SF_Temp] remove SF_Temp
scoreboard players set EndBuilt SF_Data 1
execute in minecraft:the_end run forceload add 0 0 0 0
execute in minecraft:the_end positioned 0 -64 0 unless entity @e[tag=SE_Forceload,dx=15,dy=319,dz=15] run summon marker ~ ~ ~ {Tags:["SE_Forceload","global.forceload"]}
execute in minecraft:the_end run setblock 0 255 0 end_portal
