
execute if entity @s[nbt={Inventory:[{tag:{stardust:{wormhole_potion:1b}}}]}] at @a if score @s stardust.wormhole = @p smd.id run function stardust:opti/wormhole_potion/teleport
scoreboard players reset @s stardust.wormhole
scoreboard players enable @s stardust.wormhole
