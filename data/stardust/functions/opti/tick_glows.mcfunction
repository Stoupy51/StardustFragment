
execute if entity @s[tag=StardustFragment_CraftingTable,predicate=simplenergy:is_barrel_open] if entity @p[distance=..7] run function stardust:craft/all
execute unless block ~ ~ ~ minecraft:barrel run function stardust:destroy/groups/barrel
