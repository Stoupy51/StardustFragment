
#> stardust:utils/snipers/on_targeted_block
#
# @executed	as the player & at current position
#
# @within	stardust:utils/snipers/raycast_in_your_ass
#

# Stop the raycast here
scoreboard players set $raycast.piercing bs.lambda 0

# Get current block (https://docs.mcbookshelf.dev/en/latest/modules/block.html#get)
data modify storage stardust:temp Pos set from entity @s Pos
data modify entity @s Pos set from storage bs:lambda raycast.targeted_block
execute at @s run function #bs.block:get_block
data modify entity @s Pos set from storage stardust:temp Pos

# Make block particles
data modify storage stardust:temp block_particles set value {x:0,y:0,z:0,block:"minecraft:air"}
data modify storage stardust:temp block_particles.block set from storage bs:out block.type
data modify storage stardust:temp block_particles.x set from storage bs:lambda raycast.hit_point[0]
data modify storage stardust:temp block_particles.y set from storage bs:lambda raycast.hit_point[1]
data modify storage stardust:temp block_particles.z set from storage bs:lambda raycast.hit_point[2]
function stardust:utils/snipers/block_particles with storage stardust:temp block_particles

# Particles towards the player
scoreboard players set #limit stardust.data 1280
data modify entity @s Pos set from storage bs:lambda raycast.hit_point
execute at @s as @p[tag=stardust.shooter] facing entity @s eyes run function stardust:utils/snipers/particle_trail
data modify entity @s Pos set from storage stardust:temp Pos

