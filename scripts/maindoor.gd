extends StaticBody3D

var someone_is_there : bool = false

func interact():
	if someone_is_there:
		pass
	else:
		get_node("/root/Game/Player/HUD").DisplayText("No one is there", 1, 0.8)
