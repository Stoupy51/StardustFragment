function stardust:craft/drop_gui
function stardust:craft/gui

#Verifying if craft has been done
scoreboard players set Crafted SF_Data 0
scoreboard players set Count SF_Data 0
execute store result score Crafted SF_Data run data get block ~ ~ ~ Items[{Slot:16b}].tag.CustomModelData
execute store result score Count SF_Data run data get block ~ ~ ~ Items[{Slot:16b}].Count
execute unless score @s[tag=SF_WaitingCraft] SF_Data = Crafted SF_Data unless score @s SF_X = Count SF_Data run function stardust:craft/crafted

tag @s remove SF_WaitingCraft
item replace block ~ ~ ~ container.16 with minecraft:cobblestone{CustomModelData:2011929,SE_CustomTextureItem:1b,display:{Name:'[{"text":"","italic":false}]'}}
scoreboard players set @s SF_Data 0
scoreboard players set @s SF_X 1

#Types Crafts
    execute if entity @s[tag=!SF_WaitingCraft] run function stardust:craft/types/all

#Cauldron Generator
    #execute if entity @s[tag=!SF_WaitingCraft] unless data block ~ ~ ~ Items[{Slot:3b}] if block ~ ~ ~ barrel{Items:[{Slot:2b,id:"minecraft:iron_ingot"},{Slot:4b,id:"minecraft:iron_ingot"},{Slot:11b,id:"minecraft:iron_ingot"},{Slot:12b,id:"minecraft:redstone"},{Slot:13b,id:"minecraft:iron_ingot"},{Slot:20b,id:"minecraft:iron_ingot"},{Slot:21b,id:"minecraft:iron_ingot"},{Slot:22b,id:"minecraft:iron_ingot"}]} run function stardust:craft/items/cauldron_generator




