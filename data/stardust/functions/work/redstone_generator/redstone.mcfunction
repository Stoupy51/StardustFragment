data modify block ~ ~ ~ BurnTime set value 280s
execute store result score #count stardust.data run data get block ~ ~ ~ Items[{Slot:0b}].Count
execute run scoreboard players remove #count stardust.data 1
execute store result block ~ ~ ~ Items[{Slot:0b}].Count byte 1 run scoreboard players get #count stardust.data
