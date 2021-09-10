execute as @s[nbt={Inventory:[{tag:{SF_WormholePotion:1s}}]}] at @a if score @s SF_Wormhole = @p SF_StardustID run function stardust:opti/wormhole_potion/teleport
scoreboard players reset @s SF_Wormhole
scoreboard players enable @s SF_Wormhole
