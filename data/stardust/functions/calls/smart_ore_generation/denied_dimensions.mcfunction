
#> smart_ore_generation:v1.1/signals/denied_dimensions
#
# @within			#smart_ore_generation:v1/signals/denied_dimensions
# @executed			as & at the player who triggered the event
# @input score		#authorized smart_ore_generation.data equals to 1 or 0 if another datapack has already denied generation
#
# @english_WARNING
# - You must check the #authorized score matching 1 before executing any commands to prevent reenable generation in a dimension that is disabled by another datapack.
# - Putting the #authorized score to 0 will disable generation in the dimension for every datapack.
#
# @french_WARNING
# - Vous devez vérifier que le score #authorized vaut 1 avant d'exécuter des commandes pour éviter de réactiver la génération dans une dimension qui est désactivée par un autre datapack.
# - Mettre le score #authorized à 0 désactivera la génération dans la dimension pour tous les datapacks.

# Disable in Dungeon and Ultimate dimensions
execute if score #authorized smart_ore_generation.data matches 1 if predicate stardust:in_dim/dungeon run scoreboard players set #authorized smart_ore_generation.data 0
execute if score #authorized smart_ore_generation.data matches 1 if predicate stardust:in_dim/ultimate run scoreboard players set #authorized smart_ore_generation.data 0

