/obj/item/matter_cartridge
	name = "matter cartridge"
	icon = 'icons/obj/items/matter_cartridge.dmi'
	icon_state = "rcd"
	desc = "Contains a lot of atoms!"
	desc_extended = "RCDs use this as ammo. Stick inside an RCD when empty to refill it of atoms."


/obj/item/matter_cartridge/click_on_object(var/mob/caller as mob,var/atom/object,location,control,params)

	if(istype(object,/obj/item/weapon/melee/tool/rcd/))
		var/obj/item/weapon/melee/tool/rcd/R = object
		R.add_matter(R.matter_max)
		caller.to_chat("You refill \the [R.name].")
		qdel(src)
		return TRUE

	return ..()