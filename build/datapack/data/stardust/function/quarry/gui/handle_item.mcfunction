
#> stardust:quarry/gui/handle_item
#
# @executed	as @e[tag=stardust.second] & at @s
#
# @within	stardust:quarry/gui/passive_slot {"slot":$(slot)}
#

summon item ~ ~ ~ {Item:{id:"minecraft:stone",count:1b,components:{"minecraft:custom_data":{"temp":true}}}}
data modify entity @n[type=item,nbt={Item:{components:{"minecraft:custom_data":{"temp":true}}}}] Item set from storage stardust:temp intruder

