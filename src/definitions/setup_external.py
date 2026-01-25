
# Imports
from stewbeet import Context, ExternalItem, Mem, add_item_name_and_lore_if_missing, export_all_definitions_to_json


# Make all the external item definitions
def beet_default(ctx: Context) -> None:

	## Abstract item definitions (loot table is only required if the external item is a result of a recipe)
	ExternalItem(id="simplenergy:simplunium_block", custom_data_predicate={"simplenergy": {"simplunium_block": True}}, loot_table="simplenergy:i/simplunium_block")
	ExternalItem(id="simplenergy:simplunium_ingot", custom_data_predicate={"simplenergy": {"simplunium_ingot": True}}, loot_table="simplenergy:i/simplunium_ingot")
	ExternalItem(id="simplenergy:machine_block", custom_data_predicate={"simplenergy": {"machine_block": True}}, loot_table="simplenergy:i/machine_block")

	ExternalItem(id="simplenergy:furnace_generator", custom_data_predicate={"simplenergy": {"furnace_generator": True}}, loot_table="simplenergy:i/furnace_generator")
	ExternalItem(id="simplenergy:redstone_generator", custom_data_predicate={"simplenergy": {"redstone_generator": True}}, loot_table="simplenergy:i/redstone_generator")
	ExternalItem(id="simplenergy:solar_panel", custom_data_predicate={"simplenergy": {"solar_panel": True}}, loot_table="simplenergy:i/solar_panel")

	ExternalItem(id="simplenergy:elite_battery", custom_data_predicate={"simplenergy": {"elite_battery": True}}, loot_table="simplenergy:i/elite_battery")
	ExternalItem(id="simplenergy:elite_cable", custom_data_predicate={"simplenergy": {"elite_cable": True}}, loot_table="simplenergy:i/elite_cable")

	# External items config
	add_item_name_and_lore_if_missing(is_external=True)

	# Fix SimplEnergy lore
	for item in Mem.external_definitions.keys():
		obj = ExternalItem.from_id(item)
		obj.components["lore"] = [{"text": "SimplEnergy", "italic": True, "color": "blue"}]

	# Debug purposes: export all definitions to a single json file
	export_all_definitions_to_json(f"{Mem.ctx.directory}/external_definitions.json", is_external=True)

