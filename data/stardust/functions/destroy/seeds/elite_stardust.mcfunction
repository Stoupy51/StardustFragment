
#Replace the item to keep Motion
	execute if entity @s[tag=stardust.seed_done] run data modify entity @e[type=item,tag=stardust.drop,limit=1] Item set from storage stardust:main all.2013002
	data modify entity @e[type=item,nbt={Item:{tag:{stardust:{stardust_essence:1b}}}},limit=1,sort=nearest,distance=..1,tag=stardust.drop] Item.Count set value 4b
	execute unless entity @s[tag=stardust.seed_done] run data modify entity @e[type=item,tag=stardust.drop,limit=1] Item set from storage stardust:main all.2013204
