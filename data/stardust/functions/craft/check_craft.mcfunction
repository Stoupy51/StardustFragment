scoreboard players set Crafted StardustFragment_Data 0
scoreboard players set Count StardustFragment_Data 0
execute store result score Crafted StardustFragment_Data run data get storage stardust:items all.Crafting[{Slot:16b}].tag.CustomModelData
execute store result score Count StardustFragment_Data run data get storage stardust:items all.Crafting[{Slot:16b}].Count
execute if score Crafted StardustFragment_Data matches 2011929 run scoreboard players set Count StardustFragment_Data 0
execute if score @s StardustFragment_Data = Crafted StardustFragment_Data unless score Count StardustFragment_Data = @s StardustFragment_X run function stardust:craft/crafted
execute unless score @s StardustFragment_Data = Crafted StardustFragment_Data run function stardust:craft/crafted
execute unless score @s StardustFragment_X = Count StardustFragment_Data run function stardust:craft/drop
