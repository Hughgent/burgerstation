var/global/list/all_classes = list()

/subsystem/classes/
	name = "Class Subsystem"
	desc = "Stores all the known classes in a list."
	priority = SS_ORDER_PRELOAD

/subsystem/classes/Initialize()
	for(var/A in subtypesof(/class/))
		var/class/C = new A
		all_classes[C.id] = C

	LOG_SERVER("Initialized [length(all_classes)] classes.")