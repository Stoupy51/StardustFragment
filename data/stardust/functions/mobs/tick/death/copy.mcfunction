
scoreboard players set @s stardust.cooldown 20
data modify entity @s Tags set from storage stardust:main temp.Tags
data modify entity @s ArmorItems set from storage stardust:main temp.ArmorItems
data modify entity @s Rotation set from storage stardust:main temp.Rotation
tag @s add stardust.death_model
tag @s remove stardust.new

function stardust:mobs/tick/models
