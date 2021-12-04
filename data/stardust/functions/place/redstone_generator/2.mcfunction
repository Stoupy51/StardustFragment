execute as @a[tag=SF_Placer,y_rotation=-46..45] run setblock ~ ~ ~ furnace[facing=north]{CustomName:'[{"text":"Redstone Generator"}]'}
execute as @a[tag=SF_Placer,y_rotation=46..135] run setblock ~ ~ ~ furnace[facing=east]{CustomName:'[{"text":"Redstone Generator"}]'}
execute as @a[tag=SF_Placer,y_rotation=136..225] run setblock ~ ~ ~ furnace[facing=south]{CustomName:'[{"text":"Redstone Generator"}]'}
execute as @a[tag=SF_Placer,y_rotation=226..315] run setblock ~ ~ ~ furnace[facing=west]{CustomName:'[{"text":"Redstone Generator"}]'}
execute as @a[tag=SF_Placer,y_rotation=-46..45] run summon glow_item_frame ~ ~ ~ {ItemRotation:4b,Tags:["SF_Destroyer","SF_DestroyFurnace","SF_RedstoneGenerator","EF_Use","EF_CanSend","SF_SetNew"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"minecraft:barrel",Count:1b,tag:{CustomModelData:2013237}}}
execute as @a[tag=SF_Placer,y_rotation=46..135] run summon glow_item_frame ~ ~ ~ {ItemRotation:6b,Tags:["SF_Destroyer","SF_DestroyFurnace","SF_RedstoneGenerator","EF_Use","EF_CanSend","SF_SetNew"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"minecraft:barrel",Count:1b,tag:{CustomModelData:2013237}}}
execute as @a[tag=SF_Placer,y_rotation=136..225] run summon glow_item_frame ~ ~ ~ {ItemRotation:0b,Tags:["SF_Destroyer","SF_DestroyFurnace","SF_RedstoneGenerator","EF_Use","EF_CanSend","SF_SetNew"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"minecraft:barrel",Count:1b,tag:{CustomModelData:2013237}}}
execute as @a[tag=SF_Placer,y_rotation=226..315] run summon glow_item_frame ~ ~ ~ {ItemRotation:2b,Tags:["SF_Destroyer","SF_DestroyFurnace","SF_RedstoneGenerator","EF_Use","EF_CanSend","SF_SetNew"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"minecraft:barrel",Count:1b,tag:{CustomModelData:2013237}}}
function energy_flux:wire_update
kill @s
