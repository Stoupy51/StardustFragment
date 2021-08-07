function stardust:supercraft/verif
execute at @e[type=minecraft:item,nbt={Item:{Count:1b,tag:{ASB:1b}}},limit=1,sort=nearest,distance=..1] run scoreboard players add @s SF_X 1

scoreboard players add @s[scores={x=3}] SF_SCraft 6
scoreboard players remove @s[scores={SF_SCraft=0..}] SF_SCraft 5
scoreboard players reset @s[scores={SF_SCraft=..0}] SF_SCraft

execute as @s[scores={SF_SCraft=5..}] run summon item ~ ~ ~ {Motion:[0.0,1.0,0.0],Item:{id:"minecraft:diamond_pickaxe",Count:1b,tag:{PiL:1b,HideFlags:126,AttributeModifiers:[{AttributeName:"generic.attack_damage",Name:"generic.attack_damage",Slot:"mainhand",Amount:20,Operation:0,UUID:[I;5,5,5,5]}],display:{Lore:['{"text":" "}','[{"text":"[20 Dégâts par coup]","color":"white","italic":false}]'],Name:'[{"text":"Pioche Légendaire","color":"green","italic":false}]'},Enchantments:[{lvl:10,id:"minecraft:unbreaking"},{lvl:10,id:"minecraft:efficiency"},{lvl:1,id:"minecraft:fortune"}]}}}
execute as @s[scores={SF_SCraft=5..}] run kill @e[type=minecraft:item,nbt={Item:{Count:1b,tag:{PiO:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=5..}] run kill @e[type=minecraft:item,nbt={Item:{Count:1b,tag:{ASB:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=5..}] run playsound block.anvil.use block @a[distance=..25]
execute as @s[scores={SF_SCraft=5..}] run particle smoke ~ ~ ~ 0.4 0.4 0.4 0.2 1000
kill @s[scores={SF_SCraft=5..}]
scoreboard players reset * x