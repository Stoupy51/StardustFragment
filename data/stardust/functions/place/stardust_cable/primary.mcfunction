
setblock ~ ~ ~ minecraft:air
setblock ~ ~ ~ minecraft:player_head{SkullOwner:{Id:[I;-1416541,25415515,-3515615,-4156415],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvOTE2MTcxZjY3ZGUxNzQxMzA4ZTUxYzNmNTBkODE1M2YzMmIzNDljNDYwODgxYzZjODM5ZTYwMTk1NDM1ODliMSJ9fX0="}]}},id:"minecraft:skull"}
summon item_frame ~ ~ ~ {ItemRotation:0b,Tags:["global.ignore","global.ignore.kill","smithed.block","stardust.destroyer","stardust.destroy_player_head","stardust.stardust_cable","simplenergy.cable","stardust.set_new","energy.cable"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"cobblestone",Count:1b,tag:{CustomModelData:2013400}}}
execute as @e[type=item_frame,tag=stardust.set_new,limit=1] at @s run function stardust:place/stardust_cable/secondary
kill @s
