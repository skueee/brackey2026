extends CanvasLayer

@onready var textDisplay = $"TextDisplay/Text"

var textDisplayPriority = 0

func _ready() -> void:
	# Hide the text displayer
	textDisplay.hide()



# On-screen text management

# A function to display text on screen
func DisplayText(text: String, priority: int, time: float = 0):
	if priority >= textDisplayPriority:
		textDisplayPriority = priority
		textDisplay.text = text
		if time > 0:
			$"TextDisplay/Text/Visibility".start(time)
		textDisplay.show()

# A function to hide a text on screen
func HideText(priority: int):
	if priority >= textDisplayPriority:
		textDisplay.hide()
		$"TextDisplay/Text/Visibility".stop()
		textDisplayPriority = 0

func _on_visibility_timeout() -> void:
	HideText(textDisplayPriority)



# Health bars management

func updateHealthBar(to_health):
	var tween = %HealthBar.create_tween()
	tween.tween_property(%HealthBar, "value", to_health, 0.2)
	
func updateHungerBar(to_hunger):
	var tween = %HungerBar.create_tween()
	tween.tween_property(%HungerBar, "value", to_hunger, 0.2)
	
func updateDrinkBar(to_drink):
	var tween = %DrinkBar.create_tween()
	tween.tween_property(%DrinkBar, "value", to_drink, 0.2)
	
func updateMoneyLabel(to, from):
	var tween = %MoneyLabel.create_tween()
	tween.tween_method(updateMoneyLabelSet, from, to, 1.0)
	
func updateMoneyLabelSet(value):
	%MoneyLabel.text = 	"%d$" % value

func _process(_delta: float) -> void:
	
	var current_health = get_node("/root/Game/Player").health
	var current_hunger = get_node("/root/Game/Player").hunger
	var current_drink = get_node("/root/Game/Player").drink
	var current_money = get_node("/root/Game/Player").money
	
	if current_health != %HealthBar.value:
		updateHealthBar(current_health)
		
	if current_hunger != %HungerBar.value:
		updateHungerBar(current_hunger)
		
	if current_drink != %DrinkBar.value:
		updateDrinkBar(current_drink)

	if current_money != int(%MoneyLabel.text.trim_suffix("$")):
		updateMoneyLabel(current_money, get_node("/root/Game/Player").money)
