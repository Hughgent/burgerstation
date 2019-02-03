var/global/list/hair_head_types = list()
var/global/list/hair_head_ids = list()
var/global/list/hair_head_names = list()
var/global/list/hair_head_icons = list()


var/global/list/hair_face_types = list()
var/global/list/hair_face_ids = list()
var/global/list/hair_face_names = list()
var/global/list/hair_face_icons = list()




/subsystem/hair/
	name = "Hair Subsystem"
	desc = "Yes, there is a fucking subsystem dedicated to hair."
	priority = SS_ORDER_HAIR

/subsystem/hair/on_life()

	for(var/v in subtypesof(/hair/head/))
		var/hair/head/H = new v
		hair_head_types[H.id] = H
		if(H.chargen)
			var/icon/I = new /icon(H.icon,H.icon_state)
			I.Shift(SOUTH,9)
			I.Scale(128, 128)
			I.Crop(64-32,64-32,64+32,64+32)
			I.Blend("#888888",ICON_MULTIPLY)
			hair_head_icons[H.id] = I
			hair_head_ids += H.id
			hair_head_names += H.name

	for(var/v in subtypesof(/hair/face/))
		var/hair/face/H = new v
		hair_face_types[H.id] = H
		if(H.chargen)
			var/icon/I = new /icon(H.icon,H.icon_state)
			I.Shift(SOUTH,9)
			I.Scale(128, 128)
			I.Crop(64-32,64-32,64+32,64+32)
			I.Blend("#888888",ICON_MULTIPLY)
			hair_face_icons[H.id] = I
			hair_face_ids += H.id
			hair_face_names += H.name






	return FALSE