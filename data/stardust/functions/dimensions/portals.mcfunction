execute if entity @s[tag=stardust.cavern_portal] unless block ~ ~-1 ~ iron_block unless block ~ ~-1 ~ bedrock run function stardust:opti/portals/delcave
execute if entity @s[tag=stardust.celestial_portal] unless block ~ ~-1 ~ gold_block unless block ~ ~-1 ~ bedrock run function stardust:opti/portals/delsky
execute if entity @s[tag=stardust.stardust_portal] unless block ~ ~-1 ~ blue_concrete unless block ~ ~-1 ~ bedrock run function stardust:opti/portals/delstardust
execute if entity @s[tag=stardust.stardust_dungeon_portal] unless block ~ ~-1 ~ red_nether_bricks unless block ~ ~-1 ~ gold_block run function stardust:opti/portals/deldungeon
execute if entity @s[tag=stardust.ultimate_portal] unless block ~ ~-1 ~ crying_obsidian run function stardust:opti/portals/delult
