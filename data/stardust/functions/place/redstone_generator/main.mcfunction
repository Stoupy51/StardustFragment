
scoreboard players set #success stardust.data 0
execute store success score #success stardust.data if entity @s[y_rotation=-46..45] run setblock ~ ~ ~ furnace[facing=north]{CustomName:'[{"text":"Redstone Generator"}]'}
execute if score #success stardust.data matches 0 store success score #success stardust.data if entity @s[y_rotation=45..135] run setblock ~ ~ ~ furnace[facing=east]{CustomName:'[{"text":"Redstone Generator"}]'}
execute if score #success stardust.data matches 0 store success score #success stardust.data if entity @s[y_rotation=135..225] run setblock ~ ~ ~ furnace[facing=south]{CustomName:'[{"text":"Redstone Generator"}]'}
execute if score #success stardust.data matches 0 store success score #success stardust.data if entity @s[y_rotation=225..315] run setblock ~ ~ ~ furnace[facing=west]{CustomName:'[{"text":"Redstone Generator"}]'}

scoreboard players set #success stardust.data 0
execute store success score #success stardust.data if entity @s[y_rotation=-46..45] run summon glow_item_frame ~ ~ ~ {ItemRotation:4b,Tags:["global.ignore","global.ignore.kill","smithed.block","stardust.destroyer","stardust.destroy_furnace","stardust.redstone_generator","energy.send","stardust.set_new"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"minecraft:barrel",Count:1b,tag:{CustomModelData:2013237}}}
execute if score #success stardust.data matches 0 store success score #success stardust.data if entity @s[y_rotation=45..135] run summon glow_item_frame ~ ~ ~ {ItemRotation:6b,Tags:["global.ignore","global.ignore.kill","smithed.block","stardust.destroyer","stardust.destroy_furnace","stardust.redstone_generator","energy.send","stardust.set_new"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"minecraft:barrel",Count:1b,tag:{CustomModelData:2013237}}}
execute if score #success stardust.data matches 0 store success score #success stardust.data if entity @s[y_rotation=135..225] run summon glow_item_frame ~ ~ ~ {ItemRotation:0b,Tags:["global.ignore","global.ignore.kill","smithed.block","stardust.destroyer","stardust.destroy_furnace","stardust.redstone_generator","energy.send","stardust.set_new"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"minecraft:barrel",Count:1b,tag:{CustomModelData:2013237}}}
execute if score #success stardust.data matches 0 store success score #success stardust.data if entity @s[y_rotation=225..315] run summon glow_item_frame ~ ~ ~ {ItemRotation:2b,Tags:["global.ignore","global.ignore.kill","smithed.block","stardust.destroyer","stardust.destroy_furnace","stardust.redstone_generator","energy.send","stardust.set_new"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"minecraft:barrel",Count:1b,tag:{CustomModelData:2013237}}}
execute as @e[type=glow_item_frame,tag=stardust.set_new,limit=1] at @s run function stardust:place/redstone_generator/secondary