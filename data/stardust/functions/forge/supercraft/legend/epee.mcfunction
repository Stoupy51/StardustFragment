function stardust:supercraft/verif
execute at @e[type=item,nbt={Item:{Count:1b,tag:{6C:1b}}},limit=1,sort=nearest,distance=..1] at @e[type=item,nbt={Item:{Count:4b,tag:{CStar:1b}}},limit=1,sort=nearest,distance=..1] run scoreboard players add @s SF_X 1

scoreboard players add @s[scores={x=3}] SF_SCraft 6
scoreboard players remove @s[scores={SF_SCraft=0..}] SF_SCraft 5
scoreboard players reset @s[scores={SF_SCraft=..0}] SF_SCraft

execute as @s[scores={SF_SCraft=5..}] run summon item ~ ~ ~ {Motion:[0.0,1.0,0.0],Item:{id:"minecraft:iron_sword",Count:1b,tag:{EL:1b,HideFlags:126,AttributeModifiers:[{AttributeName:"generic.attack_damage",Name:"generic.attack_damage",Slot:"mainhand",Amount:45,Operation:0,UUID:[I;5,5,5,5]}],display:{Lore:['{"text":" "}','[{"text":"[45 Dégâts par coup]","italic":false,"color":"white"}]'],Name:'[{"text":"Épée Légendaire","italic":false,"color":"green"}]'},Enchantments:[{lvl:10,id:"minecraft:unbreaking"},{lvl:5,id:"minecraft:looting"}]}}}
execute as @s[scores={SF_SCraft=5..}] run kill @e[type=item,nbt={Item:{Count:1b,tag:{EO:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=5..}] run kill @e[type=item,nbt={Item:{Count:1b,tag:{6C:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=5..}] run kill @e[type=item,nbt={Item:{Count:4b,tag:{CStar:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=5..}] run playsound block.anvil.use block @a[distance=..25]
execute as @s[scores={SF_SCraft=5..}] run particle smoke ~ ~ ~ 0.4 0.4 0.4 0.2 1000
kill @s[scores={SF_SCraft=5..}]
scoreboard players reset * x