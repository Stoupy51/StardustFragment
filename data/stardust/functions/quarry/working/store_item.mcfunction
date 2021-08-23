setblock -29999999 0 2013 shulker_box
scoreboard players set ItemStored SF_Data 0
data modify storage stardust:items ItemStored set from entity @s Item
execute unless data block -29999999 0 2013 Items[{Slot:8b}] run data modify storage stardust:items ItemStored.Slot set value 8b
execute unless data block -29999999 0 2013 Items[{Slot:7b}] run data modify storage stardust:items ItemStored.Slot set value 7b
execute unless data block -29999999 0 2013 Items[{Slot:6b}] run data modify storage stardust:items ItemStored.Slot set value 6b
execute unless data block -29999999 0 2013 Items[{Slot:5b}] run data modify storage stardust:items ItemStored.Slot set value 5b
execute unless data block -29999999 0 2013 Items[{Slot:4b}] run data modify storage stardust:items ItemStored.Slot set value 4b
execute unless data block -29999999 0 2013 Items[{Slot:3b}] run data modify storage stardust:items ItemStored.Slot set value 3b
execute unless data block -29999999 0 2013 Items[{Slot:2b}] run data modify storage stardust:items ItemStored.Slot set value 2b
execute unless data block -29999999 0 2013 Items[{Slot:1b}] run data modify storage stardust:items ItemStored.Slot set value 1b
execute unless data block -29999999 0 2013 Items[{Slot:0b}] run data modify storage stardust:items ItemStored.Slot set value 0b
execute if data storage stardust:items ItemStored.Slot run data modify block -29999999 0 2013 Items append from storage stardust:items ItemStored
execute store result score ItemStored SF_Data at @e[type=minecraft:glow_item_frame,tag=SF_QuarryStock,limit=1] run loot insert ~ ~ ~ mine -29999999 0 2013 minecraft:air{drop_contents:true}
execute unless score ItemStored SF_Data matches 0 run kill @s
