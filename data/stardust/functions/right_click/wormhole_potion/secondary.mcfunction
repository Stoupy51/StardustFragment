
tellraw @s ["",{"text":"[Stardust","italic":false,"color":"dark_aqua"},{"text":"Fragment]","italic":false,"color":"aqua"},{"text":" On which player would you teleport?"}]
execute at @a run tellraw @s ["",{"score":{"name":"@p","objective":"stardust.id"},"clickEvent":{"action":"suggest_command","value":"/trigger stardust.wormhole set <id>"}},{"text":" - ","clickEvent":{"action":"suggest_command","value":"/trigger stardust.wormhole set <id>"}},{"selector":"@p","clickEvent":{"action":"suggest_command","value":"/trigger stardust.wormhole set <id>"}}]
scoreboard players enable @s stardust.wormhole
