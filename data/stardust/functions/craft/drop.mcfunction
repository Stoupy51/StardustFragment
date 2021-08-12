data remove storage stardust:items Drop
data modify storage stardust:items Drop set from block ~ ~ ~ Items[{Slot:16b}]
execute if data storage stardust:items Drop run function stardust:craft/dropped
