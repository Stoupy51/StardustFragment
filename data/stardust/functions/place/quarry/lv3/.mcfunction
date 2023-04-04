
setblock ~ ~ ~ barrel[facing=down]{CustomName:'[{"text":"Quarry Lv.3 (3 block/s)"}]'}
data modify block ~ ~ ~ Lock set value ""
execute align xyz positioned ~.5 ~.5 ~.5 summon item_display at @s run function stardust:place/quarry/lv3/secondary

