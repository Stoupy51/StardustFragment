
#> stardust:utils/snipers/on_targeted_entity
#
# @executed	as the player & at current position
#
# @within	stardust:utils/snipers/raycast_in_your_ass
#

# Damage the entity
function stardust:utils/snipers/damage with storage stardust:temp input

# Blood particles
particle block{block_state:"redstone_wire"} ~ ~1 ~ 0.35 0.5 0.35 0 100 force @a[distance=..128]

