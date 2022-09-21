
execute positioned ~ ~-1 ~ if block ~ ~ ~ hopper[enabled=true] run function stardust:quarry/extract/hopper/
execute positioned ~ ~-1 ~ as @e[type=hopper_minecart,distance=..1] run function stardust:quarry/extract/hopper_minecart/
execute positioned ~ ~1 ~ as @e[type=chest_minecart,distance=..1] run function stardust:quarry/extract/chest_minecart/
