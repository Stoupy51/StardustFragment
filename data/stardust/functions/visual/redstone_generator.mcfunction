execute unless score @s EF_kJ matches 800.. run function stardust:work/redstone_generator/all
#Update gui depends on BurnTime
    data modify block ~ ~ ~ Items insert -1 value {Slot:1b,id:"minecraft:cobblestone",Count:1b,tag:{CustomModelData:2013104,SE_CustomTextureItem:1s,display:{Name:'[{"text":""}]'}}}
    execute unless block ~ ~ ~ minecraft:furnace{BurnTime:0s} run data modify block ~ ~ ~ Items[1] set value {Slot:1b,id:"minecraft:cobblestone",Count:1b,tag:{CustomModelData:2013105,SE_CustomTextureItem:1s,display:{Name:'[{"text":""}]'}}}

    execute if block ~ ~ ~ minecraft:furnace{BurnTime:0s} run data modify entity @s Item.tag.CustomModelData set value 2013237
    execute unless block ~ ~ ~ minecraft:furnace{BurnTime:0s} run data modify entity @s Item.tag.CustomModelData set value 2013238

#Small Fix by the way
    data modify block ~ ~ ~ CookTimeTotal set value -200s
    data modify block ~ ~ ~ CookTime set value 0s