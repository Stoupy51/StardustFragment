#Update the gui to default
	data modify block ~ ~ ~ Items insert 0 value {Slot:0b,id:"minecraft:cobblestone",Count:1b,tag:{CustomModelData:2011999,SF_CustomItem:1b,SF_CustomTextureItem:1b,display:{Name:'[{"text":""}]'}}}
	execute if block ~ ~ ~ minecraft:furnace{Items:[{Slot:1b}],BurnTime:0s} run data modify block ~ ~ ~ Items[0].tag.CustomModelData set value 2011975
#Update the gui & produce Energy while working
	execute store result score Temp SF_Data run data get block ~ ~ ~ BurnTime
	execute if score Temp SF_Data matches 1.. run data modify block ~ ~ ~ Items[0].tag.CustomModelData set value 2011975
	execute if score Temp SF_Data matches 1.. run scoreboard players add @s energy.storage 20
	execute if score Temp SF_Data matches 1.. run playsound simplenergy:furnace_generator block @a[distance=..10] ~ ~ ~ 0.25
	execute if score @s energy.storage >= @s energy.max_storage run scoreboard players operation @s energy.storage = @s energy.max_storage
