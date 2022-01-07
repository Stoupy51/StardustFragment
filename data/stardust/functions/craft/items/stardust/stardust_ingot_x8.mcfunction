data modify block ~ ~ ~ Items append from storage stardust:items all.2013001
data modify block ~ ~ ~ Items[{Slot:16b}].Count set value 8
scoreboard players set @s StardustFragment_Data 2013001
scoreboard players set @s StardustFragment_X 8
tag @s add StardustFragment_WaitingCraft
tag @s add StardustFragment_FoundCraft
