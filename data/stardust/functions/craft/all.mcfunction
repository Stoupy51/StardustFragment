data modify storage stardust:items all.Crafting set from block ~ ~ ~ Items
execute store result score Count StardustFragment_Data if data storage stardust:items all.Crafting[{tag:{SimplEnergy_CustomTextureItem:1b,CustomModelData:2011929}}]
execute unless data storage stardust:items all.Crafting[{Slot:16b,tag:{SimplEnergy_CustomTextureItem:1b}}] run scoreboard players add Count StardustFragment_Data 1
execute if score Count StardustFragment_Data matches ..17 run function stardust:craft/gui

data modify block ~ ~ ~ Items set from storage stardust:items all.Crafting

#Verifying if craft has been done
	execute as @s[tag=StardustFragment_WaitingCraft] run function stardust:craft/check_craft

tag @s remove StardustFragment_WaitingCraft
tag @s remove StardustFragment_FoundCraft
item replace block ~ ~ ~ container.16 with minecraft:cobblestone{CustomModelData:2011929,CustomItem:1b,StardustFragment_CustomItem:1b,SimplEnergy_CustomTextureItem:1b,display:{Name:'[{"text":""}]'}}
scoreboard players set @s StardustFragment_Data 0
scoreboard players set @s StardustFragment_X 1

#Skip useless checks
	execute as @s[tag=!StardustFragment_FoundCraft] unless data storage stardust:items all.Crafting[{Slot:2b}] unless data storage stardust:items all.Crafting[{Slot:3b}] unless data storage stardust:items all.Crafting[{Slot:4b}] unless data storage stardust:items all.Crafting[{Slot:11b}] unless data storage stardust:items all.Crafting[{Slot:12b}] unless data storage stardust:items all.Crafting[{Slot:13b}] unless data storage stardust:items all.Crafting[{Slot:20b}] unless data storage stardust:items all.Crafting[{Slot:21b}] unless data storage stardust:items all.Crafting[{Slot:22b}] run function stardust:craft/no_craft_found

#Check Crafts with only Vanilla Items
	scoreboard players set Success StardustFragment_Data 0
	execute as @s[tag=!StardustFragment_FoundCraft] store success score Success StardustFragment_Data unless data storage stardust:items all.Crafting[{Slot:2b,tag:{StardustFragment_CustomItem:1b}}] unless data storage stardust:items all.Crafting[{Slot:3b,tag:{StardustFragment_CustomItem:1b}}] unless data storage stardust:items all.Crafting[{Slot:4b,tag:{StardustFragment_CustomItem:1b}}] unless data storage stardust:items all.Crafting[{Slot:11b,tag:{StardustFragment_CustomItem:1b}}] unless data storage stardust:items all.Crafting[{Slot:12b,tag:{StardustFragment_CustomItem:1b}}] unless data storage stardust:items all.Crafting[{Slot:13b,tag:{StardustFragment_CustomItem:1b}}] unless data storage stardust:items all.Crafting[{Slot:20b,tag:{StardustFragment_CustomItem:1b}}] unless data storage stardust:items all.Crafting[{Slot:21b,tag:{StardustFragment_CustomItem:1b}}] unless data storage stardust:items all.Crafting[{Slot:22b,tag:{StardustFragment_CustomItem:1b}}] run function stardust:craft/types/all_vanilla

#Check Crafts without only Vanilla Items
	execute as @s[tag=!StardustFragment_FoundCraft] if score Success StardustFragment_Data matches 0 run function stardust:craft/types/all_non_vanilla

#Check Multiple Crafts
	execute as @s[tag=StardustFragment_WaitingCraft] run function stardust:craft/multiple_craft
