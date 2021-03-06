/health/mob/living/advanced/adjust_brute_loss(var/value)

	if(!is_advanced(owner))
		return 0

	var/mob/living/advanced/A = owner

	return A.heal_all_organs(-value,0,0,0)

/health/mob/living/advanced/adjust_burn_loss(var/value)

	if(!is_advanced(owner))
		return 0

	var/mob/living/advanced/A = owner

	return A.heal_all_organs(0,-value,0,0)

/health/mob/living/advanced/adjust_tox_loss(var/value)

	if(!is_advanced(owner))
		return 0

	var/mob/living/advanced/A = owner

	return A.heal_all_organs(0,0,-value,0)

/health/mob/living/advanced/adjust_oxy_loss(var/value)

	if(!is_advanced(owner))
		return 0

	var/mob/living/advanced/A = owner

	return A.heal_all_organs(0,0,0,-value)

/health/mob/living/advanced/adjust_fatigue_loss(var/value)

	if(!is_advanced(owner))
		return 0

	var/mob/living/advanced/A = owner

	if(!value)
		return 0

	if(A.status & FLAG_STATUS_FATIGUE)
		return 0

	if(adjust_stamina(-value))
		A.update_health_element_icons(stamina=TRUE)

	if(stamina_current <= 0)
		A.add_fatigue(100)

	return value

health/mob/living/advanced/update_stats()

	if(!is_advanced(owner))
		return 0

	var/mob/living/advanced/A = owner

	var/endurance = A.get_attribute_power(ATTRIBUTE_ENDURANCE) //Endurance is used twice here.

	health_max = A.health_base + A.get_attribute_power(ATTRIBUTE_VITALITY)*400
	stamina_max = A.stamina_base + endurance*400
	mana_max = A.mana_base + A.get_attribute_power(ATTRIBUTE_WISDOM)*400

	if(health_current <= 0)
		health_regeneration = health_max * (0.01 + A.get_attribute_power(ATTRIBUTE_FORTITUDE)*0.025)
	else
		health_regeneration = health_max * (0.002 + A.get_attribute_power(ATTRIBUTE_FORTITUDE)*0.005)

	if(A.status & FLAG_STATUS_FATIGUE || A.status & FLAG_STATUS_SLEEP)
		stamina_regeneration = stamina_max * (0.1 + endurance*0.15)
	else
		stamina_regeneration = stamina_max * (0.02 + endurance*0.03)

	if(A.status & FLAG_STATUS_SLEEP)
		mana_regeneration = mana_max * (0.05 + A.get_attribute_power(ATTRIBUTE_WILLPOWER)*0.1)
	else
		mana_regeneration = mana_max * (0.01 + A.get_attribute_power(ATTRIBUTE_WILLPOWER)*0.02)

	A.update_health_element_icons(TRUE,TRUE,TRUE)


/health/mob/living/advanced/update_health(var/damage_dealt,var/atom/attacker,var/update_hud=TRUE)

	. = ..()

	if(!is_advanced(owner))
		return .

	var/mob/living/advanced/A = owner

	if(health_current <= 0 && !A.crit_time)
		A.set_crit()

	else if(health_current > 0 && A.crit_time)
		A.unset_crit()

	return .


/health/mob/living/advanced/get_defense(var/atom/attacker,var/atom/hit_object)

	if(!is_advanced(owner))
		return 0

	var/mob/living/advanced/A = owner

	var/list/returning_value = ..()

	if(is_organ(hit_object))
		var/obj/item/organ/O = hit_object

		for(var/obj/item/clothing/C in A.worn_objects)

			if(!C.defense_rating && length(C.defense_rating))
				continue

			if(!(O.id in C.protected_limbs))
				continue

			for(var/damage_type in C.defense_rating)
				returning_value[damage_type] += C.defense_rating[damage_type]

	return returning_value


/health/mob/living/advanced/get_total_loss()

	if(!is_advanced(owner))
		return 0

	var/mob/living/advanced/A = owner

	for(var/obj/item/organ/O in A.organs)
		if(!O.health)
			continue
		. += O.health.get_total_loss()

	return .