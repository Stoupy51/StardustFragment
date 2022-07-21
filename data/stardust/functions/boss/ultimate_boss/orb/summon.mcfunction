
summon marker 0 100 0 {Tags:["stardust.randomize_orb"]}
summon marker 0 100 0 {Tags:["stardust.randomize_orb"]}
summon marker 0 100 0 {Tags:["stardust.randomize_orb"]}
execute as @e[tag=stardust.randomize_orb] run function stardust:boss/ultimate_boss/orb/random_pos
team join stardust.team @e[tag=stardust.randomize_orb]
