function stardust:supercraft/verif
execute at @e[type=item,nbt={Item:{Count:1b,tag:{ASB:1b}}},limit=1,sort=nearest,distance=..1] run scoreboard players add @s SF_X 1

scoreboard players add @s[scores={x=3}] SF_SCraft 6
scoreboard players remove @s[scores={SF_SCraft=0..}] SF_SCraft 5
scoreboard players reset @s[scores={SF_SCraft=..0}] SF_SCraft

execute as @s[scores={SF_SCraft=5..}] run summon item ~ ~ ~ {Motion:[0.0,1.0,0.0],Item:{id:"minecraft:leather_boots",Count:1b,tag:{Unbreakable:1b,BS:1b,AttributeModifiers:[{AttributeName:"generic.armor",Name:"generic.armor",Slot:"feet",Amount:3,Operation:0,UUID:[I;4,4,4,5]},{AttributeName:"generic.armor_toughness",Name:"generic.armor_toughness",Slot:"feet",Amount:3,Operation:0,UUID:[I;4,4,5,5]}],HideFlags:126,display:{"color":16753920,Name:'[{"text":"Bottes Solaires","italic":false,"color":"gold"}]'},Enchantments:[{lvl:10,id:"minecraft:feather_falling"},{lvl:10,id:"minecraft:fire_protection"},{lvl:6,id:"minecraft:protection"},{lvl:6,id:"minecraft:projectile_protection"},{lvl:6,id:"minecraft:blast_protection"}]}}}
execute as @s[scores={SF_SCraft=5..}] run kill @e[type=item,nbt={Item:{Count:1b,tag:{BO:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=5..}] run kill @e[type=item,nbt={Item:{Count:1b,tag:{ASB:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=5..}] run playsound block.anvil.use block @a[distance=..25]
execute as @s[scores={SF_SCraft=5..}] run particle smoke ~ ~ ~ 0.4 0.4 0.4 0.2 1000
kill @s[scores={SF_SCraft=5..}]
scoreboard players reset * x