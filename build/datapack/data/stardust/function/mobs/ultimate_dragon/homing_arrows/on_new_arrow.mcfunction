
#> stardust:mobs/ultimate_dragon/homing_arrows/on_new_arrow
#
# @executed	positioned ~ ~5 ~
#
# @within	stardust:mobs/ultimate_dragon/homing_arrows/summon_all {effect:"slowness"} [ positioned ~ ~5 ~ ]
#			stardust:mobs/ultimate_dragon/homing_arrows/summon_all {effect:"poison"} [ positioned ~5 ~ ~5 ]
#			stardust:mobs/ultimate_dragon/homing_arrows/summon_all {effect:"wither"} [ positioned ~-5 ~ ~5 ]
#			stardust:mobs/ultimate_dragon/homing_arrows/summon_all {effect:"darkness"} [ positioned ~5 ~ ~-5 ]
#			stardust:mobs/ultimate_dragon/homing_arrows/summon_all {effect:"levitation"} [ positioned ~-5 ~ ~-5 ]
#
# @args		effect (string)
#

# Add tags
tag @s add stardust.short_lived_entity
tag @s add stardust.homing_arrow

# Set arrow damage & pickup (creative only)
data modify entity @s damage set value 6.0d
data modify entity @s pickup set value 2b

# Set motion towards facing direction
function stardust:utils/compute_motion_towards {towards:1500,scale:0.001}

# Add effect to arrow (using macro)
$data modify entity @s item.components."minecraft:potion_contents".custom_effects set value [{id:"minecraft:$(effect)",duration:100,amplifier:1}]

