
item replace block ~ ~ ~ container.9 with minecraft:cobblestone{CustomModelData:2011929,simplenergy:{texture_item:1b},display:{Name:'""'}}
item replace block ~ ~ ~ container.10 with minecraft:cobblestone{CustomModelData:2011929,simplenergy:{texture_item:1b},display:{Name:'""'}}
item replace block ~ ~ ~ container.11 with minecraft:cobblestone{CustomModelData:2011929,simplenergy:{texture_item:1b},display:{Name:'""'}}
item replace block ~ ~ ~ container.12 with minecraft:cobblestone{CustomModelData:2011929,simplenergy:{texture_item:1b},display:{Name:'""'}}
item replace block ~ ~ ~ container.13 with minecraft:cobblestone{CustomModelData:2011929,simplenergy:{texture_item:1b},display:{Name:'""'}}
item replace block ~ ~ ~ container.14 with minecraft:cobblestone{CustomModelData:2011929,simplenergy:{texture_item:1b},display:{Name:'""'}}
item replace block ~ ~ ~ container.15 with minecraft:cobblestone{CustomModelData:2011929,simplenergy:{texture_item:1b},display:{Name:'""'}}
item replace block ~ ~ ~ container.16 with minecraft:cobblestone{CustomModelData:2011929,simplenergy:{texture_item:1b},display:{Name:'""'}}
item replace block ~ ~ ~ container.17 with minecraft:cobblestone{CustomModelData:2011929,simplenergy:{texture_item:1b},display:{Name:'""'}}
item replace block ~ ~ ~ container.18 with minecraft:cobblestone{CustomModelData:2011929,simplenergy:{texture_item:1b},display:{Name:'""'}}
#
item replace block ~ ~ ~ container.19 with minecraft:cobblestone{CustomModelData:2011929,simplenergy:{texture_item:1b},stardust:{quarry_start:1b},display:{Name:'[{"text":"Start","italic":false,"color":"green"}]'}}
item replace block ~ ~ ~ container.20 with minecraft:cobblestone{CustomModelData:2011929,simplenergy:{texture_item:1b},stardust:{quarry_pause:1b},display:{Name:'[{"text":"Pause","italic":false,"color":"yellow"}]'}}
execute if score @s stardust.quarry_status matches -2 run item replace block ~ ~ ~ container.20 with minecraft:cobblestone{CustomModelData:2011929,simplenergy:{texture_item:1b},stardust:{quarry_pause:1b},display:{Name:'[{"text":"Resume","italic":false,"color":"yellow"}]'}}
item replace block ~ ~ ~ container.21 with minecraft:cobblestone{CustomModelData:2011929,simplenergy:{texture_item:1b},stardust:{quarry_stop:1b},display:{Name:'[{"text":"Stop","italic":false,"color":"red"}]'}}
#
item replace block ~ ~ ~ container.22 with minecraft:cobblestone{CustomModelData:2011929,simplenergy:{texture_item:1b},display:{Name:'""'}}
item replace block ~ ~ ~ container.23 with minecraft:cobblestone{CustomModelData:2011929,simplenergy:{texture_item:1b},display:{Name:'""'}}
execute unless data block ~ ~ ~ Items[{Slot:24b}] run item replace block ~ ~ ~ container.24 with minecraft:cobblestone{CustomModelData:2011929,simplenergy:{texture_item:1b},display:{Name:'""'}}
item replace block ~ ~ ~ container.25 with minecraft:written_book{CustomModelData:2011929,simplenergy:{texture_item:1b},stardust:{quarry_manual:1b},pages:['["",{"text":"How to configure the quarry ?","underlined":true,"color":"red"},{"text":"\\nYou need to use a quarry configurator to define coordinates.\\n- ","color":"reset"},{"keybind":"key.use","italic":false,"color":"dark_gray"},{"text":" set first coordinates.\\n- ","color":"reset"},{"keybind":"key.sneak","italic":false,"color":"dark_gray"},{"text":" + ","italic":false,"color":"gray"},{"keybind":"key.use","italic":false,"color":"dark_gray"},{"text":" to set second coordinates.\\n","color":"reset"},{"text":"And ","color":"reset"},{"keybind":"key.sneak","italic":false,"color":"dark_gray"},{"text":" + ","italic":false,"color":"gray"},{"keybind":"key.use","italic":false,"color":"dark_gray"},{"text":" on the quarry to apply configuration","color":"reset"}]'],title:"Quarry Manual",author:"Stardust Fragment"}
item replace block ~ ~ ~ container.26 with minecraft:cobblestone{CustomModelData:2013398,simplenergy:{texture_item:1b},display:{Name:'""'}}
