execute as @s[nbt={Inventory:[{tag:{StardustFragment_WormholePotion:1b}}]}] at @a if score @s StardustFragment_Wormhole = @p StardustFragment_StardustID run function stardust:opti/wormhole_potion/teleport
scoreboard players reset @s StardustFragment_Wormhole
scoreboard players enable @s StardustFragment_Wormhole
