scoreboard players operation Qx SF_Data = @s SF_Qx
scoreboard players operation Qy SF_Data = @s SF_Qy
scoreboard players operation Qz SF_Data = @s SF_Qz
summon area_effect_cloud ~ ~ ~ {Tags:["SF_QuarryTemp"]}
execute as @e[type=minecraf:area_effect_cloud,limit=1,tag=SF_QuarryTemp,distance=..1] at @s run function stardust:quarry/working/shulkers

execute at @e[type=minecraft:shulker,tag=SF_QuarryMiner,tag=!SF_QuarryMinerDone] unless block ~ ~ ~ #minecraft:wither_immune run function stardust:quarry/working/mine
tag @e[type=minecraft:shulker,tag=!SF_QuarryMinerDone] add SF_QuarryMinerDone
function stardust:quarry/working/move
