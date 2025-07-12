
#> stardust:v3.5.0/load/enumerate
#
# @within	#stardust:enumerate
#

# If current major is too low, set it to the current major
execute unless score #stardust.major load.status matches 3.. run scoreboard players set #stardust.major load.status 3

# If current minor is too low, set it to the current minor (only if major is correct)
execute if score #stardust.major load.status matches 3 unless score #stardust.minor load.status matches 5.. run scoreboard players set #stardust.minor load.status 5

# If current patch is too low, set it to the current patch (only if major and minor are correct)
execute if score #stardust.major load.status matches 3 if score #stardust.minor load.status matches 5 unless score #stardust.patch load.status matches 0.. run scoreboard players set #stardust.patch load.status 0

