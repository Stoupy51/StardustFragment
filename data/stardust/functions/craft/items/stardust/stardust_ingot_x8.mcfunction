data modify block ~ ~ ~ Items append from storage stardust:items all.2013001
data modify block ~ ~ ~ Items[{Slot:16b}].Count set value 8
scoreboard players set @s SF_Data 2013001
scoreboard players set @s SF_X 8
tag @s add SF_WaitingCraft
tag @s add SF_FoundCraft
