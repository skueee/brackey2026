extends Control

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
