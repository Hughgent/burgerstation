/mob/living/advanced/npc/evil_wizard
	name = "Merlin"
	id = "merlin"
	starting_factions = list(
		FACTION_PLAYER_HOSTILE
	)
	ai = /ai/advanced/ranged/wizard
	class = "wizard"

	loot_drop = "wizard"

	force_spawn = TRUE
	boss = TRUE

	loot_drop_in_corpse = TRUE

/mob/living/advanced/npc/evil_wizard/Initialize()

	. = ..()

	change_organ_visual("hair_face", desired_color = "#FFFFFF", desired_icon_state = "facial_wise_s")
	update_all_blends()
	add_outfit("wizard_evil")

	pickup(new /obj/item/weapon/ranged/magic/staff/basic(src.loc),FALSE)
	pickup(new /obj/item/weapon/ranged/magic/tome/lightning(src.loc),TRUE)

	return .