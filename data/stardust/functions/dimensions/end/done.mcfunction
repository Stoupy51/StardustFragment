tp @a[tag=SF_Temp] @e[type=armor_stand,tag=SF_LoadEnd,limit=1]
execute if score Chunk SF_Data matches 0 at @e[type=armor_stand,tag=SF_LoadEnd,limit=1] run forceload remove ~ ~
kill @e[type=armor_stand,tag=SF_LoadEnd]
scoreboard players set EndBuilt SF_Data 1
execute in minecraft:the_end run forceload add 0 0 0 0
execute in minecraft:the_end run setblock 0 255 0 end_portal
