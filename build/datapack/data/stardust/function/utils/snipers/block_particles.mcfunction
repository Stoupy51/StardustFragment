
#> stardust:utils/snipers/block_particles
#
# @executed	as the player & at current position
#
# @within	stardust:utils/snipers/on_targeted_block with storage stardust:temp block_particles
#
# @args		block (string)
#			x (int)
#			y (int)
#			z (int)
#

$particle block{block_state:"$(block)"} $(x) $(y) $(z) 0.1 0.1 0.1 1 10 force @a[distance=..128]

