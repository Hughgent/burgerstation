/damagetype/ranged/bullet/shotgun/buckshot
	name = "12 gauge buckshot pellet"
	id = "12_buckshot"

	//The base attack damage of the weapon. It's a flat value, unaffected by any skills or attributes.
	attack_damage_base = list(
		BLADE = DAMAGE_E,
		BLUNT = DAMAGE_E,
		PIERCE = DAMAGE_E
	)

	//How much armor to penetrate. It basically removes the percentage of the armor using these values.
	attack_damage_penetration = list(
		BLADE = DAMAGE_E,
		BLUNT = DAMAGE_E,
		PIERCE = DAMAGE_E
	)

/damagetype/ranged/bullet/shotgun/slug
	name = "12 gauge buckshot slug"
	id = "12_slug"

	//The base attack damage of the weapon. It's a flat value, unaffected by any skills or attributes.
	attack_damage_base = list(
		BLUNT = DAMAGE_B,
		PIERCE = DAMAGE_C
	)

	//How much armor to penetrate. It basically removes the percentage of the armor using these values.
	attack_damage_penetration = list(
		BLUNT = ARMOR_C,
		PIERCE = ARMOR_C
	)


/damagetype/ranged/bullet/shotgun/rubber
	name = "12 gauge rubber ball"
	id = "12_rubber"

	//The base attack damage of the weapon. It's a flat value, unaffected by any skills or attributes.
	attack_damage_base = list(
		BLUNT = DAMAGE_E,
		FATIGUE = DAMAGE_C
	)

	//How much armor to penetrate. It basically removes the percentage of the armor using these values.
	attack_damage_penetration = list(
		BLUNT = ARMOR_F,
		FATIGUE = ARMOR_F
	)