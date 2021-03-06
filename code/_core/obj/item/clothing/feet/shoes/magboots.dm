/obj/item/clothing/feet/shoes/magboot
	name = "right magboot"
	rarity = RARITY_UNCOMMON
	icon_state = "inventory_right"
	icon_state_worn = "worn_right"
	worn_layer = LAYER_MOB_CLOTHING_BELT

	icon = 'icons/obj/items/clothing/shoes/magboots.dmi'

	item_slot = SLOT_FOOT_RIGHT_O
	protected_limbs = list(BODY_FOOT_RIGHT)

	defense_rating = list(
		BLADE = ARMOR_C,
		BLUNT = ARMOR_C,
		PIERCE = ARMOR_D,
		LASER = ARMOR_E,
		MAGIC = -ARMOR_C,
		HEAT = ARMOR_E,
		COLD = ARMOR_C,
		BOMB = ARMOR_E
	)

	size = SIZE_2
	weight = WEIGHT_2

	slowdown_mul_worn = 1.1

/obj/item/clothing/feet/shoes/magboot/left
	name = "left magboot"
	icon_state = "inventory_left"
	icon_state_worn = "worn_left"

	item_slot = SLOT_FOOT_LEFT_O
	protected_limbs = list(BODY_FOOT_LEFT)

	slowdown_mul_worn = 1.1

