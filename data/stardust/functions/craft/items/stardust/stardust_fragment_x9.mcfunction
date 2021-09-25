data modify block ~ ~ ~ Items append from storage stardust:items 2013000
data modify block ~ ~ ~ Items[{Slot:16b}].Count set value 9
scoreboard players set @s SF_Data 2013000
scoreboard players set @s SF_X 9
tag @s add SF_WaitingCraft
tag @s add SF_FoundCraft
