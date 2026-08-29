extends Node

# The name of the character
var character_name = "Elly"

# The dialogues of the character
# The last two ones should be the responses possible (agreement then refuse)
var dialogues = ["Hey !", "It's really hot, you should drink !", "With some friends, we are distributing water. Want to take some ?", "Yeah, thanks !", "Nah"]


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
		["dialog", ["Here you go !"]],
		["change_drink", 15]
	],
	[
		["dialog", ["Okay... But dont forget to hydrate yourself, it's really important to live !"]]
	]
]

# Define here the actions of the character
# func exampleAction():
#	pass
