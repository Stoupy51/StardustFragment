

data modify storage stardust:main Sniper.Lore append value '{"text":"\\n"}'
data modify storage stardust:main Sniper.Lore append from storage stardust:main Sniper.display.Lore[0]
data remove storage stardust:main Sniper.display.Lore[0]

execute if data storage stardust:main Sniper.display.Lore[0] run function stardust:right_click/snipers/decode_lore
