item replace block ~ ~ ~ container.9 with minecraft:cobblestone{CustomModelData:2011929,SE_CustomTextureItem:1b,display:{Name:'[{"text":""}]'}}
item replace block ~ ~ ~ container.10 with minecraft:cobblestone{CustomModelData:2011929,SE_CustomTextureItem:1b,display:{Name:'[{"text":""}]'}}
item replace block ~ ~ ~ container.11 with minecraft:cobblestone{CustomModelData:2011929,SE_CustomTextureItem:1b,display:{Name:'[{"text":""}]'}}
item replace block ~ ~ ~ container.12 with minecraft:cobblestone{CustomModelData:2011929,SE_CustomTextureItem:1b,display:{Name:'[{"text":""}]'}}
item replace block ~ ~ ~ container.13 with minecraft:cobblestone{CustomModelData:2011929,SE_CustomTextureItem:1b,display:{Name:'[{"text":""}]'}}
item replace block ~ ~ ~ container.14 with minecraft:cobblestone{CustomModelData:2011929,SE_CustomTextureItem:1b,display:{Name:'[{"text":""}]'}}
item replace block ~ ~ ~ container.15 with minecraft:cobblestone{CustomModelData:2011929,SE_CustomTextureItem:1b,display:{Name:'[{"text":""}]'}}
item replace block ~ ~ ~ container.16 with minecraft:cobblestone{CustomModelData:2011929,SE_CustomTextureItem:1b,display:{Name:'[{"text":""}]'}}
item replace block ~ ~ ~ container.17 with minecraft:cobblestone{CustomModelData:2011929,SE_CustomTextureItem:1b,display:{Name:'[{"text":""}]'}}
item replace block ~ ~ ~ container.18 with minecraft:cobblestone{CustomModelData:2011929,SE_CustomTextureItem:1b,display:{Name:'[{"text":""}]'}}
#
item replace block ~ ~ ~ container.19 with minecraft:cobblestone{CustomModelData:2011929,SE_CustomTextureItem:1b,SF_QuarryStart:1b,display:{Name:'[{"text":"Start","italic":false,"color":"green"}]'}}
item replace block ~ ~ ~ container.20 with minecraft:cobblestone{CustomModelData:2011929,SE_CustomTextureItem:1b,SF_QuarryPause:1b,display:{Name:'[{"text":"Pause","italic":false,"color":"yellow"}]'}}
execute if score @s SF_StatQ matches -2 run item replace block ~ ~ ~ container.20 with minecraft:cobblestone{CustomModelData:2011929,SE_CustomTextureItem:1b,SF_QuarryPause:1b,display:{Name:'[{"text":"Resume","italic":false,"color":"yellow"}]'}}
item replace block ~ ~ ~ container.21 with minecraft:cobblestone{CustomModelData:2011929,SE_CustomTextureItem:1b,SF_QuarryStop:1b,display:{Name:'[{"text":"Stop","italic":false,"color":"red"}]'}}
#
item replace block ~ ~ ~ container.22 with minecraft:cobblestone{CustomModelData:2011929,SE_CustomTextureItem:1b,display:{Name:'[{"text":""}]'}}
item replace block ~ ~ ~ container.23 with minecraft:cobblestone{CustomModelData:2011929,SE_CustomTextureItem:1b,display:{Name:'[{"text":""}]'}}
item replace block ~ ~ ~ container.24 with minecraft:cobblestone{CustomModelData:2011929,SE_CustomTextureItem:1b,display:{Name:'[{"text":""}]'}}
item replace block ~ ~ ~ container.25 with minecraft:written_book{CustomModelData:2011929,SE_CustomTextureItem:1b,SF_QuarryManual:1b,pages:['["",{"text":"How to configure the Quarry ?","bold":true,"underlined":true},{"text":"\\nYou need to setup coordinates by using these commands near the quarry:\\n","italic":false,"color":"reset"},{"text":"- /trigger ","italic":true},{"text":"SF_Qx1","italic":true,"italic":false,"color":"red"},{"text":" set <value>","italic":false,"color":"reset","italic":true},{"text":"\\n","italic":false,"color":"reset"},{"text":"SF_Qx1","italic":false,"color":"red"},{"text":" means first X position.\\nThere are 6 triggers for position:\\n","italic":false,"color":"reset"},{"text":"SF_Q","italic":false,"color":"red"},{"text":"[","italic":false,"color":"reset"},{"text":"x1,x2,y1,y2,z1,z2","italic":false,"color":"red"},{"text":"]","italic":false,"color":"reset"}]','["",{"text":"To reset coordinates, just type "},{"text":"/trigger SF_ResetQ set 1","bold":true,"underlined":true},{"text":"\\n\\n","italic":false,"color":"reset"},{"text":"Warning:","bold":true,"underlined":true,"italic":false,"color":"dark_red"},{"text":"\\n","italic":false,"color":"reset"},{"text":"The quarry will not stop mining when the storage is full, so the blocks will drop where they were mined.","italic":false,"color":"red"}]'],title:"Quarry Manual",author:"Stardust Fragment"}
item replace block ~ ~ ~ container.26 with minecraft:cobblestone{CustomModelData:2013398,SE_CustomTextureItem:1b,display:{Name:'[{"text":""}]'}}