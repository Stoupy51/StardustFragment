
# Imports
from stewbeet import Manual, Phase, get_manual


def manual_customization_main() -> None:
	""" Customize the in-game manual using the public ingame_manual v2 API.

	Cross-links the Stardust Pillar and Starlight Infuser pages: the pillar page shows the
	infuser's recipe button (click -> infuser page), and the infuser page gets a link button
	back to the pillar page.
	"""
	manual: Manual = get_manual()

	@manual.on(Phase.PREPARED)
	def link_pillar_and_infuser(m: Manual) -> None: # pyright: ignore[reportUnusedFunction]
		# TODO: also link stardust pillar to the Stardust Dungeon Key, and link Stardust Dungeon Key to the Stardust Dungeon Portal
		# TODO: Actually, look at all the mobs and items and their links and add them yourself, Claude.
		pillar = m.get_page_for_item("stardust_pillar")
		infuser = m.get_page_for_item("starlight_infuser")
		if pillar is None or infuser is None:
			return

		# Show the Starlight Infuser's recipe on the Stardust Pillar page (click -> its page)
		infuser_recipe_button = m.recipes.button_for_item("starlight_infuser")
		if infuser_recipe_button is not None:
			pillar.extra_buttons.append(infuser_recipe_button)

		# And link back: a button on the Starlight Infuser page opening the Stardust Pillar page
		infuser.extra_buttons.append(m.recipes.link_button("stardust_pillar"))

