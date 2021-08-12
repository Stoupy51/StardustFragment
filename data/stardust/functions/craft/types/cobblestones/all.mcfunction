#Compressed Cobblestone
    execute if entity @s[tag=!SF_WaitingCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,id:"minecraft:cobblestone"},{Slot:3b,id:"minecraft:cobblestone"},{Slot:4b,id:"minecraft:cobblestone"},{Slot:11b,id:"minecraft:cobblestone"},{Slot:12b,id:"minecraft:cobblestone"},{Slot:13b,id:"minecraft:cobblestone"},{Slot:20b,id:"minecraft:cobblestone"},{Slot:21b,id:"minecraft:cobblestone"},{Slot:22b,id:"minecraft:cobblestone"}]} run function stardust:craft/items/cobblestones/compressed
#Compressed Cobblestone Crafts
    execute if entity @s[tag=!SF_WaitingCraft] if data block ~ ~ ~ Items[{tag:{SF_CompressedCobblestone:1b}}] run function stardust:craft/types/cobblestones/compressed
#Double Compressed Cobblestone Crafts
    execute if entity @s[tag=!SF_WaitingCraft] if data block ~ ~ ~ Items[{tag:{SF_DoubleCompressedCobblestone:1b}}] run function stardust:craft/types/cobblestones/double_compressed
#Triple Compressed Cobblestone Crafts
    execute if entity @s[tag=!SF_WaitingCraft] if data block ~ ~ ~ Items[{tag:{SF_TripleCompressedCobblestone:1b}}] run function stardust:craft/types/cobblestones/triple_compressed
#Quadruple Compressed Cobblestone Crafts
    execute if entity @s[tag=!SF_WaitingCraft] if data block ~ ~ ~ Items[{tag:{SF_QuadrupleCompressedCobblestone:1b}}] run function stardust:craft/types/cobblestones/quadruple_compressed
#Quintuple Compressed Cobblestone Crafts
    execute if entity @s[tag=!SF_WaitingCraft] if data block ~ ~ ~ Items[{tag:{SF_QuintupleCompressedCobblestone:1b}}] run function stardust:craft/types/cobblestones/quintuple_compressed
#Sextuple Compressed Cobblestone Crafts
    execute if entity @s[tag=!SF_WaitingCraft] if data block ~ ~ ~ Items[{tag:{SF_SextupleCompressedCobblestone:1b}}] run function stardust:craft/types/cobblestones/sextuple_compressed
#Septuple Compressed Cobblestone Crafts
    execute if entity @s[tag=!SF_WaitingCraft] if data block ~ ~ ~ Items[{tag:{SF_SeptupleCompressedCobblestone:1b}}] run function stardust:craft/types/cobblestones/septuple_compressed
#Octuple Compressed Cobblestone Crafts
    execute if entity @s[tag=!SF_WaitingCraft] if data block ~ ~ ~ Items[{tag:{SF_OctupleCompressedCobblestone:1b}}] run function stardust:craft/types/cobblestones/octuple_compressed
