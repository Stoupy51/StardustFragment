#Kill undesired items
    kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:cobblestone",tag:{SE_CustomTextureItem:1b}}},sort=nearest,distance=..1]
    execute if score @s SF_Data matches 2012000 run kill @e[type=minecraft:item,nbt={Item:{tag:{SF_CauldronGenerator:1b}}},limit=1,sort=nearest,distance=..1]
    execute if score @s SF_Data matches 2012001 run kill @e[type=minecraft:item,nbt={Item:{tag:{SF_FurnaceGenerator:1b}}},limit=1,sort=nearest,distance=..1]
    execute if score @s SF_Data matches 2012003 run kill @e[type=minecraft:item,nbt={Item:{tag:{SF_SolarPanel:1b}}},limit=1,sort=nearest,distance=..1]
    execute if score @s SF_Data matches 2012099 run kill @e[type=minecraft:item,nbt={Item:{tag:{SF_SimpleWire:1b}}},limit=1,sort=nearest,distance=..1]
    execute if score @s SF_Data matches 2012098 run kill @e[type=minecraft:item,nbt={Item:{tag:{SF_AdvancedWire:1b}}},limit=1,sort=nearest,distance=..1]
    execute if score @s SF_Data matches 2012097 run kill @e[type=minecraft:item,nbt={Item:{tag:{SF_EliteWire:1b}}},limit=1,sort=nearest,distance=..1]
    execute if score @s SF_Data matches 2012100 run kill @e[type=minecraft:item,nbt={Item:{tag:{SF_SimpleBattery:1b}}},limit=1,sort=nearest,distance=..1]
    execute if score @s SF_Data matches 2012101 run kill @e[type=minecraft:item,nbt={Item:{tag:{SF_AdvancedBattery:1b}}},limit=1,sort=nearest,distance=..1]
    execute if score @s SF_Data matches 2012102 run kill @e[type=minecraft:item,nbt={Item:{tag:{SF_EliteBattery:1b}}},limit=1,sort=nearest,distance=..1]
    execute if score @s SF_Data matches 2012200 run kill @e[type=minecraft:item,nbt={Item:{tag:{SF_ElectricFurnace:1b}}},limit=1,sort=nearest,distance=..1]
    execute if score @s SF_Data matches 2012202 run kill @e[type=minecraft:item,nbt={Item:{tag:{SF_ElectricSmelter:1b}}},limit=1,sort=nearest,distance=..1]
    execute if score @s SF_Data matches 2012204 run kill @e[type=minecraft:item,nbt={Item:{tag:{SF_ElectricBrewing:1b}}},limit=1,sort=nearest,distance=..1]
    execute if score @s SF_Data matches 2012205 run kill @e[type=minecraft:item,nbt={Item:{tag:{SF_ElectricLamp:1b}}},limit=1,sort=nearest,distance=..1]
    execute if score @s SF_Data matches 2012900 run kill @e[type=minecraft:item,nbt={Item:{tag:{SF_Joulemeter:1b}}},limit=1,sort=nearest,distance=..1]

#Replace the item
    data modify entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:barrel"}},limit=1,sort=nearest,distance=..1] Item set from storage stardust:items 2013399
kill @s
