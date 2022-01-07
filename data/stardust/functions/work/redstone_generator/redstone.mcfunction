data modify block ~ ~ ~ BurnTime set value 280s
execute store result score Count StardustFragment_Data run data get block ~ ~ ~ Items[{Slot:0b}].Count
execute run scoreboard players remove Count StardustFragment_Data 1
execute store result block ~ ~ ~ Items[{Slot:0b}].Count byte 1 run scoreboard players get Count StardustFragment_Data
