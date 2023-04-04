
execute if entity @s[tag=stardust.quarry_gui] run function stardust:quarry/gui/check
execute if block ~ ~ ~ barrel[open=true] run function stardust:quarry/gui/all_gui

