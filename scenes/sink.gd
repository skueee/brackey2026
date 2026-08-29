extends StaticBody3D

var price = 3
var interact_label = "Press E to drink water\n(" + str(price) + "$)"

func interact():
	var player = get_node("/root/Game/Player")
	var HUD = get_node("/root/Game/Player/HUD")
	
	if player.drink < 75:
		player.healDrink(15)
		player.takeMoney(price)
		price += 1
		interact_label = "Press E to drink water\n(" + str(price) + "$)"
	else:
		HUD.DisplayText("You are not thirsty enough", 1, 2.0)

func reducePrice():
	var reduce = randi_range(1, price)
	price -= reduce
	interact_label = "Press E to drink water\n(" + str(price) + "$)"
	print(price)


func _on_main_door_reduce_sink_price() -> void:
	reducePrice()
