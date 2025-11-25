
#> stardust:utils/use_durability/item_modifier
#
# @executed	as the player & at current position
#
# @within	stardust:utils/use_durability/main with storage stardust:temp
#
# @args		use_durability (unknown)
#

$item modify entity @s weapon {"function": "minecraft:set_damage","damage": $(use_durability),"add": true}

