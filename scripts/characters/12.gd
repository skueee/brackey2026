extends Node

# The name of the character
var character_name = "Teresa"

# The dialogues of the character
# The last two ones should be the responses possible (agreement then refuse)
var dialogues = ["Howdy !", "I'm a cooking student, would you pe up to take a look at one of my succulent meals ?", "Of course !", "No, thanks !"]


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
		["give_object", 19],
		["dialog", ["Hope you'll like it !"]]
	],
	[
		["dialog", ["Oh, okay."]]
	]
]

# Define here the actions of the character
# func exampleAction():
#	pass
