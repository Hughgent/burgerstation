/obj/item/paper/
	name = "Paper"
	desc = "Paper!"

	icon = 'icons/obj/items/paper.dmi'
	icon_state = "normal"

	var/last_page = 1

	var/list/data = list("There is nothing here.","Oh god oh fuck.")

/obj/item/paper/click_self(var/mob/caller,location,control,params)

	if(!is_player(caller))
		return ..()

	var/mob/living/advanced/player/P = caller

	if(P.active_paper)
		close_menu(P,"paper")

	if(P.active_paper == src)
		P.active_paper = null
		return TRUE

	P.active_paper = src
	open_menu(P,"paper")

	return TRUE

/obj/item/paper/on_drop(var/obj/hud/inventory/old_inventory,var/atom/new_loc)

	if(old_inventory && old_inventory.owner && is_player(old_inventory.owner))
		var/mob/living/advanced/player/P = old_inventory.owner
		if(P.active_paper == src)
			close_menu(P,"paper")
			P.active_paper = null

	return ..()


/obj/item/paper/firearms/on_spawn()
	name = "book: A Guide to Firearms"
	data = all_paper_data["a guide to firearms"]
	return ..()
