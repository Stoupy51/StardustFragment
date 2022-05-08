
function stardust:calls/generate/structure/height_variation
tp @s ~ ~160 ~

#Choose a Structure
	execute if score #rotation stardust.data matches 0 at @s run setblock ~ ~1 ~ minecraft:structure_block{rotation:"NONE",posX:0,mode:"LOAD",posY:0,posZ:0,sizeX:6,sizeY:9,sizeZ:6,name:"stardust:awakened_floating_island"}
	execute if score #rotation stardust.data matches 1 at @s run setblock ~ ~1 ~ minecraft:structure_block{rotation:"CLOCKWISE_90",posX:0,mode:"LOAD",posY:0,posZ:0,sizeX:6,sizeY:9,sizeZ:6,name:"stardust:awakened_floating_island"}
	execute if score #rotation stardust.data matches 2 at @s run setblock ~ ~1 ~ minecraft:structure_block{rotation:"CLOCKWISE_180",posX:0,mode:"LOAD",posY:0,posZ:0,sizeX:6,sizeY:9,sizeZ:6,name:"stardust:awakened_floating_island"}
	execute if score #rotation stardust.data matches 3 at @s run setblock ~ ~1 ~ minecraft:structure_block{rotation:"COUNTERCLOCKWISE_90",posX:0,mode:"LOAD",posY:0,posZ:0,sizeX:6,sizeY:9,sizeZ:6,name:"stardust:awakened_floating_island"}
