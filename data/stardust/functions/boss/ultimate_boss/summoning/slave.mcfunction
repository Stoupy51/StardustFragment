
summon ender_dragon ~ ~ ~ {Health:512.0f,Attributes:[{Name:"generic.max_health",Base:512.0d}],Silent:1,Tags:["stardust.dragon"],Team:"stardust.team"}

scoreboard players remove #temp stardust.data 1
execute unless score #temp stardust.data matches 0 positioned ~ ~-20 ~ run function stardust:boss/ultimate_boss/summoning/slave
