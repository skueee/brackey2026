extends StaticBody3D

@export var open_angle: float = 90.0

var open = false
var locked = false
var tween: Tween

func interact():
	if !locked:
		
		var target_y = deg_to_rad(open_angle) if open else 0.0
		
		if tween and tween.is_running():
			tween.kill()
		
		tween = create_tween()
		
		tween.set_ease(Tween.EASE_IN)
		tween.set_trans(Tween.TRANS_QUAD)
		
		tween.tween_property(self, "rotation:y", target_y, 0.8)

		open = !open
	else:
		get_node("/root/Game/Player/HUD").DisplayText("Toilets are locked", 1, 1)
		await get_tree().create_timer(0.5).timeout
		get_node("/root/Game/Dialog").displayText(["Eh, I'm in there !"], "Corentin")

func _on_main_door_lock_toilets() -> void:
	if !locked:
		if open:
			interact()
		locked = true
	else:
		get_node("/root/Game/Dialog").displayText(["But... There is already someone there ?"], "Corentin", true)
