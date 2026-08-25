extends Node3D

var open = true

func interact():
	%ToiletAnimation.play("Close" if open else "Open")

	open = !open
