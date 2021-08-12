function stardust:craft/drop_gui
function stardust:craft/gui

#Verifying if craft has been done
scoreboard players set Crafted SF_Data 0
scoreboard players set Count SF_Data 0
execute store result score Crafted SF_Data run data get block ~ ~ ~ Items[{Slot:16b}].tag.CustomModelData
execute store result score Count SF_Data run data get block ~ ~ ~ Items[{Slot:16b}].Count
execute if score @s[tag=SF_WaitingCraft] SF_Data = Crafted SF_Data unless score Count SF_Data = @s SF_X run function simplenergy:craft/crafted
execute unless score @s[tag=SF_WaitingCraft] SF_Data = Crafted SF_Data run function simplenergy:craft/crafted
execute unless score @s SF_X = Count SF_Data run function simplenergy:craft/drop

tag @s remove SF_WaitingCraft
item replace block ~ ~ ~ container.16 with minecraft:cobblestone{CustomModelData:2011929,SE_CustomTextureItem:1b,display:{Name:'[{"text":"","italic":false}]'}}
scoreboard players set @s SF_Data 0
scoreboard players set @s SF_X 1

#Dragon Pearl
    execute if entity @s[tag=!SF_WaitingCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,id:"minecraft:dragon_breath"},{Slot:3b,id:"minecraft:dragon_breath"},{Slot:4b,id:"minecraft:dragon_breath"},{Slot:11b,id:"minecraft:dragon_breath"},{Slot:12b,id:"minecraft:ender_pearl"},{Slot:13b,id:"minecraft:dragon_breath"},{Slot:20b,id:"minecraft:dragon_breath"},{Slot:21b,id:"minecraft:dragon_breath"},{Slot:22b,id:"minecraft:dragon_breath"}]} run function stardust:craft/items/dragon_pearl
#Wormhole Potion
    execute if entity @s[tag=!SF_WaitingCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,id:"minecraft:tropical_fish"},{Slot:3b,id:"minecraft:tropical_fish"},{Slot:4b,id:"minecraft:tropical_fish"},{Slot:11b,id:"minecraft:tropical_fish"},{Slot:12b,id:"minecraft:water_bottle"},{Slot:13b,id:"minecraft:tropical_fish"},{Slot:20b,id:"minecraft:tropical_fish"},{Slot:21b,id:"minecraft:tropical_fish"},{Slot:22b,id:"minecraft:tropical_fish"}]} run function stardust:craft/items/wormhole_potion
    execute if entity @s[tag=!SF_WaitingCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_WormholePotion:1b}},{Slot:3b,tag:{SF_WormholePotion:1b}},{Slot:4b,tag:{SF_WormholePotion:1b}},{Slot:11b,tag:{SF_WormholePotion:1b}},{Slot:12b,tag:{SF_WormholePotion:1b}},{Slot:13b,tag:{SF_WormholePotion:1b}},{Slot:20b,tag:{SF_WormholePotion:1b}},{Slot:21b,tag:{SF_WormholePotion:1b}},{Slot:22b,tag:{SF_WormholePotion:1b}}]} run function stardust:craft/items/wormhole_potion_x9
#Diamond Seeds
    execute if entity @s[tag=!SF_WaitingCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,id:"minecraft:wheat_seeds"},{Slot:3b,id:"minecraft:wheat_seeds"},{Slot:4b,id:"minecraft:wheat_seeds"},{Slot:11b,id:"minecraft:wheat_seeds"},{Slot:12b,id:"minecraft:diamond"},{Slot:13b,id:"minecraft:wheat_seeds"},{Slot:20b,id:"minecraft:wheat_seeds"},{Slot:21b,id:"minecraft:wheat_seeds"},{Slot:22b,id:"minecraft:wheat_seeds"}]} run function stardust:craft/items/seeds/diamond
    execute if entity @s[tag=!SF_WaitingCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,id:"minecraft:diamond"},{Slot:3b,id:"minecraft:diamond"},{Slot:4b,id:"minecraft:diamond"},{Slot:11b,id:"minecraft:diamond"},{Slot:12b,tag:{SF_DiamondSeed:1b}},{Slot:13b,id:"minecraft:diamond"},{Slot:20b,id:"minecraft:diamond"},{Slot:21b,id:"minecraft:diamond"},{Slot:22b,id:"minecraft:diamond"}]} run function stardust:craft/items/seeds/advanced_diamond
#Celestial Portal
    execute if entity @s[tag=!SF_WaitingCraft] unless data block ~ ~ ~ Items[{Slot:12b}] if block ~ ~ ~ barrel{Items:[{Slot:2b,id:"minecraft:iron_block"},{Slot:3b,id:"minecraft:iron_block"},{Slot:4b,id:"minecraft:iron_block"},{Slot:11b,id:"minecraft:iron_block"},{Slot:13b,id:"minecraft:iron_block"},{Slot:20b,id:"minecraft:iron_block"},{Slot:21b,id:"minecraft:iron_block"},{Slot:22b,id:"minecraft:iron_block"}]} run function stardust:craft/items/portals/celetial
#Stoupy's Egg
    execute if entity @s[tag=!SF_WaitingCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_DogExcrement:1b}},{Slot:3b,tag:{SF_DogExcrement:1b}},{Slot:4b,tag:{SF_DogExcrement:1b}},{Slot:11b,tag:{SF_DogExcrement:1b}},{Slot:12b,id:"minecraft:cake"},{Slot:13b,tag:{SF_DogExcrement:1b}},{Slot:20b,tag:{SF_DogExcrement:1b}},{Slot:21b,tag:{SF_DogExcrement:1b}},{Slot:22b,tag:{SF_DogExcrement:1b}}]} run function stardust:craft/items/stoup_egg

#Types Crafts
    execute if entity @s[tag=!SF_WaitingCraft] run function stardust:craft/types/all





