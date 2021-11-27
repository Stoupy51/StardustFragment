data modify storage stardust:items Crafting set from block ~ ~ ~ Items
execute store result score Count SF_Data if data storage stardust:items Crafting[{tag:{SE_CustomTextureItem:1b,CustomModelData:2011929}}]
execute unless data storage stardust:items Crafting[{Slot:16b,tag:{SE_CustomTextureItem:1b}}] run scoreboard players add Count SF_Data 1
execute if score Count SF_Data matches ..17 run function stardust:craft/gui

data modify block ~ ~ ~ Items set from storage stardust:items Crafting

#Verifying if craft has been done
	execute as @s[tag=SF_WaitingCraft] run function stardust:craft/check_craft

tag @s remove SF_WaitingCraft
tag @s remove SF_FoundCraft
item replace block ~ ~ ~ container.16 with minecraft:cobblestone{CustomModelData:2011929,CustomItem:1b,SE_CustomTextureItem:1b,display:{Name:'[{"text":""}]'}}
scoreboard players set @s SF_Data 0
scoreboard players set @s SF_X 1

#Skip useless checks
	execute as @s[tag=!SF_FoundCraft] unless data storage stardust:items Crafting[{Slot:2b}] unless data storage stardust:items Crafting[{Slot:3b}] unless data storage stardust:items Crafting[{Slot:4b}] unless data storage stardust:items Crafting[{Slot:11b}] unless data storage stardust:items Crafting[{Slot:12b}] unless data storage stardust:items Crafting[{Slot:13b}] unless data storage stardust:items Crafting[{Slot:20b}] unless data storage stardust:items Crafting[{Slot:21b}] unless data storage stardust:items Crafting[{Slot:22b}] run function stardust:craft/no_craft_found

#Check Crafts with only Vanilla Items
	scoreboard players set Success SF_Data 0
	execute as @s[tag=!SF_FoundCraft] store success score Success SF_Data unless data storage stardust:items Crafting[{Slot:2b,tag:{CustomItem:1b}}] unless data storage stardust:items Crafting[{Slot:3b,tag:{CustomItem:1b}}] unless data storage stardust:items Crafting[{Slot:4b,tag:{CustomItem:1b}}] unless data storage stardust:items Crafting[{Slot:11b,tag:{CustomItem:1b}}] unless data storage stardust:items Crafting[{Slot:12b,tag:{CustomItem:1b}}] unless data storage stardust:items Crafting[{Slot:13b,tag:{CustomItem:1b}}] unless data storage stardust:items Crafting[{Slot:20b,tag:{CustomItem:1b}}] unless data storage stardust:items Crafting[{Slot:21b,tag:{CustomItem:1b}}] unless data storage stardust:items Crafting[{Slot:22b,tag:{CustomItem:1b}}] run function stardust:craft/types/all_vanilla

#Check Crafts without only Vanilla Items
	execute as @s[tag=!SF_FoundCraft] if score Success SF_Data matches 0 run function stardust:craft/types/all_non_vanilla

#Check Multiple Crafts
	execute as @s[tag=SF_WaitingCraft] run function stardust:craft/multiple_craft
