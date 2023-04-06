
## Check if Stardust Fragment is loadable (dependencies)
scoreboard players set #load_error stardust.data 0
# None for now
#execute if score #load_error stardust.data matches 0 unless score #smithed.damage.major load.status matches 0.. run scoreboard players set #load_error stardust.data 4

