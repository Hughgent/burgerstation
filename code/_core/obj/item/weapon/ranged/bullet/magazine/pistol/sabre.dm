/obj/item/weapon/ranged/bullet/magazine/pistol/high_calibre
	name = "\improper 12.7mm Sabre Pistol"
	desc = "12.7mm Sabre Pistol"
	desc_extended = "A very powerful semiautomatic pistol commonly used by high ranking Syndicate Operatives. The stopping power rivals the .50 Eagle guns."
	icon = 'icons/obj/items/weapons/ranged/pistol/12mm.dmi'
	icon_state = "inventory"
	value = 150

	shoot_delay = 3

	automatic = FALSE

	bullet_count_max = 1 //One in the chamber

	bullet_type = "12.7mm"

	shoot_sounds = list('sounds/weapons/pistol/shoot.ogg')

	can_wield = FALSE

	view_punch = 6

	cock_sound = 'sounds/weapons/gun_slide1.ogg'

	slowdown_mul_held = HELD_SLOWDOWN_PISTOL

	size = SIZE_2
	weight = WEIGHT_3

	automatic = TRUE