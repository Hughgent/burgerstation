//Basically a class system for mobs only.
/class/
	var/name
	var/desc
	var/id

	var/list/attributes = list(
		ATTRIBUTE_STRENGTH = 15,
		ATTRIBUTE_VITALITY = 15,
		ATTRIBUTE_FORTITUDE = 15,

		ATTRIBUTE_INTELLIGENCE = 15,
		ATTRIBUTE_RESOLVE = 15,
		ATTRIBUTE_WILLPOWER = 15,

		ATTRIBUTE_AGILITY = 15,
		ATTRIBUTE_ENDURANCE = 15,
		ATTRIBUTE_LUCK = 50
	)

	var/list/skills = list(
		SKILL_UNARMED = 5,
		SKILL_MELEE = 5,
		SKILL_RANGED = 5,

		SKILL_BLOCK = 5,
		SKILL_DODGE = 5,
		SKILL_PARRY = 5,

		SKILL_MAGIC_OFFENSIVE = 0,
		SKILL_MAGIC_DEFENSIVE = 0,
		SKILL_MAGIC_SUPPORT = 0,

		SKILL_STEALTH = 5,
		SKILL_LOCKPICKING = 5,
		SKILL_THEFT = 0,

		SKILL_ALCHEMY = 5,
		SKILL_COOKING = 5,
		SKILL_ENCHANTING = 0
	)