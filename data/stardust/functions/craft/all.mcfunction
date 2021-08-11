function stardust:craft/drop_gui
function stardust:craft/gui

#Verifying if craft has been done
scoreboard players set Crafted SF_Data 0
execute store result score Crafted SF_Data run data get block ~ ~ ~ Items[{Slot:16b}].tag.CustomModelData
execute unless score @s[tag=SF_WaitingCraft] SF_Data = Crafted SF_Data run function stardust:craft/crafted

tag @s remove SF_WaitingCraft
item replace block ~ ~ ~ container.16 with minecraft:cobblestone{CustomModelData:2011929,SE_CustomTextureItem:1b,display:{Name:'[{"text":"","italic":false}]'}}
scoreboard players set @s SF_Data 0

#Stardust Fragment Crafts
    execute if entity @s[tag=!SF_WaitingCraft] if data block ~ ~ ~ Items[{tag:{SF_StardustFragment:1b}}] run function stardust:craft/types/stardust_fragment
#Stardust Ingot Crafts
    execute if entity @s[tag=!SF_WaitingCraft] if data block ~ ~ ~ Items[{tag:{SF_StardustIngot:1b}}] run function stardust:craft/types/stardust_ingot
#Stardust Essence Crafts
    execute if entity @s[tag=!SF_WaitingCraft] if data block ~ ~ ~ Items[{tag:{SF_StardustEssence:1b}}] run function stardust:craft/types/stardust_essence
#Stardust Config Crafts
    execute if entity @s[tag=!SF_WaitingCraft] if data block ~ ~ ~ Items[{tag:{SF_StardustConfig:1b}}] run function stardust:craft/types/stardust_config
#Awakened Stardust Crafts
    execute if entity @s[tag=!SF_WaitingCraft] if data block ~ ~ ~ Items[{tag:{SF_AwakenedStardust:1b}}] run function stardust:craft/types/awakened_stardust
#Awakened Stardust Block Crafts
    execute if entity @s[tag=!SF_WaitingCraft] if data block ~ ~ ~ Items[{tag:{SF_AwakenedStardustBlock:1b}}] run function stardust:craft/types/awakened_stardust_block






#Cauldron Generator
    execute if entity @s[tag=!SF_WaitingCraft] unless data block ~ ~ ~ Items[{Slot:3b}] if block ~ ~ ~ barrel{Items:[{Slot:2b,id:"minecraft:iron_ingot"},{Slot:4b,id:"minecraft:iron_ingot"},{Slot:11b,id:"minecraft:iron_ingot"},{Slot:12b,id:"minecraft:redstone"},{Slot:13b,id:"minecraft:iron_ingot"},{Slot:20b,id:"minecraft:iron_ingot"},{Slot:21b,id:"minecraft:iron_ingot"},{Slot:22b,id:"minecraft:iron_ingot"}]} run function stardust:craft/items/cauldron_generator




