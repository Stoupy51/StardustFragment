
#Advancement
advancement grant @a[distance=..200] only stardust:visible/adventure/ultimate_boss
execute as @a[distance=..200] unless score @s stardust.damage_taken_ub matches 200.. run advancement grant @s only stardust:visible/adventure/ultimate_boss_ez
scoreboard objectives remove stardust.damage_taken_ub

#Ultimate Core + Players drop
summon item 0 90 0 {Glowing:1,NoGravity:1b,Item:{id:"cobblestone",Count:64b,tag:{stardust:{give:1b}}}}
data modify entity @e[type=item,nbt={Item:{tag:{stardust:{give:1b}}}},limit=1] Item set from storage stardust:main all.2013012
execute as @a[nbt={Dimension:"stardust:ultimate"}] at @s run loot give @s loot stardust:ultimate_boss

#Reseting things
kill @e[tag=stardust.dragon]
kill @e[tag=stardust.ultimate_orb]
kill @e[type=end_crystal,predicate=stardust:in_dim/stardust]
kill @e[type=fireball,predicate=stardust:in_dim/stardust]
kill @e[type=arrow,predicate=stardust:in_dim/stardust]
tellraw @a ["",{"text":"\n[Stardust","italic":false,"color":"dark_aqua"},{"text":"Fragment] ","italic":false,"color":"aqua"},{"text":"The "},{"text":"U","italic":false,"color":"dark_purple"},{"text":"l","italic":false,"color":"blue"},{"text":"t","italic":false,"color":"dark_aqua"},{"text":"i","italic":false,"color":"aqua"},{"text":"m","italic":false,"color":"green"},{"text":"a","italic":false,"color":"yellow"},{"text":"t","italic":false,"color":"gold"},{"text":"e","italic":false,"color":"dark_red"},{"text":" B","italic":false,"color":"dark_purple"},{"text":"o","italic":false,"color":"blue"},{"text":"s","italic":false,"color":"dark_aqua"},{"text":"s","italic":false,"color":"aqua"},{"text":" has been defeated! Congratulations!\n"}]
execute in stardust:ultimate run function stardust:dimensions/structure/ultimate
execute as @a at @s run playsound entity.wither.spawn master @s
scoreboard players reset #ultimate_boss_killed stardust.data
scoreboard players reset #ultimate_boss stardust.data
bossbar remove stardust:ultimate_boss
