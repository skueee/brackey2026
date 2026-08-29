extends Node

# The name of the character
var character_name = "Emelia"

# The dialogues of the character
# The last two ones should be the responses possible (agreement then refuse)
var dialogues = ["Hey, um, I know wo dont know each other, but do you want some money ?", "Hell yeah !", "No, thanks"]


# What to do when finishing a dialogue. 
# Index 0 is for yes, index 1 for no
# Each index except to have an array with two values : the type of thing to call and what to do :
# dialog : dialogues (array)
# function : funtion (callable)
# emit_signal : signal
# give_object : object id (int)
# give_money : money (int)
# take_money : money (int)
# change_health : damage (int)
# change_hungry : damage (int)
# change_drink : damage (int)
var next_action = [
	[
		["give_money", 25],
		["dialogue", ["Without that, life would be a bit too diffcult"]]
	],
	[
		["dialogue", ["Oh, uh, okay ?"]]
	]
]

# Define here the actions of the character
# func exampleAction():
#	pass
