function stardust:ultimatecraft/verif
execute at @e[type=minecraft:item,nbt={Item:{Count:32b,tag:{C:1b}}},limit=1,sort=nearest,distance=..1] at @e[type=minecraft:item,nbt={Item:{Count:1b,tag:{7C:1b}}},limit=1,sort=nearest,distance=..1] at @e[type=minecraft:item,nbt={Item:{Count:64b,tag:{ASB:1b}}},limit=1,sort=nearest,distance=..1] at @e[type=minecraft:item,nbt={Item:{tag:{PiT:1b}}},limit=1,sort=nearest,distance=..1] at @e[type=minecraft:item,nbt={Item:{tag:{PiS:1b}}},limit=1,sort=nearest,distance=..1] at @e[type=minecraft:item,nbt={Item:{Count:2b,tag:{SCStar:1b}}},limit=1,sort=nearest,distance=..1] run scoreboard players add @s SF_X 1

scoreboard players add @s[scores={x=3}] SF_SCraft 6
scoreboard players remove @s[scores={SF_SCraft=0..}] SF_SCraft 5
scoreboard players reset @s[scores={SF_SCraft=..0}] SF_SCraft

execute as @s[scores={SF_SCraft=10..}] run summon item ~ ~ ~ {Motion:[0.0,1.0,0.0],Item:{id:"minecraft:netherite_pickaxe",Count:1b,tag:{Unbreakable:1b,PiUlt:1b,HideFlags:126,AttributeModifiers:[{AttributeName:"generic.attack_damage",Name:"generic.attack_damage",Slot:"mainhand",Amount:64,Operation:0,UUID:[I;5,5,5,5]}],display:{Lore:['{"text":" "}','[{"text":"[64 Dégâts par coup]","color":"white","italic":false}]'],Name:'[{"text":"Pioche Ultime","color":"dark_red","italic":false}]'},Enchantments:[{lvl:10,id:"minecraft:efficiency"},{lvl:5,id:"minecraft:fortune"}]}}}
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=minecraft:item,nbt={Item:{Count:32b,tag:{C:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=minecraft:item,nbt={Item:{Count:1b,tag:{7C:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=minecraft:item,nbt={Item:{Count:64b,tag:{ASB:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=minecraft:item,nbt={Item:{tag:{PiT:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=minecraft:item,nbt={Item:{tag:{PiS:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=minecraft:item,nbt={Item:{Count:2b,tag:{SCStar:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run playsound block.anvil.use block @a[distance=..25]
execute as @s[scores={SF_SCraft=10..}] run particle smoke ~ ~ ~ 0.4 0.4 0.4 0.2 1000
execute as @s[scores={SF_SCraft=10..}] run tellraw @a ["",{"text":"\n[Stardust","color":"dark_aqua"},{"text":"Fragment] ","color":"aqua"},{"selector":"@p"},{"text":" vient de crafter une Pioche "},{"text":"U","color":"dark_purple"},{"text":"l","color":"blue"},{"text":"t","color":"dark_aqua"},{"text":"i","color":"aqua"},{"text":"m","color":"green"},{"text":"e","color":"yellow"},{"text":" ","color":"gold"},{"text":"!\n"}]
kill @s[scores={SF_SCraft=10..}]
scoreboard players reset * x