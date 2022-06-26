
scoreboard players remove #temp stardust.data 1
summon ender_dragon ~ ~ ~ {Health:512,Attributes:[{Name:"generic.max_health",Base:512}],Silent:1,Tags:["stardust.dragon"],Team:"stardust.team"}

execute unless score #temp stardust.data matches 0 positioned ~ ~-20 ~ run function stardust:boss/ultimate_boss/summon_slave
