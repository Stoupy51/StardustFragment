clear @s minecraft:command_block{stardust:{stardust_dungeon_key:1b}} 1
tp @s 6 100 -11
effect give @s slow_falling 5
playsound entity.player.levelup ambient @s 6 98 -11
playsound entity.player.levelup ambient @s 6 98 -11
playsound entity.player.levelup ambient @s 6 98 -11
advancement grant @s only stardust:visible/enter_dungeon
