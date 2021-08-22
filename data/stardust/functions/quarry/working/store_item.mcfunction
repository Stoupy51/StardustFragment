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
execute store success score ItemStored SF_Data if data storage stardust:items ItemStored.Slot run data modify block -29999999 0 2013 Items append from storage stardust:items ItemStored
execute if score ItemStored SF_Data matches 1 run kill @s
