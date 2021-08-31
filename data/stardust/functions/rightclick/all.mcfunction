execute if data entity @s {SelectedItem:{tag:{SF_QuarryConfigurator:1b}}} run function stardust:rightclick/quarry_configurator/all
execute if data entity @s {SelectedItem:{tag:{SF_StardustPillar:1b}}} run function stardust:rightclick/stardust_pillar
execute if data entity @s {SelectedItem:{tag:{SF_WormholePotion:1b}}} run function stardust:rightclick/wormhole_potion
execute if data entity @s {SelectedItem:{tag:{SF_WitherKiller:1b}}} run function stardust:rightclick/wither_killer
execute if data entity @s {SelectedItem:{tag:{SF_TravelStaff:1b}}} run scoreboard players add @s SF_Data 1
execute if data entity @s {SelectedItem:{tag:{SF_Sniper:1b}}} unless score @s SF_Cooldown matches 1.. at @s run function stardust:rightclick/snipers/all
scoreboard players reset @s SF_RightClick
