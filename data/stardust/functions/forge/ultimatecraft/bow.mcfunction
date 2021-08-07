function stardust:ultimatecraft/verif
execute at @e[type=minecraft:item,nbt={Item:{Count:32b,tag:{C:1b}}},limit=1,sort=nearest,distance=..1] at @e[type=minecraft:item,nbt={Item:{Count:1b,tag:{7C:1b}}},limit=1,sort=nearest,distance=..1] at @e[type=minecraft:item,nbt={Item:{Count:64b,tag:{ASB:1b}}},limit=1,sort=nearest,distance=..1] at @e[type=minecraft:item,nbt={Item:{Count:32b,tag:{EDP:1b}}},limit=1,sort=nearest,distance=..1] at @e[type=minecraft:item,nbt={Item:{id:"minecraft:netherite_ingot",Count:64b}},limit=1,sort=nearest,distance=..1] at @e[type=minecraft:item,nbt={Item:{Count:2b,tag:{SCStar:1b}}},limit=1,sort=nearest,distance=..1] run scoreboard players add @s SF_X 1

scoreboard players add @s[scores={x=3}] SF_SCraft 6
scoreboard players remove @s[scores={SF_SCraft=0..}] SF_SCraft 5
scoreboard players reset @s[scores={SF_SCraft=..0}] SF_SCraft

execute as @s[scores={SF_SCraft=10..}] run summon item ~ ~ ~ {Motion:[0.0,1.0,0.0],Item:{id:"minecraft:bow",Count:1b,tag:{Unbreakable:1b,AUlt:1b,HideFlags:127,display:{Lore:['[{"text":"Power CXXIII","italic":false,"color":"gray"}]','[{"text":"Flame CXXIII","italic":false,"color":"gray"}]','[{"text":"Looting X","italic":false,"color":"gray"}]','[{"text":"Fortune X","italic":false,"color":"gray"}]','[{"text":"Infinity","italic":false,"color":"gray"}]','{"text":" "}','[{"text":"[Incassable]","italic":false,"color":"white"}]'],Name:'[{"text":"Ultimate Bow","color":"dark_red","italic":false}]'},Enchantments:[{lvl:123,id:"minecraft:power"},{lvl:123,id:"minecraft:flame"},{lvl:10,id:"minecraft:looting"},{lvl:10,id:"minecraft:fortune"},{lvl:1,id:"minecraft:infinity"}]}}}
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=minecraft:item,nbt={Item:{Count:32b,tag:{C:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=minecraft:item,nbt={Item:{Count:1b,tag:{7C:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=minecraft:item,nbt={Item:{Count:64b,tag:{ASB:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=minecraft:item,nbt={Item:{Count:32b,tag:{EDP:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:netherite_ingot",Count:64b}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=minecraft:item,nbt={Item:{Count:2b,tag:{SCStar:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run playsound block.anvil.use block @a[distance=..25]
execute as @s[scores={SF_SCraft=10..}] run particle smoke ~ ~ ~ 0.4 0.4 0.4 0.2 1000
execute as @s[scores={SF_SCraft=10..}] run tellraw @a ["",{"text":"\n[Stardust","color":"dark_aqua"},{"text":"Fragment] ","color":"aqua"},{"selector":"@p"},{"text":" vient de crafter un "},{"text":"U","color":"dark_purple"},{"text":"l","color":"blue"},{"text":"t","color":"dark_aqua"},{"text":"i","color":"aqua"},{"text":"m","color":"green"},{"text":"a","color":"yellow"},{"text":"t","color":"gold"},{"text":"e","color":"dark_red"},{"text":" B","color":"dark_purple"},{"text":"o","color":"blue"},{"text":"w","color":"dark_aqua"},{"text":" !\n"}]
kill @s[scores={SF_SCraft=10..}]
scoreboard players reset * x