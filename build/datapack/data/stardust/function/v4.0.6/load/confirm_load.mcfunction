
#> stardust:v4.0.6/load/confirm_load
#
# @within	stardust:v4.0.6/load/valid_dependencies
#

# Bow shooting detection
scoreboard objectives add stardust.bow_shoot minecraft.used:minecraft.bow

# Ender Pearl detection
scoreboard objectives add stardust.ender_pearl minecraft.used:minecraft.ender_pearl

# Travel Staff Logic
scoreboard objectives add stardust.travel_staff_cooldown dummy
scoreboard objectives add stardust.travel_x dummy
scoreboard objectives add stardust.travel_y dummy
scoreboard objectives add stardust.travel_z dummy

# Life Crystal tracker
scoreboard objectives add stardust.life_crystal dummy

# Death detection
scoreboard objectives add stardust.death deathCount

# Right click detection
scoreboard objectives add stardust.right_click minecraft.used:minecraft.warped_fungus_on_a_stick
scoreboard objectives add stardust.cooldown dummy

# Boss music timers
scoreboard objectives add stardust.boss_music dummy

# Snipers objectives
scoreboard objectives add stardust.sniper_cooldown dummy

# Ultimate Dragon bossbar & objectives
scoreboard objectives add stardust.lingering_potion minecraft.used:minecraft.lingering_potion
scoreboard objectives add stardust.chosen_attack dummy
scoreboard objectives add stardust.attack_cooldown dummy
bossbar add stardust:ultimate_dragon [{"text": "U", "color": "#ff0000", "italic": false}, {"text": "l", "color": "#ff6600"}, {"text": "t", "color": "#ffcc00"}, {"text": "i", "color": "#ccff00"}, {"text": "m", "color": "#65ff00"}, {"text": "a", "color": "#00ff00"}, {"text": "t", "color": "#00ff65"}, {"text": "e", "color": "#00ffcb"}, {"text": " ", "color": "#00cbff"}, {"text": "D", "color": "#0065ff"}, {"text": "r", "color": "#0000ff"}, {"text": "a", "color": "#6600ff"}, {"text": "g", "color": "#cb00ff"}, {"text": "o", "color": "#ff00cb"}, {"text": "n", "color": "#ff0066"}]
bossbar set stardust:ultimate_dragon name [{"text": "U", "color": "#ff0000", "italic": false}, {"text": "l", "color": "#ff6600"}, {"text": "t", "color": "#ffcc00"}, {"text": "i", "color": "#ccff00"}, {"text": "m", "color": "#65ff00"}, {"text": "a", "color": "#00ff00"}, {"text": "t", "color": "#00ff65"}, {"text": "e", "color": "#00ffcb"}, {"text": " ", "color": "#00cbff"}, {"text": "D", "color": "#0065ff"}, {"text": "r", "color": "#0000ff"}, {"text": "a", "color": "#6600ff"}, {"text": "g", "color": "#cb00ff"}, {"text": "o", "color": "#ff00cb"}, {"text": "n", "color": "#ff0066"}]
bossbar set stardust:ultimate_dragon style notched_20
bossbar set stardust:ultimate_dragon color yellow
bossbar set stardust:ultimate_dragon max 1024

# Stardust Guardian bossbar
bossbar add stardust:stardust_guardian [{"text": "S", "color": "#8b0000", "italic": false}, {"text": "t", "color": "#8d0006"}, {"text": "a", "color": "#90000c"}, {"text": "r", "color": "#920113"}, {"text": "d", "color": "#950119"}, {"text": "u", "color": "#98011f"}, {"text": "s", "color": "#9a0226"}, {"text": "t", "color": "#9d022c"}, {"text": " ", "color": "#a00333"}, {"text": "G", "color": "#a20339"}, {"text": "u", "color": "#a5033f"}, {"text": "a", "color": "#a70446"}, {"text": "r", "color": "#aa044c"}, {"text": "d", "color": "#ad0452"}, {"text": "i", "color": "#af0559"}, {"text": "a", "color": "#b2055f"}, {"text": "n", "color": "#b50666"}]
bossbar set stardust:stardust_guardian name [{"text": "S", "color": "#8b0000", "italic": false}, {"text": "t", "color": "#8d0006"}, {"text": "a", "color": "#90000c"}, {"text": "r", "color": "#920113"}, {"text": "d", "color": "#950119"}, {"text": "u", "color": "#98011f"}, {"text": "s", "color": "#9a0226"}, {"text": "t", "color": "#9d022c"}, {"text": " ", "color": "#a00333"}, {"text": "G", "color": "#a20339"}, {"text": "u", "color": "#a5033f"}, {"text": "a", "color": "#a70446"}, {"text": "r", "color": "#aa044c"}, {"text": "d", "color": "#ad0452"}, {"text": "i", "color": "#af0559"}, {"text": "a", "color": "#b2055f"}, {"text": "n", "color": "#b50666"}]
bossbar set stardust:stardust_guardian style notched_12
bossbar set stardust:stardust_guardian color red
bossbar set stardust:stardust_guardian max 1024

