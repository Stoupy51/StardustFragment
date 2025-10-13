
#> stardust:calls/simpledrawer/darkium/main
#
# @within	stardust:calls/simpledrawer/darkium/block
#			stardust:calls/simpledrawer/darkium/ingot
#

# Set score of material found to 1
scoreboard players set #success_material simpledrawer.io 1

# Set the convert counts
scoreboard players set #ingot_in_block simpledrawer.io 8
scoreboard players set #nugget_in_ingot simpledrawer.io 9

# Set the material data
data modify storage simpledrawer:io material set value {material: "stardust.darkium", material_name:'Darkium'}

# Fill the NBT with your own items
data modify storage simpledrawer:io material.block.item set from storage stardust:items all.darkium_block
data modify storage simpledrawer:io material.ingot.item set from storage stardust:items all.darkium_ingot

