
setblock ~ ~ ~ air
setblock ~ ~ ~ player_head{SkullOwner:{Id:[I;-1416541,25415515,-3515615,-4156415],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYzQ4NGE3OGU4YTY5YjZhYWUwNmQ3ZTI2OWM3NWJjZjkxM2U4ZWY3ZDU1Y2Q3ZjY2MjZiZTZjOWIwZjQ2OGQ5MyJ9fX0="}]}},id:"minecraft:skull"}
execute align xyz positioned ~.5 ~.01 ~.5 summon item_display at @s run function stardust:place/ultimate_cable/secondary
kill @s

