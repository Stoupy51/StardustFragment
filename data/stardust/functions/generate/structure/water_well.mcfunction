
#Choose a Structure
	execute if score Rotation StardustFragment_Data matches 0 at @s run setblock ~ ~1 ~ minecraft:structure_block{rotation:"NONE",posX:0,mode:"LOAD",posY:-5,posZ:0,sizeX:6,sizeY:9,sizeZ:6,name:"stardust:water_well"}
	execute if score Rotation StardustFragment_Data matches 1 at @s run setblock ~ ~1 ~ minecraft:structure_block{rotation:"CLOCKWISE_90",posX:0,mode:"LOAD",posY:-5,posZ:0,sizeX:6,sizeY:9,sizeZ:6,name:"stardust:water_well"}
	execute if score Rotation StardustFragment_Data matches 2 at @s run setblock ~ ~1 ~ minecraft:structure_block{rotation:"CLOCKWISE_180",posX:0,mode:"LOAD",posY:-5,posZ:0,sizeX:6,sizeY:9,sizeZ:6,name:"stardust:water_well"}
	execute if score Rotation StardustFragment_Data matches 3 at @s run setblock ~ ~1 ~ minecraft:structure_block{rotation:"COUNTERCLOCKWISE_90",posX:0,mode:"LOAD",posY:-5,posZ:0,sizeX:6,sizeY:9,sizeZ:6,name:"stardust:water_well"}
