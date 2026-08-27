extends CharacterBody3D

var input_direction : Vector2
var speed : float = 5.0
var health : int = 100
var hunger : int = 100
var drink : int = 100
var money : int = 100
var inventory : Array

@export var look_sensitivity: float = 0.005
@export var acceleration: float = 60.0

@onready var head = $Head
@onready var camera = $Head/Camera3D

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
func _unhandled_input(event):
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		head.rotate_y(-event.relative.x * look_sensitivity)
		camera.rotate_x(-event.relative.y * look_sensitivity)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-80), deg_to_rad(80))
		
	if Input.is_action_just_pressed("escape"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		
	if event is InputEventMouseButton and event.pressed:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _physics_process(delta: float) -> void:
	# Gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Get direction
	input_direction = Input.get_vector("left", "right", "up", "down")
	var direction = (head.transform.basis * Vector3(input_direction.x, 0, input_direction.y)).normalized()
	
	# Calculate movement
	var target_velocity = direction * speed
	var horizontal_velocity = Vector3(velocity.x, 0, velocity.z)
	
	# Move
	horizontal_velocity = horizontal_velocity.move_toward(target_velocity, acceleration * delta)
	velocity.x = horizontal_velocity.x
	velocity.z = horizontal_velocity.z

	move_and_slide()

func _process(_delta):
	%HUD.HideText(0)
	if %InteractionCast.is_colliding():
		var target = %InteractionCast.get_collider()
		if target.has_method("interact"):
			if "interact_label" in target:
				%HUD.DisplayText(target.interact_label, 0)
			else:
				%HUD.DisplayText("Press E to interact", 0)
			if Input.is_action_just_pressed("interact"):
				target.interact()
	if health < 0:
		get_tree().change_scene_to_file("res://scenes/gameover.tscn")

func dealDamage(damage: int):
	health -= damage

func dealHunger(damage: int):
	hunger -= damage
	
func dealDrink(damage: int):
	drink -= damage
	
func takeMoney(damage: int):
	money -= damage

func addMoney(money_to_add: int):
	money += money_to_add

func healDamage(heal: int):
	health += heal

func healHunger(heal: int):
	hunger += heal
	
func healDrink(heal: int):
	drink += heal

func addToInventory(object: int):
	inventory.append(object)
	%HUD.updateInventory(inventory)
