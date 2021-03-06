/obj/item/container/food/dynamic/cheese
	name = "cheese"
	desc = "A rat's favorite."

	icon = 'icons/obj/items/consumable/food/cheese.dmi'
	icon_state = "wheel"

	health = /health/obj/item/misc/

	scale_sprite = FALSE

	var/created_date //Timestamp here.
	var/created_time

	scale_sprite = FALSE

	reagents = /reagent_container/food/cheese

/obj/item/container/food/dynamic/cheese/on_spawn()
	created_date = get_date()
	created_time = get_time()
	return ..()

/obj/item/container/food/dynamic/cheese/on_damage_received(var/atom/atom_damaged,var/atom/attacker,var/list/damage_table,var/damage_amount)

	var/original_volume = reagents.volume_current

	if(icon_state == "wheel")
		var/pieces = floor(original_volume/10)
		if(pieces <= 1 || original_volume < pieces)
			if(is_living(attacker))
				var/mob/living/L = attacker
				L.to_chat("There isn't enough cheese to cut!")
			return ..()

		for(var/i=1,i<=pieces,i++)
			var/obj/item/container/food/dynamic/cheese/C = new(get_turf(src))
			C.icon_state = "wheel"
			reagents.transfer_reagents_to(C.reagents,original_volume/pieces)
			animate(C,pixel_x = rand(-16,16),pixel_y=rand(-16,16),time=SECONDS_TO_DECISECONDS(1))

		if(is_living(attacker))
			var/mob/living/L = attacker
			L.to_chat("You cut \the [src.name] into [pieces] cheese pieces.")

		qdel(src)

	else if(has_prefix(icon_state,"block"))

		if(original_volume > 10)
			var/pieces = floor(original_volume/10)
			if(pieces <= 1 || original_volume < pieces)
				if(is_living(attacker))
					var/mob/living/L = attacker
					L.to_chat("There isn't enough cheese to cut!")
				return ..()

			for(var/i=1,i<=pieces,i++)
				var/obj/item/container/food/dynamic/cheese/C = new(get_turf(src))
				C.icon_state = "block"
				reagents.transfer_reagents_to(C.reagents,original_volume/pieces)
				animate(C,pixel_x = rand(-16,16),pixel_y=rand(-16,16),time=SECONDS_TO_DECISECONDS(1))

			if(is_living(attacker))
				var/mob/living/L = attacker
				L.to_chat("You cut \the [src.name] into [pieces] cheese pieces.")

			qdel(src)

		else if(original_volume <= 1)
			if(is_living(attacker))
				var/mob/living/L = attacker
				L.to_chat("There isn't enough cheese to cut!")
			return ..()
		else
			var/obj/item/container/food/dynamic/cheese/C = new(get_turf(src))
			C.icon_state = "block"
			reagents.transfer_reagents_to(C.reagents,1)
			animate(C,pixel_x = rand(-16,16),pixel_y=rand(-16,16),time=SECONDS_TO_DECISECONDS(1))
			if(is_living(attacker))
				var/mob/living/L = attacker
				L.to_chat("You slice a thin slice of cheese off the top of \the [src.name].")

	return ..()

/obj/item/container/food/dynamic/cheese/can_be_attacked(var/atom/attacker)
	return TRUE

/obj/item/container/food/dynamic/cheese/update_icon()

	if(icon_state == "wheel" && reagents.volume_current <= 10)
		icon_state = "wheel_slice"

	else if(has_prefix(icon_state,"block"))
		if(reagents.volume_current > 10)
			icon_state = "block"
		else
			icon_state = "block_slice_[ceiling(reagents.volume_current)]"

	color = reagents.color

	return ..()

/obj/item/container/food/dynamic/cheese/block
	name = "block cheese"
	icon_state = "block"

/obj/item/container/food/dynamic/cheese/block/on_spawn()
	reagents.add_reagent("processed_cheese",40)
	return ..()

/obj/item/container/food/dynamic/cheese/wheel
	name = "wheel cheese"
	icon_state = "wheel"

/obj/item/container/food/dynamic/cheese/wheel/on_spawn()
	reagents.add_reagent("processed_cheese",40)
	return ..()