#Triple Compressed Cobblestone
    execute if entity @s[tag=!SF_WaitingCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_DoubleCompressedCobblestone:1s}},{Slot:3b,tag:{SF_DoubleCompressedCobblestone:1s}},{Slot:4b,tag:{SF_DoubleCompressedCobblestone:1s}},{Slot:11b,tag:{SF_DoubleCompressedCobblestone:1s}},{Slot:12b,tag:{SF_DoubleCompressedCobblestone:1s}},{Slot:13b,tag:{SF_DoubleCompressedCobblestone:1s}},{Slot:20b,tag:{SF_DoubleCompressedCobblestone:1s}},{Slot:21b,tag:{SF_DoubleCompressedCobblestone:1s}},{Slot:22b,tag:{SF_DoubleCompressedCobblestone:1s}}]} run function stardust:craft/items/cobblestones/triple_compressed

#Compressed Cobblestone
    execute if entity @s[tag=!SF_WaitingCraft] if data block ~ ~ ~ Items[{Slot:2b,tag:{SF_DoubleCompressedCobblestone:1s}}] unless data block ~ ~ ~ Items[{Slot:3b}] unless data block ~ ~ ~ Items[{Slot:4b}] unless data block ~ ~ ~ Items[{Slot:11b}] unless data block ~ ~ ~ Items[{Slot:12b}] unless data block ~ ~ ~ Items[{Slot:13b}] unless data block ~ ~ ~ Items[{Slot:20b}] unless data block ~ ~ ~ Items[{Slot:21b}] unless data block ~ ~ ~ Items[{Slot:22b}] run function stardust:craft/items/cobblestones/compressed_x9
    execute if entity @s[tag=!SF_WaitingCraft] if data block ~ ~ ~ Items[{Slot:3b,tag:{SF_DoubleCompressedCobblestone:1s}}] unless data block ~ ~ ~ Items[{Slot:2b}] unless data block ~ ~ ~ Items[{Slot:4b}] unless data block ~ ~ ~ Items[{Slot:11b}] unless data block ~ ~ ~ Items[{Slot:12b}] unless data block ~ ~ ~ Items[{Slot:13b}] unless data block ~ ~ ~ Items[{Slot:20b}] unless data block ~ ~ ~ Items[{Slot:21b}] unless data block ~ ~ ~ Items[{Slot:22b}] run function stardust:craft/items/cobblestones/compressed_x9
    execute if entity @s[tag=!SF_WaitingCraft] if data block ~ ~ ~ Items[{Slot:4b,tag:{SF_DoubleCompressedCobblestone:1s}}] unless data block ~ ~ ~ Items[{Slot:2b}] unless data block ~ ~ ~ Items[{Slot:3b}] unless data block ~ ~ ~ Items[{Slot:11b}] unless data block ~ ~ ~ Items[{Slot:12b}] unless data block ~ ~ ~ Items[{Slot:13b}] unless data block ~ ~ ~ Items[{Slot:20b}] unless data block ~ ~ ~ Items[{Slot:21b}] unless data block ~ ~ ~ Items[{Slot:22b}] run function stardust:craft/items/cobblestones/compressed_x9
    execute if entity @s[tag=!SF_WaitingCraft] if data block ~ ~ ~ Items[{Slot:11b,tag:{SF_DoubleCompressedCobblestone:1s}}] unless data block ~ ~ ~ Items[{Slot:2b}] unless data block ~ ~ ~ Items[{Slot:3b}] unless data block ~ ~ ~ Items[{Slot:4b}] unless data block ~ ~ ~ Items[{Slot:12b}] unless data block ~ ~ ~ Items[{Slot:13b}] unless data block ~ ~ ~ Items[{Slot:20b}] unless data block ~ ~ ~ Items[{Slot:21b}] unless data block ~ ~ ~ Items[{Slot:22b}] run function stardust:craft/items/cobblestones/compressed_x9
    execute if entity @s[tag=!SF_WaitingCraft] if data block ~ ~ ~ Items[{Slot:12b,tag:{SF_DoubleCompressedCobblestone:1s}}] unless data block ~ ~ ~ Items[{Slot:2b}] unless data block ~ ~ ~ Items[{Slot:3b}] unless data block ~ ~ ~ Items[{Slot:4b}] unless data block ~ ~ ~ Items[{Slot:11b}] unless data block ~ ~ ~ Items[{Slot:13b}] unless data block ~ ~ ~ Items[{Slot:20b}] unless data block ~ ~ ~ Items[{Slot:21b}] unless data block ~ ~ ~ Items[{Slot:22b}] run function stardust:craft/items/cobblestones/compressed_x9
    execute if entity @s[tag=!SF_WaitingCraft] if data block ~ ~ ~ Items[{Slot:13b,tag:{SF_DoubleCompressedCobblestone:1s}}] unless data block ~ ~ ~ Items[{Slot:2b}] unless data block ~ ~ ~ Items[{Slot:3b}] unless data block ~ ~ ~ Items[{Slot:4b}] unless data block ~ ~ ~ Items[{Slot:11b}] unless data block ~ ~ ~ Items[{Slot:12b}] unless data block ~ ~ ~ Items[{Slot:20b}] unless data block ~ ~ ~ Items[{Slot:21b}] unless data block ~ ~ ~ Items[{Slot:22b}] run function stardust:craft/items/cobblestones/compressed_x9
    execute if entity @s[tag=!SF_WaitingCraft] if data block ~ ~ ~ Items[{Slot:20b,tag:{SF_DoubleCompressedCobblestone:1s}}] unless data block ~ ~ ~ Items[{Slot:2b}] unless data block ~ ~ ~ Items[{Slot:3b}] unless data block ~ ~ ~ Items[{Slot:4b}] unless data block ~ ~ ~ Items[{Slot:11b}] unless data block ~ ~ ~ Items[{Slot:12b}] unless data block ~ ~ ~ Items[{Slot:13b}] unless data block ~ ~ ~ Items[{Slot:21b}] unless data block ~ ~ ~ Items[{Slot:22b}] run function stardust:craft/items/cobblestones/compressed_x9
    execute if entity @s[tag=!SF_WaitingCraft] if data block ~ ~ ~ Items[{Slot:21b,tag:{SF_DoubleCompressedCobblestone:1s}}] unless data block ~ ~ ~ Items[{Slot:2b}] unless data block ~ ~ ~ Items[{Slot:3b}] unless data block ~ ~ ~ Items[{Slot:4b}] unless data block ~ ~ ~ Items[{Slot:11b}] unless data block ~ ~ ~ Items[{Slot:12b}] unless data block ~ ~ ~ Items[{Slot:13b}] unless data block ~ ~ ~ Items[{Slot:20b}] unless data block ~ ~ ~ Items[{Slot:22b}] run function stardust:craft/items/cobblestones/compressed_x9
    execute if entity @s[tag=!SF_WaitingCraft] if data block ~ ~ ~ Items[{Slot:22b,tag:{SF_DoubleCompressedCobblestone:1s}}] unless data block ~ ~ ~ Items[{Slot:2b}] unless data block ~ ~ ~ Items[{Slot:3b}] unless data block ~ ~ ~ Items[{Slot:4b}] unless data block ~ ~ ~ Items[{Slot:11b}] unless data block ~ ~ ~ Items[{Slot:12b}] unless data block ~ ~ ~ Items[{Slot:13b}] unless data block ~ ~ ~ Items[{Slot:20b}] unless data block ~ ~ ~ Items[{Slot:21b}] run function stardust:craft/items/cobblestones/compressed_x9
