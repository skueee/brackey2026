extends Node

# The name of the character
var character_name = "Marc"

# The dialogues of the character
# The last two ones should be the responses possible (agreement then refuse)
var dialogues = ["Heyyy, I'm a [rainbow freq=1.0 sat=0.6 val=0.8 speed=1.0]profesionnaly professional repairer[/rainbow]", "Can I [rainbow freq=1.0 sat=0.6 val=0.8 speed=1.0]professionaly[/rainbow] repair you [wave amp=40.0 freq=4.0 connected=1]luxuriant toilet[/wave] ?", "Sure, do your things !", "I'm not sure about that..."]

var stealCallable : Callable = steal

# What to do when finishing a dialogue. 
# Index 0 is for yes, index 1 for no
# Each index except to have an array with two values : the type of thing to call and what to do :
# dialog : dialogues (array)
# function : funtion (callable, needs to take player as an arguments)
# emit_signal : signal
# give_object : object id (int)
# give_money : money (int)
# take_money : money (int)
# change_health : damage (int)
# change_hungry : damage (int)
# change_drink : damage (int)
var next_action = [
	[
		["dialog", ["[tornado radius=10.0 freq=1.0 connected=1]Yipeeee[/tornado]"]],
		["function", stealCallable]
	],
	[
		["dialog", ["But, you don't want to get your things repaired ?"]]
	]
]

# Define here the actions of the character
func steal(player : Node):
	var HUD = player.find_child("HUD")
	
	player.dealDamage(10)
	if player.inventory.size() > 0:
		var to_steal = player.inventory.pick_random()
		player.removeFromInventory(to_steal)
	HUD.DisplayText("You just got stealth by a visitor...", 1, 5)
