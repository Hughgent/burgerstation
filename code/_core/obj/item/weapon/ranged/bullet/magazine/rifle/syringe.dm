/obj/item/weapon/ranged/bullet/magazine/rifle/syringe
	name = "\improper syringe rifle"
	icon = 'icons/obj/items/weapons/ranged/misc/syringe.dmi'
	icon_state = "inventory"

	shoot_delay = 8

	automatic = FALSE

	bullet_count_max = 1 //One in the chamber

	bullet_type = "syringe_gun"

	shoot_sounds = list('sounds/weapons/silenced/fire.ogg')

	can_wield = FALSE

	view_punch = 1

	slowdown_mul_held = HELD_SLOWDOWN_RIFLE

	size = SIZE_4
	weight = WEIGHT_4

	override_icon_state = TRUE

	requires_cock_each_shot = TRUE

/obj/item/weapon/ranged/bullet/magazine/rifle/syringe/update_icon()
	if(stored_magazine)
		var/obj/item/magazine/M = stored_magazine
		var/stored_bullets = length(M.stored_bullets)
		if(stored_bullets == 1)
			icon_state = "[initial(icon_state)]_[round(stored_bullets,1)]"
		else
			icon_state = "[initial(icon_state)]_[round(stored_bullets,2)]"
	else
		icon_state = initial(icon_state)

	..()

/obj/item/weapon/ranged/bullet/magazine/rifle/syringe/get_static_spread() //Base spread
	return 0

/obj/item/weapon/ranged/bullet/magazine/rifle/syringe/get_skill_spread(var/mob/living/L) //Base spread
	return 0.1 - (0.1 * L.get_skill_power(SKILL_RANGED))
