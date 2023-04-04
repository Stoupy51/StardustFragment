
setblock ~ ~ ~ barrel[facing=down]{CustomName:'[{"text":"Quarry Lv.5 (5 block/s)"}]'}
data modify block ~ ~ ~ Lock set value ""
execute align xyz positioned ~.5 ~.5 ~.5 summon item_display at @s run function stardust:place/quarry/lv5/secondary

