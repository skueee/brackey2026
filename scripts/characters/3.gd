extends Node

# The name of the character
var character_name = "Corentin"

# The dialogues of the character
# The last two ones should be the responses possible (agreement then refuse)
var dialogues = ["Hey man, could I use your toilets ?", "Yeah, sure !", "No ?"]

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
	["dialog", ["Thank you sooo much !", "Here's some money to thank you"]],
	["give_money", 15],
	["emit_signal", "lockToilets"]
],[
	["dialog", "Oh... Okay, bye..."]
]]

# Define here the actions of the character
