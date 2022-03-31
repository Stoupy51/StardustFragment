
execute if score #forge_craft stardust.data matches 2 run particle dust 0 1 0 2 ~ ~ ~ 5 5 5 0.1 50
execute if score #forge_craft stardust.data matches 3 run particle dust 1 0.5 0 2 ~ ~ ~ 5 5 5 0.1 50
execute if score #forge_craft stardust.data matches 4 run particle dust 0 0 0 2 ~ ~ ~ 5 5 5 0.1 50
execute if entity @s[nbt={Item:{tag:{ctc:{id:"sextuple_compressed_cobblestone"}}}}] run particle dust 0 0 1 2 ~ ~ ~ 5 5 5 0.1 50
execute if entity @s[nbt={Item:{tag:{stardust:{stardust_bow:1b}}}}] run particle dust 1 0 0 2 ~ ~ ~ 5 5 5 0.1 50
execute if entity @s[nbt={Item:{tag:{stardust:{very_compacted_stardust:1b}}}}] run particle dust 0 0 1 2 ~ ~ ~ 5 5 5 0.1 50
execute if entity @s[nbt={Item:{tag:{stardust:{stardust_sniper:1b}}}}] run particle dust 1 0 0 2 ~ ~ ~ 5 5 5 0.1 50
execute if entity @s[nbt={Item:{id:"minecraft:dragon_egg"}}] run particle dust 1 1 1 2 ~ ~ ~ 5 5 5 0.1 50
execute if entity @s[nbt={Item:{id:"minecraft:diamond_block"}}] run particle dust 0 1 0 2 ~ ~ ~ 5 5 5 0.1 50
execute if entity @s[nbt={Item:{tag:{stardust:{ultimate_fragment:1b}}}}] run particle dust 255 255 255 2 ~ ~ ~ 5 5 5 0.1 50
