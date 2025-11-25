
# Imports
from beet import Context
from stewbeet.contrib.simplenergy import (
	GuiTranslation,
	Mem,
	energy_cables_models,
	insert_lib_calls,
	keep_energy_for_batteries,
	setup_energy_balancing,
	setup_gui_in_resource_packs,
	setup_wrench,
)

from .utils.advancements import add_visible_advancements
from .utils.custom_mobs import setup_custom_mobs
from .utils.custom_ore_generation import setup_custom_ore_generation
from .utils.dimensions import setup_dimensions
from .utils.machines import setup_machines
from .utils.portals import setup_portals
from .utils.remaining import setup_remaining
from .utils.snipers import setup_snipers


# Main function is run just before making finalyzing the build process (zip, headers, lang, ...)
def beet_default(ctx: Context) -> None:

	# Add commands to place and destroy functions for energy items
	insert_lib_calls()

	# Add advancements to the datapack
	add_visible_advancements()

	# Setup GUI in resource packs
	gui: dict[str, str] = setup_gui_in_resource_packs(
		{
			"advanced_furnace_generator": GuiTranslation.furnace_top,
			"nether_star_generator": GuiTranslation.furnace_bottom,
			"quarry": GuiTranslation.barrel_bottom_right,
		} # pyright: ignore[reportArgumentType]
	)

	# Setup machines
	setup_machines(gui)

	# Setup portals, dimensions, and custom mobs
	setup_portals()
	setup_dimensions()
	setup_custom_mobs()

	# Setup rotatable tags
	setup_wrench(blocks="auto")

	# Keep energy for batteries
	keep_energy_for_batteries([x for x in Mem.definitions if x.endswith("_battery")])

	# Setup energy balancing
	setup_energy_balancing([x for x in Mem.definitions if x.endswith(("_solar_panel", "_battery"))])

	# Setup energy cables models
	energy_cables_models([x for x in Mem.definitions if x.endswith("_cable")])

	# Setup custom ore generation
	setup_custom_ore_generation()

	# Setup snipers
	setup_snipers()

	# Setup additional things
	setup_remaining()

