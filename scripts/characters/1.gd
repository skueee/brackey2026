extends Node

# The name of the character
var character_name = "Granny"

# The dialogues of the character
# The last two ones should be the responses possible (agreement then refuse)
var dialogues = ["Hey little man", "I see you are hungry", "Do you want some cookies ?", "Oh... Um, yeah, cookies are bad for health...", "Maybe some vegetables then ?", "Of course !", "No, thanks."]
var objects = [1, 1, 5, 8]

# What to do when finishing a dialogue. 
# Index 0 is for yes, index 1 for no
# Each index except to have an array with arrays with two values : the type of thing to call and what to do :
# dialog : dialogues (array)
# function : function (callable, needs to take player as an arguments)
# emit_signal : signal
# give_object : object id (int)
# give_money : money (int)
# take_money : money (int)
# change_health : damage (int)
# change_hungry : damage (int)
# change_drink : damage (int)
# The arrays are executed in order
var next_action = [
	[
		["dialog", ["Okay, here you go !"]],
		["give_object", objects.pick_random()],
		["give_object", objects.pick_random()],
		["give_object", objects.pick_random()],
		["dialog", ["See ya !"]]
	],
	[
		["dialog", ["You aren't hungry ?", "Okay... Bye."]]
	]
]
