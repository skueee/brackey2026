extends Control

var active : bool = false
var current_text : Array
var next_text_index : int

@onready var _speaker : Label = $Dialog/VBoxContainer/SpeakerBox/Label
@onready var _dialogue : RichTextLabel = $Dialog/VBoxContainer/TextBox/Text
@onready var _continue : Control = $Dialog/VBoxContainer/TextBox/Continue

func _ready() -> void:
	$HideScreen.hide()
	$Dialog.hide()

func displayLine(line : String):
	_dialogue.text = line
	
func displayText(lines : Array, speaker : String = "", hide_bg: bool = false):
	showTextBox(hide_bg, speaker)
	current_text = lines
	displayLine(current_text[0])
	next_text_index = 1
	
func showTextBox(hide_bg : bool, speaker : String = ""):
	active = true
	$Dialog.visible = true
	$HideScreen.visible = hide_bg
	_speaker.visible = (speaker != "")
	_speaker.text = speaker
	
func hideTextBox():
	active = false
	$Dialog.visible = false
	$HideScreen.visible = false

func goToNextText():
	if next_text_index < current_text.size():
		displayLine(current_text[next_text_index])
		next_text_index += 1
	else:
		hideTextBox()

func _process(_delta: float) -> void:
	if active and Input.is_action_just_pressed("text_continue"):
		goToNextText()
