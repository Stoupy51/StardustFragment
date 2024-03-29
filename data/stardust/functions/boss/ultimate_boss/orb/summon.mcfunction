
#> stardust:boss/ultimate_boss/orb/summon
#
# @within			stardust:boss/ultimate_boss/tick_second
# @within			stardust:boss/ultimate_boss/orb/random_pos
# @executed			in stardust:ultimate
#
# @description		Spawns 3 orbs at random positions and adds them to the team "stardust.team"
#

execute positioned 0 100 0 summon marker run function stardust:boss/ultimate_boss/orb/random_pos
execute positioned 0 100 0 summon marker run function stardust:boss/ultimate_boss/orb/random_pos
execute positioned 0 100 0 summon marker run function stardust:boss/ultimate_boss/orb/random_pos
team join stardust.team @e[tag=stardust.randomize_orb]

