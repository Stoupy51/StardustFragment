execute if data entity @s SelectedItem.tag.StardustFragment_QuarryConfigurator
execute if data entity @s SelectedItem.tag.StardustFragment_QuarryConfigurator run function stardust:rightclick/quarry_configurator/all
execute if data entity @s SelectedItem.tag.StardustFragment_LuckyArtifactBag run function stardust:rightclick/lucky_artifact_bag/all
execute if data entity @s SelectedItem.tag.StardustFragment_StardustPillar run function stardust:rightclick/stardust_pillar
execute if data entity @s SelectedItem.tag.StardustFragment_WormholePotion run function stardust:rightclick/wormhole_potion
execute if data entity @s SelectedItem.tag.StardustFragment_WitherKiller run function stardust:rightclick/wither_killer
execute if data entity @s SelectedItem.tag.StardustFragment_TravelStaff run scoreboard players add @s StardustFragment_Data 1
execute if data entity @s SelectedItem.tag.StardustFragment_Sniper unless score @s StardustFragment_Cooldown matches 1.. at @s run function stardust:rightclick/snipers/all
scoreboard players reset @s StardustFragment_RightClick
