extends Control

@onready var container = $"Panel/ScrollContainer/ButtonsContainer"

func open(freq: Dictionary, names: Dictionary, callback: Callable):
	for child in container.get_children():
		child.queue_free()
	
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	for i in names:
		var btn := Button.new()
		btn.text = str(names[i]) + " (x" + str(freq[i]) + ")"
		
		btn.pressed.connect(func():
			callback.call(i)
			hide()
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		)
		
		container.add_child(btn)
		
	var close_btn := Button.new()
	close_btn.text = "close"
	
	close_btn.pressed.connect(func():
		callback.call(0)
		hide()
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	)
	
	container.add_child(close_btn)
	
	show()
