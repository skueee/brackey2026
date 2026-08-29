extends Node

var price = randi_range(5, 20)

# The name of the character
var character_name = "Pizza deliverer"

# The dialogues of the character
# The last two ones should be the responses possible (agreement then refuse)
var dialogues = ["[wave amp=50.0 freq=5.0 connected=1]Hey ![/wave]", "I have a pizza delivery for you, that will be " + str(price) + "$ !", "Yup, that's mine !", "This is the wrong house"]


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
		["take_money", price],
		["give_object", 2],
		["dialog", ["Here you go, have a nice day !"]]
	],
	[
		["dialog", ["Oh, my bad, bye !"]]
	]
]

# Define here the actions of the character
# func exampleAction():
#	pass
