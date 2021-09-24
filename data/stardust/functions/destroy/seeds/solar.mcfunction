#Replace the item to keep Motion
    execute as @s[tag=SF_SeedDone] run data modify entity @e[type=item,tag=SF_Drop,limit=1] Item set from storage stardust:items 2013009
    execute unless entity @s[tag=SF_SeedDone] run data modify entity @e[type=item,tag=SF_Drop,limit=1] Item set from storage stardust:items 2013206
