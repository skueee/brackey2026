extends Node

# The name of the character
var character_name = ""

# The dialogues of the character
# The last two ones should be the responses possible (agreement then refuse)
var dialogues = []


# What to do when finishing a dialogue. 
# Index 0 is for yes, index 1 for no
# Each index except to have an array with two values : the type of thing to call and what to do :
# dialog : dialogues (array)
# function : function name (string)
# give_object : object id (int)
# change_health : damage (int)
# change_hungry : damage (int)
# change_drink : damage (int)
var next_action = []

# Define here the actions of the character
# func exampleAction():
#	pass
