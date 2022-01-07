#Compressed Cobblestone Crafts
	execute as @s[tag=!StardustFragment_FoundCraft] if data storage stardust:items all.Crafting[{tag:{StardustFragment_CompressedCobblestone:1b}}] run function stardust:craft/types/cobblestones/compressed
#Double Compressed Cobblestone Crafts
	execute as @s[tag=!StardustFragment_FoundCraft] if data storage stardust:items all.Crafting[{tag:{StardustFragment_DoubleCompressedCobblestone:1b}}] run function stardust:craft/types/cobblestones/double_compressed
#Triple Compressed Cobblestone Crafts
	execute as @s[tag=!StardustFragment_FoundCraft] if data storage stardust:items all.Crafting[{tag:{StardustFragment_TripleCompressedCobblestone:1b}}] run function stardust:craft/types/cobblestones/triple_compressed
#Quadruple Compressed Cobblestone Crafts
	execute as @s[tag=!StardustFragment_FoundCraft] if data storage stardust:items all.Crafting[{tag:{StardustFragment_QuadrupleCompressedCobblestone:1b}}] run function stardust:craft/types/cobblestones/quadruple_compressed
#Quintuple Compressed Cobblestone Crafts
	execute as @s[tag=!StardustFragment_FoundCraft] if data storage stardust:items all.Crafting[{tag:{StardustFragment_QuintupleCompressedCobblestone:1b}}] run function stardust:craft/types/cobblestones/quintuple_compressed
#Sextuple Compressed Cobblestone Crafts
	execute as @s[tag=!StardustFragment_FoundCraft] if data storage stardust:items all.Crafting[{tag:{StardustFragment_SextupleCompressedCobblestone:1b}}] run function stardust:craft/types/cobblestones/sextuple_compressed
#Septuple Compressed Cobblestone Crafts
	execute as @s[tag=!StardustFragment_FoundCraft] if data storage stardust:items all.Crafting[{tag:{StardustFragment_SeptupleCompressedCobblestone:1b}}] run function stardust:craft/types/cobblestones/septuple_compressed
#Octuple Compressed Cobblestone Crafts
	execute as @s[tag=!StardustFragment_FoundCraft] if data storage stardust:items all.Crafting[{tag:{StardustFragment_OctupleCompressedCobblestone:1b}}] run function stardust:craft/types/cobblestones/octuple_compressed

#No Craft Found
	execute as @s[tag=!StardustFragment_FoundCraft] unless data storage stardust:items all.Crafting[{Slot:16b,tag:{StardustFragment_Cobblestones:1b}}] run function stardust:craft/no_craft_found
