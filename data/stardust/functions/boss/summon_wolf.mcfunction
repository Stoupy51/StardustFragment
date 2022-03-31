
scoreboard players remove temp stardust.data 1
summon wolf ~ ~ ~ {Tags:["stardust.dont_shit"],Health:40,Attributes:[{Name:"generic.max_health",Base:40}],DeathLootTable:"stardust:entities/stouparmy"}

execute if score temp stardust.data matches 1.. run function stardust:boss/summon_wolf
