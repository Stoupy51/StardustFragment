execute as @s[nbt={Dimension:"stardust:dungeon"}] run function stardust:dimensions/home
execute as @s[nbt={Dimension:"stardust:celestial"}] run advancement grant @s only stardust:visible/falling_celestial
execute as @s[nbt={Dimension:"stardust:celestial"}] at @s in minecraft:overworld run tp @s ~ 475 ~
execute as @s[nbt={Dimension:"stardust:stardust"}] run advancement grant @s only stardust:visible/falling_stardust
execute as @s[nbt={Dimension:"stardust:stardust"}] at @s in stardust:celestial run tp @s ~ 475 ~
