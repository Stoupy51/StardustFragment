
# Define a -/+ value offset randomly with UUID.
scoreboard players set #80 simplenergy.data 80
scoreboard players set #20 simplenergy.data 20
execute store result score X stardust.data run data get entity @s UUID[1] 1
execute store result score Y stardust.data run data get entity @s UUID[2] 1
execute store result score Z stardust.data run data get entity @s UUID[3] 1
scoreboard players operation X stardust.data %= #80 simplenergy.data
scoreboard players operation Y stardust.data %= #20 simplenergy.data
scoreboard players operation Z stardust.data %= #80 simplenergy.data
execute store result score PosX stardust.data run data get entity @s Pos[0] 1
execute store result score PosY stardust.data run data get entity @s Pos[1] 1
execute store result score PosZ stardust.data run data get entity @s Pos[2] 1

# I add the offset to the coordinates
scoreboard players operation PosX stardust.data += X stardust.data
scoreboard players operation PosY stardust.data += Y stardust.data
scoreboard players operation PosZ stardust.data += Z stardust.data
scoreboard players remove PosX stardust.data 40
scoreboard players remove PosZ stardust.data 40
execute store result entity @s Pos[0] double 1 run scoreboard players get PosX stardust.data
execute store result entity @s Pos[1] double 1 run scoreboard players get PosY stardust.data
execute store result entity @s Pos[2] double 1 run scoreboard players get PosZ stardust.data

execute at @s if block ~ ~ ~ #stardust:non_solid if block ~ ~-1 ~ #stardust:non_solid if block ~ ~1 ~ #stardust:non_solid if block ~ ~ ~1 #stardust:non_solid if block ~ ~ ~-1 #stardust:non_solid if block ~1 ~ ~ #stardust:non_solid if block ~-1 ~ ~ #stardust:non_solid run summon iron_golem ~ ~ ~ {Passengers:[{id:"minecraft:armor_stand",Glowing:1b,Invisible:1b,Invulnerable:1b,NoBasePlate:1b,NoGravity:1b,Marker:1b,ArmorItems:[{},{},{},{id:"cobblestone",Count:1b,tag:{Enchantments:[{id:"protection",lvl:0}],CustomModelData:2013397}}],Tags:["stardust.ultimate_orb"]}],Silent:1b,NoAI:1b,Health:1,Attributes:[{Name:"generic.max_health",Base:1}],DeathLootTable:"none",Team:"stardust.team",Tags:["stardust.ultimate_orb"],ActiveEffects:[{Id:14,Amplifier:0,Duration:2147483647,ShowParticles:0b}]}

# Kill and summon recursively if there is no orb
kill @s
execute unless entity @e[tag=stardust.ultimate_orb,limit=1] run function stardust:boss/ultimate_boss/orb/summon

