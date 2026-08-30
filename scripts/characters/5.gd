extends Node

# The name of the character
var character_name = "Olicia"

# The dialogues of the character
# The last two ones should be the responses possible (agreement then refuse)
var dialogues = ["Hey, hum, I'm looking for some money, but idk what I can do in exchange...", "Hum, wait... eh, isn't you water a bit [wave amp=50.0 freq=2.5 connected=1]expensive[/wave] ?", "As a plumber, I could maybe [wave amp=50.0 freq=2.5 connected=1]help with that[/wave] !", "Yeah, sure", "No, thanks"]

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
		["dialog", ["Okay, let me try that..."]],
		["emit_signal", "reduceSinkPrice"],
		["take_money", 15],
		["dialog", ["Here you go !", "Have a great day"]]
	],
	[
		["Dialog", ["Okay, bye..."]]
	]
]

# Define here the actions of the character
