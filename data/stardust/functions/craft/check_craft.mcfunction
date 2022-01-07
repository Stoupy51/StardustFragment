scoreboard players set Crafted SF_Data 0
scoreboard players set Count SF_Data 0
execute store result score Crafted SF_Data run data get storage stardust:items all.Crafting[{Slot:16b}].tag.CustomModelData
execute store result score Count SF_Data run data get storage stardust:items all.Crafting[{Slot:16b}].Count
execute if score Crafted SF_Data matches 2011929 run scoreboard players set Count SF_Data 0
execute if score @s SF_Data = Crafted SF_Data unless score Count SF_Data = @s SF_X run function stardust:craft/crafted
execute unless score @s SF_Data = Crafted SF_Data run function stardust:craft/crafted
execute unless score @s SF_X = Count SF_Data run function stardust:craft/drop
