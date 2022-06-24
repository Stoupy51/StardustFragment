
data modify block ~ ~ ~ TransferCooldown set value 30
execute unless data block ~ ~ ~ Items[4] run function stardust:quarry/extract/hopper/secondary
