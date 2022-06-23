
setblock ~ ~ ~ air
playsound block.stone.break block @a[distance=..50]
particle block cobblestone ~.5 ~.5 ~.5 .5 .5 .5 0 25 normal @a[distance=..50]

execute if entity @s[tag=stardust.cobblestone_miner_lv1] run loot spawn ~ ~ ~ loot stardust:cobblestone_miner/lv1
execute if entity @s[tag=stardust.cobblestone_miner_lv2] run loot spawn ~ ~ ~ loot stardust:cobblestone_miner/lv2
execute if entity @s[tag=stardust.cobblestone_miner_lv3] run loot spawn ~ ~ ~ loot stardust:cobblestone_miner/lv3
execute if entity @s[tag=stardust.cobblestone_miner_lv4] run loot spawn ~ ~ ~ loot stardust:cobblestone_miner/lv4
execute if entity @s[tag=stardust.cobblestone_miner_lv5] run loot spawn ~ ~ ~ loot stardust:cobblestone_miner/lv5
