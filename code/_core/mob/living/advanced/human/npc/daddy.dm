/mob/living/advanced/npc/daddy
	name = "\improper the legend"
	enable_AI = TRUE
	starting_factions = list(
		FACTION_PLAYER_HOSTILE
	)
	ai = /ai/advanced/daddy
	class = "daddy"


/mob/living/advanced/npc/daddy/setup_name()
	name = "\improper THE LEGEND (SL 99)"
	return TRUE

/mob/living/advanced/npc/daddy/Initialize()

	. = ..()

	add_outfit("daddy")

	var/obj/item/weapon/melee/zweihander/W = new(src.loc)
	pickup(W,FALSE)

	var/obj/item/weapon/melee/shield/S = new(src.loc)
	pickup(S,TRUE)

	return .