
#> stardust:advancements/ender_pearl
#
# @executed	as the player & at current position
#
# @within	advancement stardust:technical/ender_pearl
#

# Revoke advancement and reset score
advancement revoke @s only stardust:technical/ender_pearl
scoreboard players set @s stardust.ender_pearl 0

# If Dragon Pearl (Motion x1.5), if Ender Dragon pearl (Motion x2)
execute if items entity @s weapon.mainhand *[custom_data~{stardust:{"dragon_pearl":true}}] as @n[type=ender_pearl,tag=!stardust.motion_applied,nbt={Item:{components:{"minecraft:custom_data":{stardust:{"dragon_pearl":true}}}}}] run function stardust:utils/multiply_motion {scale:1500}
execute if items entity @s weapon.mainhand *[custom_data~{stardust:{"ender_dragon_pearl":true}}] as @n[type=ender_pearl,tag=!stardust.motion_applied,nbt={Item:{components:{"minecraft:custom_data":{stardust:{"ender_dragon_pearl":true}}}}}] run function stardust:utils/multiply_motion {scale:2000}

