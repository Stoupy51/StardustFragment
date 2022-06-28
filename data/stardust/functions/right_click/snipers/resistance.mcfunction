
# tellraw @a [{"text":"#bullet_damage: ","italic":false,"color":"aqua"},{"score":{"name":"#bullet_damage","objective":"stardust.data"},"italic":false,"color":"yellow"}]

scoreboard players set #reduction stardust.data 0
execute store result score #reduction stardust.data run data get entity @s ActiveEffects[{Id:11}].Amplifier
execute if score #reduction stardust.data matches ..-1 run scoreboard players set #reduction stardust.data 4
execute if data entity @s ActiveEffects[{Id:11}] run scoreboard players add #reduction stardust.data 1
scoreboard players operation #reduction stardust.data *= #20 simplenergy.data

scoreboard players operation #resistance stardust.data = #bullet_damage stardust.data
scoreboard players operation #resistance stardust.data *= #reduction stardust.data
scoreboard players operation #resistance stardust.data /= #100 simplenergy.data
scoreboard players operation #bullet_damage stardust.data -= #resistance stardust.data

# tellraw @a [{"text":"#reduction: ","italic":false,"color":"aqua"},{"score":{"name":"#reduction","objective":"stardust.data"},"italic":false,"color":"yellow"}]
# tellraw @a [{"text":"#resistance: ","italic":false,"color":"aqua"},{"score":{"name":"#resistance","objective":"stardust.data"},"italic":false,"color":"yellow"}]
# tellraw @a [{"text":"#bullet_damage: ","italic":false,"color":"aqua"},{"score":{"name":"#bullet_damage","objective":"stardust.data"},"italic":false,"color":"yellow"}]
