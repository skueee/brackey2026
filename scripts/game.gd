extends Node3D

@export var money: int
@export var gametime: int = 1008

func init_game(time):
	var unit_duration: float = snapped((10.0 * 60.0)/10080 * time, 0.01)
	$"GameTimer".wait_time = unit_duration
	$"GameTimer".start(unit_duration)

func _on_game_timer_timeout() -> void:
	gametime -= 1
	$"GameTimer".start()

func _ready():
	init_game(30)
