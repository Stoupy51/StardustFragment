
execute as @e[type=item,tag=!simplenergy.checked] at @s run function simplenergy:destroy/item_check/
execute as @e[tag=simplenergy.destroyer,dx=0,dy=0,dz=0,limit=1] at @s run function simplenergy:destroy/all
execute as @e[tag=stardust.destroyer,dx=0,dy=0,dz=0,limit=1] at @s run function stardust:destroy/all
