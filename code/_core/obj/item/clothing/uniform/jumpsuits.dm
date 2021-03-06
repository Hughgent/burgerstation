/obj/item/clothing/uniform/jumpsuit
	name = "jumpsuit"
	desc = "A nice jumpsuit."

	icon = 'icons/obj/items/clothing/uniforms/poly_suit_new.dmi'

	flags_clothing = FLAG_CLOTHING_NOBEAST_FEET

	item_slot = SLOT_TORSO | SLOT_GROIN

	polymorphic = TRUE

	no_initial_blend = TRUE

	protected_limbs = list(BODY_TORSO,BODY_GROIN,BODY_ARM_LEFT,BODY_ARM_RIGHT,BODY_LEG_LEFT,BODY_LEG_RIGHT)

	defense_rating = list(
		BLADE = ARMOR_E,
		BLUNT = ARMOR_E,
		PIERCE = ARMOR_E,
		MAGIC = ARMOR_D,
		COLD = ARMOR_D,
	)

	color_primary = "#FFFFFF"
	color_secondary = "#FFFFFF"
	color_tertiary = "#FFFFFF"

	color_primary_desc = "shirt"
	color_secondary_desc = "pants"
	color_tertiary_desc = "shoulders"

/obj/item/clothing/uniform/jumpsuit/random/on_spawn()
	color_primary = random_color()
	color_secondary = random_color()
	color_tertiary = random_color()
	return ..()

/obj/item/clothing/uniform/jumpsuit/grey
	color_primary = "#A0A0A0"
	color_secondary = "#A0A0A0"
	color_tertiary = "#A0A0A0"

/obj/item/clothing/uniform/jumpsuit/red
	color_primary = "#FF0000"
	color_secondary = "#FF0000"
	color_tertiary = "#FF0000"

/obj/item/clothing/uniform/jumpsuit/blue
	color_primary = "#0000FF"
	color_secondary = "#0000FF"
	color_tertiary = "#0000FF"

/obj/item/clothing/uniform/jumpsuit/science
	color_primary = "#38525F"
	color_secondary = "#38525F"
	color_tertiary = "#38525F"

/obj/item/clothing/uniform/jumpsuit/dark
	name = "reinforced jumpsuit"

	color_primary = COLOR_BLACK
	color_secondary = COLOR_BLACK
	color_tertiary = COLOR_BLACK

	defense_rating = list(
		BLADE = ARMOR_D,
		BLUNT = ARMOR_D,
		PIERCE = ARMOR_D,
		MAGIC = ARMOR_E,
		COLD = ARMOR_C,
	)

/obj/item/clothing/uniform/jumpsuit/dark/security
	color_primary = COLOR_BLACK
	color_secondary = "#994444"
	color_tertiary = "#994444"

/obj/item/clothing/uniform/jumpsuit/chemist
	color_primary = "#FFFFFF"
	color_secondary = "#FFFFFF"
	color_tertiary = "#FF6A00"


/obj/item/clothing/uniform/jumpsuit/bartender
	color_primary = "#FFFFFF"
	color_secondary = COLOR_BLACK
	color_tertiary = "#FFFFFF"

/obj/item/clothing/uniform/jumpsuit/medical_doctor
	color_primary = "#FFFFFF"
	color_secondary = "#FFFFFF"
	color_tertiary = COLOR_MEDICAL

/obj/item/clothing/uniform/jumpsuit/engineering
	color_primary = COLOR_ENGINEERING
	color_secondary = COLOR_ENGINEERING
	color_tertiary = COLOR_ORANGE