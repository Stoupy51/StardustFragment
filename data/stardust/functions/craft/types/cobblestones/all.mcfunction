#Compressed Cobblestone Crafts
	execute as @s[tag=!SF_FoundCraft] if data storage stardust:items Crafting[{tag:{SF_CompressedCobblestone:1s}}] run function stardust:craft/types/cobblestones/compressed
#Double Compressed Cobblestone Crafts
	execute as @s[tag=!SF_FoundCraft] if data storage stardust:items Crafting[{tag:{SF_DoubleCompressedCobblestone:1s}}] run function stardust:craft/types/cobblestones/double_compressed
#Triple Compressed Cobblestone Crafts
	execute as @s[tag=!SF_FoundCraft] if data storage stardust:items Crafting[{tag:{SF_TripleCompressedCobblestone:1s}}] run function stardust:craft/types/cobblestones/triple_compressed
#Quadruple Compressed Cobblestone Crafts
	execute as @s[tag=!SF_FoundCraft] if data storage stardust:items Crafting[{tag:{SF_QuadrupleCompressedCobblestone:1s}}] run function stardust:craft/types/cobblestones/quadruple_compressed
#Quintuple Compressed Cobblestone Crafts
	execute as @s[tag=!SF_FoundCraft] if data storage stardust:items Crafting[{tag:{SF_QuintupleCompressedCobblestone:1s}}] run function stardust:craft/types/cobblestones/quintuple_compressed
#Sextuple Compressed Cobblestone Crafts
	execute as @s[tag=!SF_FoundCraft] if data storage stardust:items Crafting[{tag:{SF_SextupleCompressedCobblestone:1s}}] run function stardust:craft/types/cobblestones/sextuple_compressed
#Septuple Compressed Cobblestone Crafts
	execute as @s[tag=!SF_FoundCraft] if data storage stardust:items Crafting[{tag:{SF_SeptupleCompressedCobblestone:1s}}] run function stardust:craft/types/cobblestones/septuple_compressed
#Octuple Compressed Cobblestone Crafts
	execute as @s[tag=!SF_FoundCraft] if data storage stardust:items Crafting[{tag:{SF_OctupleCompressedCobblestone:1s}}] run function stardust:craft/types/cobblestones/octuple_compressed

#No Craft Found
	execute as @s[tag=!SF_FoundCraft] unless data storage stardust:items Crafting[{Slot:16b,tag:{SF_Cobblestones:1s}}] run function stardust:craft/no_craft_found
