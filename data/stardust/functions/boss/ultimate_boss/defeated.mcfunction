
summon item 0 90 0 {Glowing:1,NoGravity:1b,Item:{id:"cobblestone",Count:64b,tag:{stardust.give:1b}}}
data modify entity @e[type=item,nbt={Item:{tag:{stardust.give:1b}}},limit=1] Item set from storage stardust:main all.2013012

execute as @a[nbt={Dimension:"stardust:ultimate"}] at @s run summon item ~ ~ ~ {Item:{id:"minecraft:cobblestone",Count:64b,tag:{stardust.give:1b}},Tags:["stardust.giveConfig"]}
execute as @e[type=item,nbt={Item:{tag:{stardust.give:1b}}}] run data modify entity @s Item set from storage stardust:main all.2013003
execute as @e[type=item,tag=stardust.giveConfig] run data modify entity @s Item.Count set value 5
execute as @a[nbt={Dimension:"stardust:ultimate"}] at @s run summon item ~ ~ ~ {Item:{id:"minecraft:cobblestone",Count:64b,tag:{stardust.give:1b}},Tags:["stardust.giveAwak"]}
execute as @e[type=item,nbt={Item:{tag:{stardust.give:1b}}}] run data modify entity @s Item set from storage stardust:main all.2013005
execute as @e[type=item,tag=stardust.giveAwak] run data modify entity @s Item.Count set value 32

tellraw @a ["",{"text":"\n[Stardust","italic":false,"color":"dark_aqua"},{"text":"Fragment] ","italic":false,"color":"aqua"},{"text":"The "},{"text":"U","italic":false,"color":"dark_purple"},{"text":"l","italic":false,"color":"blue"},{"text":"t","italic":false,"color":"dark_aqua"},{"text":"i","italic":false,"color":"aqua"},{"text":"m","italic":false,"color":"green"},{"text":"a","italic":false,"color":"yellow"},{"text":"t","italic":false,"color":"gold"},{"text":"e","italic":false,"color":"dark_red"},{"text":" B","italic":false,"color":"dark_purple"},{"text":"o","italic":false,"color":"blue"},{"text":"s","italic":false,"color":"dark_aqua"},{"text":"s","italic":false,"color":"aqua"},{"text":" has been defeated! Congratulations!\n"}]
execute as @a at @s run playsound entity.wither.spawn master @s
kill @e[type=ender_dragon,tag=stardust.dragon]
kill @e[type=shulker,tag=stardust.ultimate_orb]
kill @e[type=armor_stand,tag=stardust.ultimate_orb]
kill @e[type=minecraft:end_crystal,y=0]
scoreboard players reset UltimateBossKilled stardust.data
scoreboard players reset #ultimate_boss stardust.data
execute in stardust:ultimate run function stardust:dimensions/structure/ultimate
