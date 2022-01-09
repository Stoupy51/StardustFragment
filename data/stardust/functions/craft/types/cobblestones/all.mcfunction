#Compressed Cobblestone Crafts
	execute as @s[tag=!StardustFragment_FoundCraft] if data storage stardust:items all.Crafting[{tag:{StardustFragment_CompressedCobblestone:1b}}] run function stardust:craft/types/cobblestones/compressed
#Double Compressed Cobblestone Crafts
	execute as @s[tag=!StardustFragment_FoundCraft] if data storage stardust:items all.Crafting[{tag:{ctc:{id:"double_compressed_cobblestone"}}}] run function stardust:craft/types/cobblestones/double_compressed
#Triple Compressed Cobblestone Crafts
	execute as @s[tag=!StardustFragment_FoundCraft] if data storage stardust:items all.Crafting[{tag:{ctc:{id:"triple_compressed_cobblestone"}}}] run function stardust:craft/types/cobblestones/triple_compressed
#Quadruple Compressed Cobblestone Crafts
	execute as @s[tag=!StardustFragment_FoundCraft] if data storage stardust:items all.Crafting[{tag:{ctc:{id:"quadruple_compressed_cobblestone"}}}] run function stardust:craft/types/cobblestones/quadruple_compressed
#Quintuple Compressed Cobblestone Crafts
	execute as @s[tag=!StardustFragment_FoundCraft] if data storage stardust:items all.Crafting[{tag:{ctc:{id:"quintuple_compressed_cobblestone"}}}] run function stardust:craft/types/cobblestones/quintuple_compressed
#Sextuple Compressed Cobblestone Crafts
	execute as @s[tag=!StardustFragment_FoundCraft] if data storage stardust:items all.Crafting[{tag:{ctc:{id:"sextuple_compressed_cobblestone"}}}] run function stardust:craft/types/cobblestones/sextuple_compressed
#Septuple Compressed Cobblestone Crafts
	execute as @s[tag=!StardustFragment_FoundCraft] if data storage stardust:items all.Crafting[{tag:{ctc:{id:"septuple_compressed_cobblestone"}}}] run function stardust:craft/types/cobblestones/septuple_compressed
#Octuple Compressed Cobblestone Crafts
	execute as @s[tag=!StardustFragment_FoundCraft] if data storage stardust:items all.Crafting[{tag:{ctc:{id:"octuple_compressed_cobblestone"}}}] run function stardust:craft/types/cobblestones/octuple_compressed

#No Craft Found
	execute as @s[tag=!StardustFragment_FoundCraft] unless data storage stardust:items all.Crafting[{Slot:16b,tag:{StardustFragment_Cobblestones:1b}}] run function stardust:craft/no_craft_found
