extends Node3D

@export var money: int
@export var gametime: int = 1008

var playerHungerTimeout: int = 35
var nextHunger: int = gametime - playerHungerTimeout

var playerThirstTimeout: int = 25
var nextThirst: int = gametime - playerThirstTimeout

var nextDamage: int = gametime - 1

func init_game(time):
	var unit_duration: float = snapped((10.0 * 60.0)/10080 * time, 0.01)
	$"GameTimer".wait_time = unit_duration
	$"GameTimer".start(unit_duration)
	$Dialog.displayText(["[wave amp=75.0 freq=7.0 connected=1]Heyyyy ![/wave]", "Welcome to this [wave amp=25.0 freq=3.0 connected=1]absoluuutely[/wave] beautiful [rainbow freq=1.0 sat=0.8 val=0.8 speed=1.0]house[/rainbow] :)", "You will need to [shake rate=50.0 level=5 connected=1]survive[/shake] for [wave amp=25.0 freq=2.0 connected=1]7 days[/wave].", "Strangers will knock at your door.", "[rainbow freq=0.7 sat=0.5 val=0.8 speed=0.5]Just make them enter[/rainbow], but be aware that some may be better [shake rate=10.0 level=4 connected=1]outside of your house...[/shake]", "[tornado radius=10.0 freq=1.0 connected=1]Of course[/tornado], you are totally free to do [rainbow freq=1.5 sat=1.0 val=1.0 speed=1.0]whatever you want.[/rainbow]\nIf you want to get your ass kicked by a stranger, I won't judge...\nWell [fade start=1 length=10]maybeee[/fade] a little.", "Anyway, [rainbow freq=1.0 sat=0.8 val=0.8 speed=1.0]good luck ![/rainbow]"], "Narrator")

func _on_game_timer_timeout() -> void:
	gametime -= 1
	$"GameTimer".start()

func _ready():
	init_game(15)

func _process(_delta):
	if gametime == nextThirst:
		dealThirstToPlayer()
	elif gametime == nextHunger:
		dealHungerToPlayer()
	if gametime == nextDamage and $"Player".hunger <= 0 or gametime == nextDamage and $"Player".drink <= 0:
		dealDamageWhenNeeded()
		nextDamage -= 1

func dealHungerToPlayer():
	$"Player".dealHunger(randi_range(5, 20))
	if playerHungerTimeout < 15:
		playerHungerTimeout -= 2
	nextHunger -= playerHungerTimeout

func dealThirstToPlayer():
	$"Player".dealDrink(randi_range(10, 25))
	if playerThirstTimeout < 10:
		playerThirstTimeout -= 3
	nextThirst -= playerThirstTimeout
	
func dealDamageWhenNeeded():
	var damage : int = 0
	if $"Player".drink <= 0:
		damage += 10
	if $"Player".hunger <= 0:
		damage += 10
	$"Player".dealDamage(damage)
	
