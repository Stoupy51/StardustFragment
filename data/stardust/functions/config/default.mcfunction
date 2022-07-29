
tellraw @s ["",{"text":"[Stardust","color":"aqua"},{"text":"Fragment","color":"dark_aqua"},{"text":" Configuration]","color":"aqua"},{"text":" New configuration loaded, change it with /function stardust:config"}]

scoreboard players set #default_config stardust.config 4

# Configurations
scoreboard players set UltimateSlaveCount stardust.config 3
scoreboard players set StoupArmyWolfCount stardust.config 50

#Disabled items (default on = 0)
scoreboard players set TravelStaffDisabled stardust.config 0
scoreboard players set WormholePotionDisabled stardust.config 0
scoreboard players set WitherKillerDisabled stardust.config 0
scoreboard players set LifeCrystalDisabled stardust.config 0