# Stardust Pillar bossbar
bossbar add stardust:stardust_pillar [{"text": "S", "color": "#198534", "italic": false}, {"text": "t", "color": "#198537"}, {"text": "a", "color": "#19863b"}, {"text": "r", "color": "#1a873e"}, {"text": "d", "color": "#1a8842"}, {"text": "u", "color": "#1a8945"}, {"text": "s", "color": "#1b8949"}, {"text": "t", "color": "#1b8a4c"}, {"text": " ", "color": "#1b8b50"}, {"text": "P", "color": "#1c8c54"}, {"text": "i", "color": "#1c8d57"}, {"text": "l", "color": "#1d8d5b"}, {"text": "l", "color": "#1d8e5e"}, {"text": "a", "color": "#1d8f62"}, {"text": "r", "color": "#1e9065"}, {"text": " ", "color": "#1e9169"}, {"text": "(", "color": "#1e916d"}, {"text": "A", "color": "#1f9270"}, {"text": "c", "color": "#1f9374"}, {"text": "t", "color": "#1f9477"}, {"text": "i", "color": "#20957b"}, {"text": "v", "color": "#20957e"}, {"text": "e", "color": "#219682"}, {"text": " ", "color": "#219786"}, {"text": "S", "color": "#219889"}, {"text": "h", "color": "#22998d"}, {"text": "i", "color": "#229990"}, {"text": "e", "color": "#229a94"}, {"text": "l", "color": "#239b97"}, {"text": "d", "color": "#239c9b"}, {"text": ")", "color": "#249d9f"}]
bossbar set stardust:stardust_pillar style notched_10
bossbar set stardust:stardust_pillar color blue
bossbar set stardust:stardust_pillar max 500

# Stoup Army bossbar
bossbar add stardust:stoup_army [{"text": "S", "color": "#743d2b", "italic": false}, {"text": "t", "color": "#7d4531"}, {"text": "o", "color": "#864d37"}, {"text": "u", "color": "#8f563d"}, {"text": "p", "color": "#985e43"}, {"text": " ", "color": "#a1664a"}, {"text": "A", "color": "#aa6f50"}, {"text": "r", "color": "#b37756"}, {"text": "m", "color": "#bc7f5c"}, {"text": "y", "color": "#c68863"}]
bossbar set stardust:stoup_army name [{"text": "S", "color": "#743d2b", "italic": false}, {"text": "t", "color": "#7d4531"}, {"text": "o", "color": "#864d37"}, {"text": "u", "color": "#8f563d"}, {"text": "p", "color": "#985e43"}, {"text": " ", "color": "#a1664a"}, {"text": "A", "color": "#aa6f50"}, {"text": "r", "color": "#b37756"}, {"text": "m", "color": "#bc7f5c"}, {"text": "y", "color": "#c68863"}]
bossbar set stardust:stoup_army style notched_6
bossbar set stardust:stoup_army color white
bossbar set stardust:stoup_army max 250

# Scoreboards for custom mobs and team
scoreboard objectives add stardust.hurt_time dummy
scoreboard objectives add stardust.spawn_delay dummy
team add stardust.mob {"translate":"stardust_mob","color":"aqua"}
team modify stardust.mob collisionRule always
team modify stardust.mob friendlyFire false

# Make sure dimensions are built
function stardust:dimensions/ensure_built

# Track teleportation through portals
scoreboard objectives add stardust.teleportation dummy
scoreboard objectives add stardust.teleported dummy

# Get world spawn position and dimension
execute summon marker run function stardust:utils/get_world_spawn_from_marker

# Quarry scoreboards & teams
scoreboard objectives add stardust.quarry_curr_x dummy
scoreboard objectives add stardust.quarry_curr_y dummy
scoreboard objectives add stardust.quarry_curr_z dummy
scoreboard objectives add stardust.quarry_x1 dummy
scoreboard objectives add stardust.quarry_x2 dummy
scoreboard objectives add stardust.quarry_y1 dummy
scoreboard objectives add stardust.quarry_y2 dummy
scoreboard objectives add stardust.quarry_z1 dummy
scoreboard objectives add stardust.quarry_z2 dummy
scoreboard objectives add stardust.quarry_status dummy
scoreboard objectives add stardust.quarry_speed dummy
scoreboard objectives add stardust.quarry_size dummy
team add stardust.red
team add stardust.blue
team modify stardust.red color red
team modify stardust.blue color blue

# Score for energy usage or generation
scoreboard objectives add stardust.energy_rate dummy

# Create objectives for growing seeds
scoreboard objectives add stardust.growth_time dummy
scoreboard objectives add stardust.growth_stage dummy

# Opening manual detection
scoreboard objectives add stardust.open_manual minecraft.used:minecraft.written_book

# Awakened Forge timer
scoreboard objectives add stardust.forge_timer dummy

# Register the manual to the universal manual
execute unless data storage stewbeet:main universal_manual run data modify storage stewbeet:main universal_manual set value []
data remove storage stewbeet:main universal_manual[{"name":"StardustFragment"}]
data modify storage stewbeet:main universal_manual append value {"name":"StardustFragment","loot_table":"stardust:i/manual","hover":[{"text": ""}, [{"translate":"stardustfragment_manual"}, "\n"], {"text": "ဠ\\n\\n\\n\\n\\n\\n", "font": "stardust:manual", "color": "white"}, [{"text": "", "font": "minecraft:default", "color": "black"}, {"translate": "stardust.the_following_manual_will_guide_you_through_everything_about_sta", "color": "#505050"}]]}

# Confirm load
tellraw @a[tag=convention.debug] {"translate":"stardust.loaded_stardustfragment_v4_0_6","color":"green"}
scoreboard players set #stardust.loaded load.status 1
function stardust:v4.0.6/load/set_items_storage

