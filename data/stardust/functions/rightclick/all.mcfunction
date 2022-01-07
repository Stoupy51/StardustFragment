execute if data entity @s {SelectedItem:{tag:{StardustFragment_QuarryConfigurator:1b}}} run function stardust:rightclick/quarry_configurator/all
execute if data entity @s {SelectedItem:{tag:{StardustFragment_LuckyArtifactBag:1b}}} run function stardust:rightclick/lucky_artifact_bag/all
execute if data entity @s {SelectedItem:{tag:{StardustFragment_StardustPillar:1b}}} run function stardust:rightclick/stardust_pillar
execute if data entity @s {SelectedItem:{tag:{StardustFragment_WormholePotion:1b}}} run function stardust:rightclick/wormhole_potion
execute if data entity @s {SelectedItem:{tag:{StardustFragment_WitherKiller:1b}}} run function stardust:rightclick/wither_killer
execute if data entity @s {SelectedItem:{tag:{StardustFragment_TravelStaff:1b}}} run scoreboard players add @s StardustFragment_Data 1
execute if data entity @s {SelectedItem:{tag:{StardustFragment_Sniper:1b}}} unless score @s StardustFragment_Cooldown matches 1.. at @s run function stardust:rightclick/snipers/all
scoreboard players reset @s StardustFragment_RightClick
