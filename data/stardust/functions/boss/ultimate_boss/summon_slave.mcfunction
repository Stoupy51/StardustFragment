
scoreboard players remove Temp StardustFragment_Data 1
summon ender_dragon ~ ~ ~ {Health:1024,Attributes:[{Name:"generic.max_health",Base:1024}],Silent:1,Tags:["StardustFragment_Dragon"],Team:"StardustFragment_Stardust"}

execute unless score Temp StardustFragment_Data matches 0 positioned ~ ~-20 ~ run function stardust:boss/ultimate_boss/summon_slave
