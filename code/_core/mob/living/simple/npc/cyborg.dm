/mob/living/simple/npc/silicon/
	name = "robot"
	icon = 'icons/mob/living/simple/robots.dmi'
	icon_state = "robot_old"

	damage_type = "cult_blade"

	ai = /ai/simple/karma_borg/


/mob/living/simple/npc/silicon/engineer
	name = "engineer cyborg"
	icon_state = "engineer"

	damage_type = "cult_blade"


/mob/living/simple/npc/silicon/engineer/Initialize()
	..()
	flick("engineer_transform",src)


/mob/living/simple/npc/silicon/squats
	name = "S.Q.U.A.T.S."
	icon_state = "squats"

	damage_type = "squats_punch"

	class = "squats"

	movement_delay = DECISECONDS_TO_TICKS(1)

	sprint_delay_mul = 1
	jog_delay_mul = 3
	walk_delay_mul = 3

/mob/living/simple/npc/silicon/squats/post_death()

	. = ..()
	icon_state = "squats-dead"
	update_icon()
	return .


/mob/living/simple/npc/silicon/squats/Initialize()
	. = ..()
	update_icon()
	return .

/mob/living/simple/npc/silicon/squats/update_icon()

	if(!health)
		return ..()

	if(icon_state == "squats-roll" || icon_state == "squats-dead")
		icon = initial(icon)
		return ..()

	icon = initial(icon)

	var/icon/new_icon = icon(icon,icon_state)
	var/icon/shield_icon = icon(icon,"squats-shield")
	new_icon.Blend(shield_icon,ICON_OVERLAY)
	icon = new_icon

	return ..()

/mob/living/simple/npc/silicon/squats/on_sprint()
	. = ..()
	if(.)
		if(icon_state != "squats-roll")
			icon_state = "squats-roll"
			update_icon()

	return .

/mob/living/simple/npc/silicon/squats/on_jog()
	. = ..()
	if(.)
		if(icon_state != "squats")
			icon_state = "squats"
			update_icon()

	return .

/mob/living/simple/npc/silicon/squats/on_walk()
	. = ..()
	if(.)
		if(icon_state != "squats")
			icon_state = "squats"
			update_icon()

	return .