execute unless score @s EF_kJ matches 1600.. run function stardust:work/furnace_generator/awakened
#Update gui depends on BurnTime
    data modify block ~ ~ ~ Items insert -1 value {Slot:0b,id:"minecraft:cobblestone",Count:1b,tag:{CustomModelData:2013100,SE_CustomTextureItem:1s,display:{Name:'[{"text":""}]'}}}
    execute unless block ~ ~ ~ minecraft:furnace{BurnTime:0s} run data modify block ~ ~ ~ Items[0] set value {Slot:0b,id:"minecraft:cobblestone",Count:1b,tag:{CustomModelData:2013101,SE_CustomTextureItem:1s,display:{Name:'[{"text":""}]'}}}

    execute if block ~ ~ ~ minecraft:furnace{BurnTime:0s} run data modify entity @s Item.tag.CustomModelData set value 2013246
    execute unless block ~ ~ ~ minecraft:furnace{BurnTime:0s} run data modify entity @s Item.tag.CustomModelData set value 2013247

#Small Fix by the way
    data modify block ~ ~ ~ CookTimeTotal set value -200s
    data modify block ~ ~ ~ CookTime set value 0s
