execute as @s[nbt={Dimension:"stardust:dungeon"}] run function stardust:dimensions/spawn
execute as @s[nbt={Dimension:"stardust:celestial"}] at @s in minecraft:overworld run tp @s ~ 475 ~
execute as @s[nbt={Dimension:"stardust:stardust"}] at @s in stardust:celestial run tp @s ~ 475 ~
