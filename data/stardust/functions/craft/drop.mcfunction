data remove storage stardust:items all.Drop
data modify storage stardust:items all.Drop set from block ~ ~ ~ Items[{Slot:16b}]
execute if data storage stardust:items all.Drop run function stardust:craft/dropped
