
scoreboard players remove Temp StardustFragment_Data 1
summon wolf ~ ~ ~ {Tags:["StardustFragment_DontShit"],Health:40,Attributes:[{Name:"generic.max_health",Base:40}],DeathLootTable:"stardust:entities/stouparmy"}

execute if score Temp StardustFragment_Data matches 1.. run function stardust:boss/summon_wolf
