
#Replace the item to keep Motion
	execute if entity @s[tag=stardust.seed_done] as @e[type=item,tag=stardust.drop,limit=1] run function stardust:destroy/seeds/diamond_2
	execute unless entity @s[tag=stardust.seed_done] run data modify entity @e[type=item,tag=stardust.drop,limit=1] Item set from storage stardust:main all.2013200
