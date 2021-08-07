summon minecraft:item 0 90 0 {Glowing:1,NoGravity:1b,Item:{id:"minecraft:cobblestone",Count:64b,tag:{SF_Give:1b}}}
data modify entity @e[type=minecraft:item,nbt={Item:{tag:{SF_Give:1b}}},limit=1] Item set from storage stardust:items 2013012

execute as @a[nbt={Dimension:"stardust:ultimate"}] at @s run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:cobblestone",Count:64b,tag:{SF_Give:1b}},Tags:["SF_GiveConfig"]}
execute as @e[type=minecraft:item,nbt={Item:{tag:{SF_Give:1b}}}] run data modify entity @s Item set from storage stardust:items 2013003
execute as @e[type=minecraft:item,tag=SF_GiveConfig] run data modify entity @s Item.Count set value 5
execute as @a[nbt={Dimension:"stardust:ultimate"}] at @s run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:cobblestone",Count:64b,tag:{SF_Give:1b}},Tags:["SF_GiveAwak"]}
execute as @e[type=minecraft:item,nbt={Item:{tag:{SF_Give:1b}}}] run data modify entity @s Item set from storage stardust:items 2013005
execute as @e[type=minecraft:item,tag=SF_GiveAwak] run data modify entity @s Item.Count set value 32

tellraw @a ["",{"text":"\n[Stardust","color":"dark_aqua"},{"text":"Fragment] ","color":"aqua"},{"text":"The "},{"text":"U","color":"dark_purple"},{"text":"l","color":"blue"},{"text":"t","color":"dark_aqua"},{"text":"i","color":"aqua"},{"text":"m","color":"green"},{"text":"a","color":"yellow"},{"text":"t","color":"gold"},{"text":"e","color":"dark_red"},{"text":" B","color":"dark_purple"},{"text":"o","color":"blue"},{"text":"s","color":"dark_aqua"},{"text":"s","color":"aqua"},{"text":" has been defeated! Congratulations!\n"}]
execute as @a at @s run playsound minecraft:entity.wither.spawn master @s
kill @e[type=minecraft:ender_dragon,tag=SF_Dragon]
scoreboard players reset UltimateBossKilled SF_Data
scoreboard players reset UltimateBoss SF_Data
