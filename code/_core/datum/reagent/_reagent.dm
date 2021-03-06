

/reagent/
	var/name = "Reagent"
	var/desc = "The basic description of the reagent."
	var/desc_extended = "The extended description of the reagent, usually a detailed note of its effects."
	var/id = null

	var/color = "#FFFFFF" //Reagent's color.

	var/temperature_mod = 1

	var/metabolism_stomach = 1 //How many units of the reagent to metabolize per second.
	var/metabolism_blood = 1 //How many units of the reagent to metabolize per second.
	var/metabolism_skin = 1 //How many units of the reagent to metabolize per second.

	var/flags_metabolism = REAGENT_METABOLISM_INGEST | REAGENT_METABOLISM_BLOOD | REAGENT_METABOLISM_SKIN

	var/liquid = 0 //What percentage of this reagent is a liquid? Accepts values -1 to 1, where -1 is dry as fuck and 1 is wet as fuck.

	var/flavor = "nothing"
	var/flavor_strength = 1

	var/processed_reagent

	var/overdose_threshold = 0 //More than this is considered an overdose. Set to 0 to ignore overdose.

/reagent/proc/metabolize(var/atom/owner,var/reagent_container/container,var/starting_volume=0)

	var/container_flags_metabolism = container.flags_metabolism

	var/total_metabolized = 0

	if(starting_volume >= 0 && container_flags_metabolism & REAGENT_METABOLISM_BLOOD)
		total_metabolized += on_metabolize_blood(owner,container,starting_volume)

	if(starting_volume >= 0 && container_flags_metabolism & REAGENT_METABOLISM_INGEST)
		total_metabolized += on_metabolize_stomach(owner,container,starting_volume)

	if(starting_volume >= 0 && container_flags_metabolism & REAGENT_METABOLISM_SKIN)
		total_metabolized += on_metabolize_skin(owner,container,starting_volume)

	if(overdose_threshold && overdose_threshold >= starting_volume)
		total_metabolized += on_overdose(owner,container,starting_volume,total_metabolized)

	return total_metabolized

/reagent/proc/on_metabolize_stomach(var/atom/owner,var/reagent_container/container,var/starting_volume=0)
	return metabolism_stomach

/reagent/proc/on_metabolize_blood(var/atom/owner,var/reagent_container/container,var/starting_volume=0)
	return metabolism_blood

/reagent/proc/on_metabolize_skin(var/atom/owner,var/reagent_container/container,var/starting_volume=0)
	return metabolism_skin

/reagent/proc/on_overdose(var/atom/owner,var/reagent_container/container,var/starting_volume=0,var/metabolism_amount=0)
	return 0