tellraw @s ["",{"text":"[Stardust","italic":false,"color":"dark_aqua"},{"text":"Fragment]","italic":false,"color":"aqua"},{"text":" Sur quel joueur voulez-vous vous téléporter ?"}]
execute at @a run tellraw @s ["",{"score":{"name":"@p","objective":"SF_StardustID"},"clickEvent":{"action":"suggest_command","value":"/trigger SF_Wormhole set <id>"}},{"text":" - ","clickEvent":{"action":"suggest_command","value":"/trigger SF_Wormhole set <id>"}},{"selector":"@p","clickEvent":{"action":"suggest_command","value":"/trigger SF_Wormhole set <id>"}}]
scoreboard players enable @s SF_Wormhole
