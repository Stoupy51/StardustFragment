
#> stardust:dimensions/end/done
#
# @within			stardust:dimensions/end/all
# @executed			default context
#
# @description		Function executed 2 seconds after the end initialization to finish the process.
#

# Teleport back the sample player to his original position
tp @a[tag=stardust.temp] @e[tag=stardust.load_end,limit=1]

# Remove chunk load if chunk wasn't forceloaded before
execute if score #chunk stardust.data matches 0 at @e[tag=stardust.load_end,limit=1] run forceload remove ~ ~
scoreboard players reset #chunk stardust.data

# Remove temporary entity and tags
kill @e[tag=stardust.load_end]
tag @a[tag=stardust.temp] remove stardust.temp

# Complete the process by setting the end as initialized and message the players
scoreboard players set #end_built stardust.data 2
tellraw @a [{"text":"[Stardust","color":"dark_aqua"},{"text":"Fragment] ","color":"aqua"},{"text":"The End has been initialized!","color":"white"}]

# Forceload the end portal (for Travel Staff)
execute in the_end run forceload add 600 600
execute in the_end positioned 600 -64 600 unless entity @e[tag=stardust.forceload,dx=15,dy=319,dz=15] run summon marker ~ ~ ~ {Tags:["stardust.forceload","global.forceload"]}
execute in the_end run setblock 600 255 600 end_portal

