
scoreboard players remove Temp StardustFragment_Data 1
summon wolf ~ ~ ~ {Tags:["StardustFragment_StoupArmyDrop","StardustFragment_DontShit"],Health:40,Attributes:[{Name:"generic.max_health",Base:40}],ArmorDropChances:[1F,0.5F,0.25F,0.1F],ArmorItems:[{},{},{},{}]}

execute if score Temp StardustFragment_Data matches 1.. run function stardust:boss/summon_wolf
