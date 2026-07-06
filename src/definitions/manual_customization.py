
# Imports
from stewbeet import Manual, Phase, get_manual


def manual_customization_main() -> None:
	""" Customize the in-game manual using the public ingame_manual v2 API.

	Cross-links related pages (bosses, their summoners, quest drops and dimensions) with
	extra wiki buttons. Every relation is bidirectional: each pair gets a link button on
	both pages (the pillar/infuser pair shows the infuser's full recipe button instead).
	"""
	manual: Manual = get_manual()

	@manual.on(Phase.PREPARED)
	def cross_link_pages(m: Manual) -> None: # pyright: ignore[reportUnusedFunction]

		def link_both(a: str, b: str) -> None:
			""" Add a link button on each page pointing to the other (skips unknown items). """
			page_a, page_b = m.get_page_for_item(a), m.get_page_for_item(b)
			if page_a is None or page_b is None:
				return
			page_a.extra_buttons.append(m.recipes.link_button(b))
			page_b.extra_buttons.append(m.recipes.link_button(a))

		# Stardust Pillar boss <-> its summoner: the pillar page shows the infuser's full
		# recipe button (hover = the recipe), the infuser page links back to the pillar.
		pillar = m.get_page_for_item("stardust_pillar")
		infuser = m.get_page_for_item("starlight_infuser")
		if pillar is not None and infuser is not None:
			infuser_recipe_button = m.recipes.button_for_item("starlight_infuser")
			if infuser_recipe_button is not None:
				pillar.extra_buttons.append(infuser_recipe_button)
			infuser.extra_buttons.append(m.recipes.link_button("stardust_pillar"))

		# Related pages, linked on both sides
		pairs: list[tuple[str, str]] = [
			("stardust_pillar", "stardust_dungeon_key"),			# The key is the pillar's quest drop
			("stardust_pillar", "stardust_soldier"),				# Mobs summoned by the pillar
			("stardust_pillar", "stardust_evoker"),
			("stardust_pillar", "stardust_bat"),
			("stardust_portal", "stardust_pillar"),
			("stardust_portal", "stardust_soldier"),				# Mobs found in the stardust dimension
			("stardust_portal", "stardust_evoker"),
			("stardust_portal", "stardust_bat"),
			("stardust_dungeon_key", "stardust_dungeon_portal"),	# The key opens the dungeon
			("stardust_dungeon_portal", "stardust_guardian"),		# The dungeon boss
			("ultimate_dragon_essence", "ultimate_portal"),			# The essence is thrown in the ultimate dimension
			("ultimate_dragon_essence", "ultimate_dragon_egg"),		# The dragon's trophy drop
		]
		for a, b in pairs:
			link_both(a, b)

