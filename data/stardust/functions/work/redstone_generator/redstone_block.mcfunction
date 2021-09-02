data modify block ~ ~ ~ BurnTime set value 360s
execute store result score Count SF_Data run data get block ~ ~ ~ Items[{Slot:0b}].Count
execute run scoreboard players remove Count SF_Data 1
execute store result block ~ ~ ~ Items[{Slot:0b}].Count byte 1 run scoreboard players get Count SF_Data
