extends Node

# The name of the character
var character_name = "Evan"

# The dialogues of the character
# The last two ones should be the responses possible (agreement then refuse)
var dialogues = ["Hiii !", "So, um, for a scientific experiment, I'm trying to get people to eat these [rainbow freq=1.0 sat=0.8 val=0.8 speed=1.0]not-suspicious meals[/rainbow].", "Would you want to try it out", "Sure !", "Uh... NO ?"]
var objects = [14, 16, 17]

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
		["dialog", ["Okay... Let me give you that"]],
		["give_object", objects.pick_random()],
		["dialog", ["Here you go, hope you don't die !", "Byyeee !"]]
	],
	[
		["dialog", ["I... understand ! Have a good day."]]
	]
]

# Define here the actions of the character
# func exampleAction():
#	pass
