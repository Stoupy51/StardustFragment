execute as @a[tag=SF_Placer,y_rotation=-46..45] run setblock ~ ~ ~ furnace[facing=north]{CustomName:'[{"text":"Advanced Furnace Generator"}]'}
execute as @a[tag=SF_Placer,y_rotation=46..135] run setblock ~ ~ ~ furnace[facing=east]{CustomName:'[{"text":"Advanced Furnace Generator"}]'}
execute as @a[tag=SF_Placer,y_rotation=136..225] run setblock ~ ~ ~ furnace[facing=south]{CustomName:'[{"text":"Advanced Furnace Generator"}]'}
execute as @a[tag=SF_Placer,y_rotation=226..315] run setblock ~ ~ ~ furnace[facing=west]{CustomName:'[{"text":"Advanced Furnace Generator"}]'}
execute as @a[tag=SF_Placer,y_rotation=-46..45] run summon glow_item_frame ~ ~ ~ {ItemRotation:4b,Tags:["SF_Destroyer","SF_DestroyFurnace","SF_AdvancedFurnaceGenerator","energy.send","SF_SetNew"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"minecraft:barrel",Count:1b,tag:{CustomModelData:2013242}}}
execute as @a[tag=SF_Placer,y_rotation=46..135] run summon glow_item_frame ~ ~ ~ {ItemRotation:6b,Tags:["SF_Destroyer","SF_DestroyFurnace","SF_AdvancedFurnaceGenerator","energy.send","SF_SetNew"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"minecraft:barrel",Count:1b,tag:{CustomModelData:2013242}}}
execute as @a[tag=SF_Placer,y_rotation=136..225] run summon glow_item_frame ~ ~ ~ {ItemRotation:0b,Tags:["SF_Destroyer","SF_DestroyFurnace","SF_AdvancedFurnaceGenerator","energy.send","SF_SetNew"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"minecraft:barrel",Count:1b,tag:{CustomModelData:2013242}}}
execute as @a[tag=SF_Placer,y_rotation=226..315] run summon glow_item_frame ~ ~ ~ {ItemRotation:2b,Tags:["SF_Destroyer","SF_DestroyFurnace","SF_AdvancedFurnaceGenerator","energy.send","SF_SetNew"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"minecraft:barrel",Count:1b,tag:{CustomModelData:2013242}}}
#Call on a new machine to initialize its connections
execute align xyz as @e[type=glow_item_frame,dx=0,dy=0,dz=0,limit=1,tag=SF_SetNew,tag=!energy.cable] at @s run function energy:v1/api/init_machine
kill @s
