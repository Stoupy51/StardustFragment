
#> stardust:custom_blocks/cobblestone_miner_lv1/minute
#
# @executed	at @s
#
# @within	stardust:custom_blocks/minute
#

# Stop if no cobblestone below
execute unless block ~ ~-1 ~ cobblestone run return fail

# Mine cobblestone directly below
setblock ~ ~-1 ~ air
playsound block.stone.break block @a[distance=..50]
particle block{"block_state":"cobblestone"} ~ ~-1 ~ .5 .5 .5 0 25 normal @a[distance=..50]
loot spawn ~ ~-1 ~ loot stardust:cobblestone_miner/lv1

