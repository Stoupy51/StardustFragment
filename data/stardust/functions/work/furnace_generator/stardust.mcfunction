#Update the gui to default
	data modify block ~ ~ ~ Items insert 0 value {Slot:0b,id:"minecraft:cobblestone",Count:1b,tag:{CustomModelData:2011999,simplenergy:{texture_item:1b},display:{Name:'[{"text":""}]'}}}
	execute if block ~ ~ ~ minecraft:furnace{Items:[{Slot:1b}],BurnTime:0s} run data modify block ~ ~ ~ Items[0] set value {Slot:0b,id:"minecraft:cobblestone",Count:1b,tag:{CustomModelData:2011975,simplenergy:{texture_item:1b},display:{Name:'[{"text":""}]'}}}

#Update the gui & produce Energy while working
	execute store result score temp stardust.data run data get block ~ ~ ~ BurnTime
	execute if score temp stardust.data matches 1.. run data modify block ~ ~ ~ Items[0] set value {Slot:0b,id:"minecraft:cobblestone",Count:1b,tag:{CustomModelData:2011975,simplenergy:{texture_item:1b},display:{Name:'[{"text":""}]'}}}
	execute if score temp stardust.data matches 1.. run scoreboard players add @s energy.storage 40
	execute if score temp stardust.data matches 1.. run playsound simplenergy:furnace_generator block @a[distance=..10] ~ ~ ~ 0.25
	execute if score @s energy.storage >= @s energy.max_storage run scoreboard players operation @s energy.storage = @s energy.max_storage
