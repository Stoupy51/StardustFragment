
execute at @e[tag=stardust.elevator,distance=..1,limit=1] store result score #temp stardust.data run tp @s ~ ~1 ~
execute if score #temp stardust.data matches 1 run tp @s @s
execute if score #temp stardust.data matches 1 run playsound stardust:elevator block @s
execute if entity @s[distance=..256] if score #temp stardust.data matches 0 positioned ~ ~1 ~ run function stardust:work/elevator/go_up

