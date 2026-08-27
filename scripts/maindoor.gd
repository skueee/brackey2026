extends StaticBody3D

var someone_is_there : bool = false
var current_person_id : int

# Group 2 as way fewer chances to get selected
var group1 = []
var group2 = []

func interact():
	if someone_is_there:
		pass
	else:
		get_node("/root/Game/Player/HUD").DisplayText("No one is there", 1, 0.8)
