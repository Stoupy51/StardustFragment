#???
    #execute if entity @s[tag=!SF_WaitingCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,tag:{SF_StardustConfig:1b}},{Slot:3b,tag:{SF_StardustConfig:1b}},{Slot:4b,tag:{SF_StardustConfig:1b}},{Slot:11b,tag:{SF_StardustConfig:1b}},{Slot:12b,tag:{SF_QuadrupleCompressedCobblestone:1b}},{Slot:13b,tag:{SF_StardustConfig:1b}},{Slot:20b,tag:{SF_StardustConfig:1b}},{Slot:21b,tag:{SF_StardustConfig:1b}},{Slot:22b,tag:{SF_StardustConfig:1b}}]} run function stardust:craft/items/stardust_config



#Stardust Config
    execute if entity @s[tag=!SE_WaitingCraft] if data block ~ ~ ~ Items[{Slot:2b,tag:{SE_StardustConfig:1b}}] unless data block ~ ~ ~ Items[{Slot:3b}] unless data block ~ ~ ~ Items[{Slot:4b}] unless data block ~ ~ ~ Items[{Slot:11b}] unless data block ~ ~ ~ Items[{Slot:12b}] unless data block ~ ~ ~ Items[{Slot:13b}] unless data block ~ ~ ~ Items[{Slot:20b}] unless data block ~ ~ ~ Items[{Slot:21b}] unless data block ~ ~ ~ Items[{Slot:22b}] run function simplenergy:craft/items/stardust_essence_x9
    execute if entity @s[tag=!SE_WaitingCraft] if data block ~ ~ ~ Items[{Slot:3b,tag:{SE_StardustConfig:1b}}] unless data block ~ ~ ~ Items[{Slot:2b}] unless data block ~ ~ ~ Items[{Slot:4b}] unless data block ~ ~ ~ Items[{Slot:11b}] unless data block ~ ~ ~ Items[{Slot:12b}] unless data block ~ ~ ~ Items[{Slot:13b}] unless data block ~ ~ ~ Items[{Slot:20b}] unless data block ~ ~ ~ Items[{Slot:21b}] unless data block ~ ~ ~ Items[{Slot:22b}] run function simplenergy:craft/items/stardust_essence_x9
    execute if entity @s[tag=!SE_WaitingCraft] if data block ~ ~ ~ Items[{Slot:4b,tag:{SE_StardustConfig:1b}}] unless data block ~ ~ ~ Items[{Slot:2b}] unless data block ~ ~ ~ Items[{Slot:3b}] unless data block ~ ~ ~ Items[{Slot:11b}] unless data block ~ ~ ~ Items[{Slot:12b}] unless data block ~ ~ ~ Items[{Slot:13b}] unless data block ~ ~ ~ Items[{Slot:20b}] unless data block ~ ~ ~ Items[{Slot:21b}] unless data block ~ ~ ~ Items[{Slot:22b}] run function simplenergy:craft/items/stardust_essence_x9
    execute if entity @s[tag=!SE_WaitingCraft] if data block ~ ~ ~ Items[{Slot:11b,tag:{SE_StardustConfig:1b}}] unless data block ~ ~ ~ Items[{Slot:2b}] unless data block ~ ~ ~ Items[{Slot:3b}] unless data block ~ ~ ~ Items[{Slot:4b}] unless data block ~ ~ ~ Items[{Slot:12b}] unless data block ~ ~ ~ Items[{Slot:13b}] unless data block ~ ~ ~ Items[{Slot:20b}] unless data block ~ ~ ~ Items[{Slot:21b}] unless data block ~ ~ ~ Items[{Slot:22b}] run function simplenergy:craft/items/stardust_essence_x9
    execute if entity @s[tag=!SE_WaitingCraft] if data block ~ ~ ~ Items[{Slot:12b,tag:{SE_StardustConfig:1b}}] unless data block ~ ~ ~ Items[{Slot:2b}] unless data block ~ ~ ~ Items[{Slot:3b}] unless data block ~ ~ ~ Items[{Slot:4b}] unless data block ~ ~ ~ Items[{Slot:11b}] unless data block ~ ~ ~ Items[{Slot:13b}] unless data block ~ ~ ~ Items[{Slot:20b}] unless data block ~ ~ ~ Items[{Slot:21b}] unless data block ~ ~ ~ Items[{Slot:22b}] run function simplenergy:craft/items/stardust_essence_x9
    execute if entity @s[tag=!SE_WaitingCraft] if data block ~ ~ ~ Items[{Slot:13b,tag:{SE_StardustConfig:1b}}] unless data block ~ ~ ~ Items[{Slot:2b}] unless data block ~ ~ ~ Items[{Slot:3b}] unless data block ~ ~ ~ Items[{Slot:4b}] unless data block ~ ~ ~ Items[{Slot:11b}] unless data block ~ ~ ~ Items[{Slot:12b}] unless data block ~ ~ ~ Items[{Slot:20b}] unless data block ~ ~ ~ Items[{Slot:21b}] unless data block ~ ~ ~ Items[{Slot:22b}] run function simplenergy:craft/items/stardust_essence_x9
    execute if entity @s[tag=!SE_WaitingCraft] if data block ~ ~ ~ Items[{Slot:20b,tag:{SE_StardustConfig:1b}}] unless data block ~ ~ ~ Items[{Slot:2b}] unless data block ~ ~ ~ Items[{Slot:3b}] unless data block ~ ~ ~ Items[{Slot:4b}] unless data block ~ ~ ~ Items[{Slot:11b}] unless data block ~ ~ ~ Items[{Slot:12b}] unless data block ~ ~ ~ Items[{Slot:13b}] unless data block ~ ~ ~ Items[{Slot:21b}] unless data block ~ ~ ~ Items[{Slot:22b}] run function simplenergy:craft/items/stardust_essence_x9
    execute if entity @s[tag=!SE_WaitingCraft] if data block ~ ~ ~ Items[{Slot:21b,tag:{SE_StardustConfig:1b}}] unless data block ~ ~ ~ Items[{Slot:2b}] unless data block ~ ~ ~ Items[{Slot:3b}] unless data block ~ ~ ~ Items[{Slot:4b}] unless data block ~ ~ ~ Items[{Slot:11b}] unless data block ~ ~ ~ Items[{Slot:12b}] unless data block ~ ~ ~ Items[{Slot:13b}] unless data block ~ ~ ~ Items[{Slot:20b}] unless data block ~ ~ ~ Items[{Slot:22b}] run function simplenergy:craft/items/stardust_essence_x9
    execute if entity @s[tag=!SE_WaitingCraft] if data block ~ ~ ~ Items[{Slot:22b,tag:{SE_StardustConfig:1b}}] unless data block ~ ~ ~ Items[{Slot:2b}] unless data block ~ ~ ~ Items[{Slot:3b}] unless data block ~ ~ ~ Items[{Slot:4b}] unless data block ~ ~ ~ Items[{Slot:11b}] unless data block ~ ~ ~ Items[{Slot:12b}] unless data block ~ ~ ~ Items[{Slot:13b}] unless data block ~ ~ ~ Items[{Slot:20b}] unless data block ~ ~ ~ Items[{Slot:21b}] run function simplenergy:craft/items/stardust_essence_x9
