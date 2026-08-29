extends Node

# The name of the character
var character_name = "Tristan"

# The dialogues of the character
# The last two ones should be the responses possible (agreement then refuse)
var dialogues = ["Heyyy !", "Man, can I tell you about what I was doing ?", "Yeah, sure !", "Huh... No ? Thanks you."]


# What to do when finishing a dialogue. 
# Index 0 is for yes, index 1 for no
# Each index except to have an array with two values : the type of thing to call and what to do :
# dialog : dialogues (array)
# function : function (callable, needs to take player as an arguments)
# emit_signal : signal
# give_object : object id (int)
# give_money : money (int)
# take_money : money (int)
# change_health : damage (int)
# change_hungry : damage (int)
# change_drink : damage (int)
var next_action = [[
	["dialog", ["So uh basically I was at the restaurant and it was [wave amp=50.0 freq=3.5 connected=1]soooo good[/wave] like you can't imagine","I took some [wave amp=50.0 freq=3.5 connected=1]reaaly[/wave] good drink"]],
	["change_drink", randi_range(-20, -10)],
	["dialog", ["With some [wave amp=50.0 freq=3.5 connected=1]excellent[/wave] burger and french fries. It was [rainbow freq=0.8 sat=0.5 val=0.8 speed=0.8]sooooo delicious[/rainbow]"]],
	["change_hungry", randi_range(-25, -10)]
	],[
	["dialog", ["Oooooh, you're so not fun..."]]
	]]

# Define here the actions of the character
# func exampleAction():
#	pass
