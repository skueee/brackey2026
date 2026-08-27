extends Control

signal dialog_finished
signal question_finished(value: bool)

var dialog_active : bool = false
var current_text : Array
var next_text_index : int

var question_active : bool = false
var current_choice : bool = true
var question_active_color : Color = Color("000000")
var question_inactive_color : Color = Color("4f4f4f")

@onready var _speaker : Label = $Dialog/VBoxContainer/SpeakerBox/Label
@onready var _dialogue : RichTextLabel = $Dialog/VBoxContainer/TextBox/Text
@onready var _continue : Control = $Dialog/VBoxContainer/TextBox/Continue

@onready var _question : Label = $Choice/VBoxContainer/Question/QuestionLabel
@onready var _first_choice : Label = $Choice/VBoxContainer/Choice/HBoxContainer/FirstChoiceLabel
@onready var _second_choice : Label = $Choice/VBoxContainer/Choice/HBoxContainer/SecondChoiceLabel

func _ready() -> void:
	$HideScreen.hide()
	$Dialog.hide()
	$Choice.hide()

func displayLine(line : String):
	_dialogue.text = line
	
func displayText(lines : Array, speaker : String = "", hide_bg: bool = false):
	showTextBox(hide_bg, speaker)
	current_text = lines
	displayLine(current_text[0])
	next_text_index = 1
	
func showTextBox(hide_bg : bool, speaker : String = ""):
	dialog_active = true
	$Dialog.visible = true
	$HideScreen.visible = hide_bg
	_speaker.visible = (speaker != "")
	_speaker.text = speaker
	
func hideTextBox():
	dialog_active = false
	$Dialog.visible = false
	$HideScreen.visible = false
	dialog_finished.emit()

func goToNextText():
	if next_text_index < current_text.size():
		displayLine(current_text[next_text_index])
		next_text_index += 1
	else:
		hideTextBox()

func displayChoice(question: String, choicea: String, choiceb: String, hide_bg: bool = false):
	question_active = true
	current_choice = true
	$Choice.visible = true
	$HideScreen.visible = hide_bg
	_question.text = question
	_first_choice.text = choicea
	_first_choice.add_theme_color_override("font_color", question_active_color)
	_second_choice.text = choiceb
	_second_choice.add_theme_color_override("font_color", question_inactive_color)
	
func nextChoice():
	current_choice = !current_choice
	if current_choice == true:
		_first_choice.add_theme_color_override("font_color", question_active_color)
		_second_choice.add_theme_color_override("font_color", question_inactive_color)
	else:
		_second_choice.add_theme_color_override("font_color", question_active_color)
		_first_choice.add_theme_color_override("font_color", question_inactive_color)
		
func choiceInteract():
	question_active = false
	$Choice.visible = false
	$HideScreen.visible = false
	question_finished.emit(current_choice)

func _process(_delta: float) -> void:
	if dialog_active and Input.is_action_just_pressed("text_continue"):
		goToNextText()
	if question_active and Input.is_action_just_pressed("question_choose"):
		nextChoice()
	if question_active and Input.is_action_just_pressed("question_enter"):
		choiceInteract()
