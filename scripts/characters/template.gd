extends Node

# The dialogues of the character
var dialogues = []


# What to do when finishing a dialogue. 
# Index 0 is for yes, index 1 for no
# Each index except to have an array with two values : the type of thing to call and what to do :
# dialog : dialogues (array)
# function : function name (string)
var next_action = []

# Define here the actions of the character
# func exampleAction():
#	pass
