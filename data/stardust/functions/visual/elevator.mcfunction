
#Run if enough energy is stored
execute if score @s energy.storage matches 20.. positioned ~ ~1 ~ as @a[distance=..1,dx=0,dz=0] unless score @s stardust.data_2 matches ..-1 run function stardust:work/elevator/all
scoreboard players remove @s[scores={energy.storage=20..}] energy.storage 1

#Update block
data modify entity @s item.tag.CustomModelData set value 2013316
execute if score @s energy.storage matches 20.. run data modify entity @s item.tag.CustomModelData set value 2013317

