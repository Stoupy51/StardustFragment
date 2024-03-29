
#Update the gui to default
	scoreboard players set #success simplenergy.data 0
	execute store success score #success simplenergy.data unless data block ~ ~ ~ {Items:[{Slot:1b}],BurnTime:0s}
	execute if score #success simplenergy.data matches 1 run item replace block ~ ~ ~ container.0 with cobblestone{CustomModelData:2011999,simplenergy:{texture_item:1b},display:{Name:'""'}}
	execute if score #success simplenergy.data matches 0 run item replace block ~ ~ ~ container.0 with cobblestone{CustomModelData:2011975,simplenergy:{texture_item:1b},display:{Name:'""'}}

#Update the gui & produce Energy while working
	execute store result score #temp stardust.data run data get block ~ ~ ~ BurnTime
	execute if score #temp stardust.data matches 1.. run data modify block ~ ~ ~ Items[0].tag.CustomModelData set value 2011975
	execute if score #temp stardust.data matches 1.. run scoreboard players add @s energy.storage 20
	execute if score #temp stardust.data matches 1.. run playsound simplenergy:furnace_generator block @a[distance=4..12,tag=!simplenergy.ps.furnace_generator] ~ ~ ~ 0.04
	execute if score #temp stardust.data matches 1.. run playsound simplenergy:furnace_generator block @a[distance=..4,tag=!simplenergy.ps.furnace_generator] ~ ~ ~ 0.20
	execute if score #temp stardust.data matches 1.. run tag @a[distance=..12] add simplenergy.ps.furnace_generator
	execute if score @s energy.storage >= @s energy.max_storage run scoreboard players operation @s energy.storage = @s energy.max_storage
