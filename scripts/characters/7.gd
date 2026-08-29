extends Node

# The name of the character
var character_name = "Francky"

# The dialogues of the character
# The last two ones should be the responses possible (agreement then refuse)
var dialogues = ["[pulse freq=5.0 color=#ffffff40 ease=-2.0]Hey !!!![/pulse]", "Can I tell YOUUU about my [wave amp=50.0 freq=5.0 connected=1]WHOLE NEW REALLLLLLLLYYYY COOOL PRODUCT ?[/wave]", "Yeah, sure...", "Hell nah"]

var draw_on_hud : Callable = drawOnHUD

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
		["dialog", ["[wave amp=50.0 freq=5.0 connected=1]OKAYYYYY[/wave] so this is going to [rainbow freq=1.0 sat=0.8 val=0.8 speed=1.0]BLOW YOUR ENTIRE MIND[/rainbow]", "In this world of [shake rate=35.0 level=6 connected=1]ARTIFICIAL INTELLIGENCE INNOVATIVE INNOVATIONS[/shake], I got the incredible idea to make a [fade start=5 length=15]VERY VERY VERY VERY VERY[/fade] [tornado radius=10.0 freq=1.0 connected=1]PERSONAL AGENT[/tornado]", "The idea is [rainbow freq=1.0 sat=0.8 val=0.8 speed=1.5]REVOLUTIONNARY[/rainbow]. It can create ALL for you and MAKE MONEY because [wave amp=50.0 freq=5.0 connected=1]EVERYONE LOVES AI[/wave] and it takes control of [wave amp=50.0 freq=5.0 connected=1]YOUR WHOLE COMPUTER[/wave]", "There is 100% no risk and it can EVEN [wave amp=50.0 freq=5.0 connected=1]CREATE DOGGGGS AND BANANAAAAA IMAGE LOOK AT THAT THAT'S SO CUTE[/wave]"]],
		["change_hungry", -15],
		["change_drink", -25],
		["change_health", -5],
		["dialog", ["[rainbow freq=1.0 sat=0.8 val=1.0 speed=2.0]I HOPE YOU LOOOOVE THIS AI REVOLUTION BYEEEE[/rainbow]"]],
		["function", draw_on_hud]
	],
	[
		["dialog", ["I tell you YOU'RE GOING TO BE LEFT BEHIND [shake rate=20.0 level=5 connected=1]YOU NERD[/shake]"]]
	]
]

# Define here the actions of the character
func drawOnHUD(player):
	var HUD = player.find_child("HUD")
	HUD.DisplayText("This was sooo tiring", 1, 4)
