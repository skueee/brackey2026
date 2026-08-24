extends Node3D

@export var open_angle: float = 90.0

var open = false
var tween: Tween

func interact():
	
	var target_y = deg_to_rad(open_angle) if open else 0.0
	
	if tween and tween.is_running():
		tween.kill()
	
	tween = create_tween()
	
	tween.set_ease(Tween.EASE_IN)
	tween.set_trans(Tween.TRANS_QUAD)
	
	tween.tween_property(self, "rotation:y", target_y, 0.8)

	open = !open
