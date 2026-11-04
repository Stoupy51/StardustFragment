function stardust_test:forge/drop {id:"compacted_stardust_shard",count:4}
summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:netherite_spear",count:1},PickupDelay:32767s}
summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:blue_stained_glass",count:4},PickupDelay:32767s}
summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:diamond_spear",count:1},PickupDelay:32767s}
summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:lapis_lazuli",count:64},PickupDelay:32767s}
summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:lapis_lazuli",count:32},PickupDelay:32767s}
summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:golden_spear",count:1},PickupDelay:32767s}
summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:raw_gold_block",count:4},PickupDelay:32767s}
summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:iron_spear",count:1},PickupDelay:32767s}
$function stardust_test:forge/drop {id:"dragon_pearl",count:$(dragon_pearls)}
