#Update the gui to default
	data modify block ~ ~ ~ Items insert 0 value {Slot:0b,id:"minecraft:cobblestone",Count:1b,tag:{CustomModelData:2011999,SF_CustomTextureItem:1s,display:{Name:'[{"text":""}]'}}}
	execute if block ~ ~ ~ minecraft:furnace{Items:[{Slot:1b}],BurnTime:0s} run data modify block ~ ~ ~ Items[0] set value {Slot:0b,id:"minecraft:cobblestone",Count:1b,tag:{CustomModelData:2011975,SF_CustomTextureItem:1s,display:{Name:'[{"text":""}]'}}}

#Update the gui & produce Energy while working
	execute store result score BurnTime SF_Data run data get block ~ ~ ~ BurnTime
	execute if score BurnTime SF_Data matches 1.. run data modify block ~ ~ ~ Items[0] set value {Slot:0b,id:"minecraft:cobblestone",Count:1b,tag:{CustomModelData:2011975,SF_CustomTextureItem:1s,display:{Name:'[{"text":""}]'}}}
	execute if score BurnTime SF_Data matches 1.. run scoreboard players add @s EF_kJ 40
	execute if score BurnTime SF_Data matches 1.. run playsound simplenergy:furnace_generator block @a[distance=..10] ~ ~ ~ 0.25
	execute if score @s EF_kJ matches 1600.. run scoreboard players set @s EF_kJ 1600
