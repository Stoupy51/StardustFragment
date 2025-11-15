
# Imports
from .boss.stardust_pillar import main as stardust_pillar_main
from .cavern_mobs import main as cavern_mobs_main
from .celestial_mobs import main as celestial_mobs_main
from .dungeon_mobs import main as dungeon_mobs_main
from .stardust_mobs import main as stardust_mobs_main
from .technical import main as technical_main


# Setup custom mobs
def setup_custom_mobs() -> None:

	# Setup technical features
    technical_main()

    # Setup Cavern dimension mobs
    cavern_mobs_main()

    # Setup Celestial dimension mobs
    celestial_mobs_main()

	# Setup Stardust dimension mobs
    stardust_mobs_main()

	# Setup Stardust Pillar boss mob
    stardust_pillar_main()

    # Setup Dungeon dimension mobs
    dungeon_mobs_main()

