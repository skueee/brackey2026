extends Node

# The name of the character
var character_name = "Timothy"

# The dialogues of the character
# The last two ones should be the responses possible (agreement then refuse)
var dialogues = ["Hey, uh, i'm working at a restaurant and I heard that you needed some help...", "Do you want me to give you our rests ?", "Yes, thanks !", "No"]


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
		["give_object", 20],
		["dialog", ["Here you go..."]]
	],
	[
		["dialog", ["Uhhh bye..."]]
	]
]

# Define here the actions of the character
# func exampleAction():
#	pass
