/mob/living/simple/npc/crab
	name = "crab"
	icon = 'icons/mob/living/simple/crab.dmi'
	icon_state = "crab"
	damage_type = "crab_claw"
	class = "crab"

	ai = /ai/simple/crab/

	stun_angle = 180

	loot_drop = "crab"

	armor_base = list(
		BLADE = ARMOR_C,
		BLUNT = ARMOR_E,
		PIERCE = ARMOR_C,
		LASER = -ARMOR_C,
		MAGIC = -ARMOR_C,
		HEAT = -ARMOR_D,
		COLD = -ARMOR_D,
		BOMB = -ARMOR_D,
		BIO = 0,
		RAD = 0,
		HOLY = 0,
		DARK = 0,
		FATIGUE = ARMOR_C
	)

/mob/living/simple/npc/crab/post_death()
	..()
	icon_state = "[initial(icon_state)]_dead"
	update_icon()

/mob/living/simple/npc/crab/passive
	ai = /ai/passive/crab
	can_attack_while_moving = FALSE

/mob/living/simple/npc/crab/king
	name = "king crab"
	desc = "A crab this size must be the work of some maniac."
	desc_extended = "A ferocious king crab with massive sharp claws and a thick magic and bullet deflecting outer shell. You'll likely have to get up close and personal in order to crack this crab."
	id = "crab_king"
	icon = 'icons/mob/living/simple/crab_king.dmi'
	icon_state = "king"
	pixel_x = -32
	pixel_y = -12

	health_base = 500

	ai = /ai/simple/king_crab

	class = "crab_king"
	loot_drop = "crab"

	object_size = 1

	boss = TRUE
	force_spawn = TRUE
	boss_music = "crab_rave"

	damage_type = "crab_claw_king"

	armor_base = list(
		BLADE = ARMOR_S,
		BLUNT = ARMOR_C,
		PIERCE = ARMOR_S,
		LASER = ARMOR_C,
		MAGIC = ARMOR_C,
		HEAT = -ARMOR_D,
		COLD = -ARMOR_D,
		BOMB = -ARMOR_D,
		BIO = 0,
		RAD = 0,
		HOLY = 0,
		DARK = 0,
		FATIGUE = ARMOR_A
	)



/mob/living/simple/npc/crab/king/Cross(atom/movable/O,var/atom/NewLoc,var/atom/OldLoc)

	if(istype(O,/mob/living/simple/npc/crab/))
		return TRUE

	return ..()

/mob/living/simple/npc/crab/king/get_dodge_chance(var/atom/attacker,var/atom/weapon,var/atom/target,var/damagetype/DT)
	return 0

/mob/living/simple/npc/crab/king/get_block_chance(var/atom/attacker,var/atom/weapon,var/atom/target,var/damagetype/DT)

	. = ..()

	switch(DT.get_attack_type())
		if(ATTACK_TYPE_MELEE)
			return .

		if(ATTACK_TYPE_RANGED)
			return . + 90

		if(ATTACK_TYPE_MAGIC)
			return . + 75

	return .

