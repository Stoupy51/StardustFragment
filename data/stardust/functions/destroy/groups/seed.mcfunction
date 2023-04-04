
# If seed is an item_frame, replace it by item_display
execute if entity @s[type=item_frame] run function stardust:place/convert_seed

# Else, check destroy
execute if entity @s[type=item_display] run function stardust:destroy/seeds/

