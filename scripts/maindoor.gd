extends StaticBody3D

signal lockToilets
signal reduceSinkPrice

var someone_is_there : bool = false
var current_person_id : int

# Group 2 as way fewer chances to get selected
var group1 : Array = [1, 2, 3, 4, 5, 6, 7]
var group2 : Array

func selectRandomPerson():
	var to_random : Array
	to_random.append_array(group1)
	to_random.append_array(group1)
	to_random.append_array(group1)
	to_random.append_array(group2)
	return to_random.pick_random()
	
func enablePerson():
	current_person_id = selectRandomPerson()
	someone_is_there = true
	if group1.has(current_person_id):
		group1.erase(current_person_id)
		group2.append(current_person_id)
		
func disablePerson():
	current_person_id = 0
	someone_is_there = false

func interact():
	if someone_is_there:
		executeCharacter(current_person_id)
	else:
		get_node("/root/Game/Player/HUD").DisplayText("No one is there", 1, 0.8)

func executeCharacter(id):
	var Character = load("res://scripts/characters/" + str(id) + ".gd")
	var character = Character.new()
	var dialog = get_node("/root/Game/Dialog")
	
	dialog.displayText(character.dialogues.slice(0, (character.dialogues.size() - 2)), character.character_name, true)
	await dialog.dialog_finished
	dialog.displayChoice("Accept ?", character.dialogues[-2], character.dialogues[-1], true)
	var choice: bool = await dialog.question_finished
	if choice == true:
		executeActions(character.next_action[0], character)
	else:
		executeActions(character.next_action[1], character)

func executeActions(actions: Array, character):
	var dialog = get_node("/root/Game/Dialog")
	var player = get_node("/root/Game/Player")
	
	for i in actions:
		if i[0] == "dialog":
			dialog.displayText(i[1], character.character_name, true)
			await dialog.dialog_finished
		elif i[0] == "function":
			i[1].call(player)
		elif i[0] == "give_object":
			player.addToInventory(i[1])
		elif i[0] == "change_health":
			if i[1] > 0:
				player.healDamage(i[1])
			else:
				player.dealDamage(-i[1])
		elif i[0] == "change_hungry":
			if i[1] > 0:
				player.healHunger(i[1])
			else:
				player.dealHunger(-i[1])
		elif i[0] == "change_drink":
			if i[1] > 0:
				player.healDrink(i[1])
			else:
				player.dealDrink(-i[1])
		elif i[0] == "give_money":
			player.addMoney(i[1])
		elif i[0] == "take_money":
			player.takeMoney(i[1])
		elif i[0] == "emit_signal":
			emit_signal(i[1])
	
func _ready() -> void:
	enablePerson()
	
