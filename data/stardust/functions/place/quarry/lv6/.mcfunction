
setblock ~ ~ ~ barrel[facing=down]{CustomName:'[{"text":"Creative Quarry (50 block/s)"}]'}
data modify block ~ ~ ~ Lock set value ""
execute align xyz positioned ~.5 ~.5 ~.5 summon item_display at @s run function stardust:place/quarry/lv6/secondary

