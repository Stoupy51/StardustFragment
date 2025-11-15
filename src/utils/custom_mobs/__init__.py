
# Imports
from .boss.stardust_guardian import main as stardust_guardian_main
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

    # Cavern dimension
    cavern_mobs_main()

    # Celestial dimension
    celestial_mobs_main()

    # Stardust dimension
    stardust_mobs_main()
    stardust_pillar_main()

    # Dungeon dimension
    dungeon_mobs_main()
    stardust_guardian_main()

