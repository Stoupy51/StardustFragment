tag @s remove SF_WorkingPortal
execute if entity @s[tag=SF_InfiniteEnergy] run scoreboard players operation @s EF_Joule = @s EF_Watt
execute if score @s EF_Joule >= @s EF_Watt run tag @s add SF_WorkingPortal
execute if entity @s[tag=SF_WorkingPortal] run scoreboard players operation @s EF_Joule -= @s EF_Watt
execute at @s[tag=SF_WorkingPortal] positioned ~ ~1 ~ run scoreboard players add @a[distance=..1,dx=0] SF_Data 10