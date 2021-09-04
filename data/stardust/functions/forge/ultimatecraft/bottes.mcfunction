function stardust:ultimatecraft/verif
execute at @e[type=item,nbt={Item:{Count:32b,tag:{C:1b}}},limit=1,sort=nearest,distance=..1] at @e[type=item,nbt={Item:{Count:1b,tag:{7C:1b}}},limit=1,sort=nearest,distance=..1] at @e[type=item,nbt={Item:{Count:64b,tag:{ASB:1b}}},limit=1,sort=nearest,distance=..1] at @e[type=item,nbt={Item:{tag:{BT:1b}}},limit=1,sort=nearest,distance=..1] at @e[type=item,nbt={Item:{tag:{BS:1b}}},limit=1,sort=nearest,distance=..1] at @e[type=item,nbt={Item:{Count:2b,tag:{SCStar:1b}}},limit=1,sort=nearest,distance=..1] run scoreboard players add @s SF_X 1

scoreboard players add @s[scores={x=3}] SF_SCraft 6
scoreboard players remove @s[scores={SF_SCraft=0..}] SF_SCraft 5
scoreboard players reset @s[scores={SF_SCraft=..0}] SF_SCraft

execute as @s[scores={SF_SCraft=10..}] run summon item ~ ~ ~ {Motion:[0.0,1.0,0.0],Item:{id:"minecraft:netherite_boots",Count:1b,tag:{Unbreakable:1b,BUlt:1b,AttributeModifiers:[{AttributeName:"generic.armor",Name:"generic.armor",Slot:"feet",Amount:8,Operation:0,UUID:[I;4,4,4,5]},{AttributeName:"generic.armor_toughness",Name:"generic.armor_toughness",Slot:"feet",Amount:8,Operation:0,UUID:[I;4,4,5,5]}],HideFlags:126,display:{Name:'[{"text":"Bottes Ultimes","italic":false,"color":"dark_red"}]'},Enchantments:[{lvl:10,id:"minecraft:feather_falling"},{lvl:10,id:"minecraft:protection"},{lvl:10,id:"minecraft:fire_protection"},{lvl:10,id:"minecraft:projectile_protection"},{lvl:10,id:"minecraft:blast_protection"}]}}}
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=item,nbt={Item:{Count:32b,tag:{C:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=item,nbt={Item:{Count:1b,tag:{7C:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=item,nbt={Item:{Count:64b,tag:{ASB:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=item,nbt={Item:{tag:{BT:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=item,nbt={Item:{tag:{BS:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=item,nbt={Item:{Count:2b,tag:{SCStar:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run playsound block.anvil.use block @a[distance=..25]
execute as @s[scores={SF_SCraft=10..}] run particle smoke ~ ~ ~ 0.4 0.4 0.4 0.2 1000
execute as @s[scores={SF_SCraft=10..}] run tellraw @a ["",{"text":"\n[Stardust","italic":false,"color":"dark_aqua"},{"text":"Fragment] ","italic":false,"color":"aqua"},{"selector":"@p"},{"text":" vient de crafter des Bottes "},{"text":"U","italic":false,"color":"dark_purple"},{"text":"l","italic":false,"color":"blue"},{"text":"t","italic":false,"color":"dark_aqua"},{"text":"i","italic":false,"color":"aqua"},{"text":"m","italic":false,"color":"green"},{"text":"e","italic":false,"color":"yellow"},{"text":"s","italic":false,"color":"gold"},{"text":" !\n"}]
kill @s[scores={SF_SCraft=10..}]
scoreboard players reset * x