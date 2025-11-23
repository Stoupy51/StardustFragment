
#> stardust:utils/home_travel_staff/fail
#
# @executed	as @a & at @s
#
# @within	stardust:utils/home_travel_staff/check
#

tellraw @s {"translate": "stardust_fragment_teleportation_cancelled_because_you_moved","color":"red"}
playsound entity.villager.no ambient @s

