
#> stardust:utils/snipers/damage
#
# @executed	as the player & at current position
#
# @within	stardust:utils/snipers/on_targeted_entity with storage stardust:temp input
#
# @args		target (unknown)
#			amount (unknown)
#			source (unknown)
#

$damage $(target) $(amount) stardust:sniper_bullet by $(source)

