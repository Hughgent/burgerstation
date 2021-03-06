/obj/hud/button/slot
	name = "slot button"
	desc = "Slot button for quick actions."
	desc_extended = "Press this button to activate that item on the tile you're pointing."
	icon_state = "square_trim"
	screen_loc = "LEFT,TOP"
	alpha = 200

	flags = FLAGS_HUD_MOB

	var/obj/item/stored_item

	var/active = FALSE

	plane = PLANE_HUD

	mouse_over_pointer = MOUSE_ACTIVE_POINTER
	mouse_drag_pointer = MOUSE_ACTIVE_POINTER
	mouse_drop_pointer = MOUSE_ACTIVE_POINTER
	mouse_drop_zone = 1

	mouse_opacity = 2

/obj/hud/button/slot/Destroy()
	stored_item = null
	return ..()

/obj/hud/button/slot/update_icon()

	.= ..()

	overlays.Cut()
	if(stored_item)
		var/image/I = new/image(stored_item.icon,stored_item.icon_state)
		I.appearance = stored_item.appearance
		I.plane = PLANE_HUD_OBJ
		overlays += I

	if(active)
		color = "#00FF00"
	else
		color = "#FFFFFF"

	return .

/obj/hud/button/slot/proc/activate_button(var/mob/living/advanced/caller)

	if(!stored_item)
		return FALSE

	if(!is_valid(stored_item))
		clear_object(caller)
		return FALSE

	if(stored_item.quick_function_type == FLAG_QUICK_INSTANT)
		stored_item.quick(caller)
		caller.quick_mode = 0
		spawn()
			color = "#00FF00"
			sleep(5)
			color = "#FFFFFF"
	else
		active = !active
		caller.quick_mode = active ? id : null
		update_icon()

	if(active)
		for(var/obj/hud/button/slot/S in owner.buttons)
			if(S == src)
				continue
			S.active = FALSE
			S.update_icon()

	return TRUE

/obj/hud/button/slot/proc/clear_object(var/mob/living/advanced/A)
	if(stored_item)
		A.to_chat(span("notice","\The [stored_item.name] was unbound from slot [icon_state]."))
		stored_item = null
		update_icon()
		//animate(src,alpha=100,time=SECONDS_TO_DECISECONDS(1))
	return TRUE

/obj/hud/button/slot/dropped_on_by_object(var/atom/caller,var/atom/object)

	if(stored_item)
		stored_item.dropped_on_by_object(caller,object)
		return TRUE

	return clicked_on_by_object(caller,object)

/obj/hud/button/slot/clicked_on_by_object(caller,object,location,control,params)

	if(!is_advanced(caller))
		return ..()

	var/mob/living/advanced/A = caller

	clear_object(A)

	if(!is_item(object))
		return ..()

	var/obj/item/I = object

	if(!I.has_quick_function)
		A.to_chat(span("notice","\The [I.name] doesn't have a quick bind function."))
		return TRUE

	stored_item = object
	A.to_chat(span("notice","\The [I.name] was bound to slot [maptext]."))
	//animate(src,alpha=255,time=SECONDS_TO_DECISECONDS(1))
	update_icon()

	return ..()

/obj/hud/button/slot/A
	id = "1"
	maptext = "1"
	screen_loc = "LEFT,TOP"

/obj/hud/button/slot/B
	id = "2"
	maptext = "2"
	screen_loc = "LEFT+1,TOP"

/obj/hud/button/slot/C
	id = "3"
	maptext = "3"
	screen_loc = "LEFT+2,TOP"

/obj/hud/button/slot/D
	id = "4"
	maptext = "4"
	screen_loc = "LEFT+3,TOP"

/obj/hud/button/slot/E
	id = "5"
	maptext = "5"
	screen_loc = "LEFT+4,TOP"

/obj/hud/button/slot/F
	id = "6"
	maptext = "6"
	screen_loc = "LEFT+5,TOP"

/obj/hud/button/slot/G
	id = "7"
	maptext = "7"
	screen_loc = "LEFT+6,TOP"

/obj/hud/button/slot/H
	id = "8"
	maptext = "8"
	screen_loc = "LEFT+7,TOP"

/obj/hud/button/slot/I
	id = "96"
	maptext = "9"
	screen_loc = "LEFT+8,TOP"

/obj/hud/button/slot/J
	id = "0"
	maptext = "0"
	screen_loc = "LEFT+9,TOP"
