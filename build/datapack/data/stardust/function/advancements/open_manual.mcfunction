
#> stardust:advancements/open_manual
#
# @executed	as the player & at current position
#
# @within	advancement stardust:open_manual
#

# Revoke advancement and reset score
advancement revoke @s only stardust:open_manual
scoreboard players set @s stardust.open_manual 0

# Show manual dialog if holding the manual
execute if items entity @s weapon.* *[custom_data~{stardust:{manual:true}}] run dialog show @s stardust:manual/page_1

