extends StaticBody3D

var usable_inventory : Array

func CheckInventory(player):
	usable_inventory = []
	var objects_count = 0
	for i in player.inventory:
		var script = load("res://scripts/objects/" + str(i) + ".gd")
		var object = script.new()
		if object.cook_item != 0:
			objects_count += 1
			usable_inventory.append(i)
	if objects_count > 0:
		return true
	else:
		return false
		
func LaunchInventoryView():
	var freq: Dictionary = {}
	for i in usable_inventory:
		freq[i] = freq.get(i, 0) + 1
		
	var names: Dictionary = {}
	for i in freq:
		var script = load("res://scripts/objects/" + str(i) + ".gd")
		var object = script.new()
		names[i] = object.object_name
		
	$InventoryView.open(freq, names, cook)

func interact():
	var player = get_node("/root/Game/Player")
	var HUD = get_node("/root/Game/Player/HUD")
	var has_in_inventory = CheckInventory(player)
	if has_in_inventory:
		LaunchInventoryView()
	else:
		HUD.DisplayText("You don't have anything to cook", 1, 1)

func cook(selected):
	if selected!= 0:
		var player = get_node("/root/Game/Player")
		var script = load("res://scripts/objects/" + str(selected) + ".gd")
		var object  = script.new()
		
		player.removeFromInventory(selected)
		player.addToInventory(object.cook_item)
