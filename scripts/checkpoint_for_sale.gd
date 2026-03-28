extends Area2D
var inside: bool = false
var has_bought: bool = false
var prices = {
	"fruit_salad": 32.56, 
	"handcrafted_game_console": 70.85, 
	"soup": 29.99, 
	"handcrafted_accumulator": 79.98
	}
var names = {
	"fruit_salad": "Fruit Salad", 
	"handcrafted_game_console": "Handcrafted Game Console", 
	"soup": "Soup", 
	"handcrafted_accumulator": "Handcrafted Accumulator"
	}
var rand_item: String = ""
@onready var label: Label = $Label
@export var npc_id: String = "dealer_1"

func _ready() -> void:
	randomize()
	if Global.npc_memory.has(npc_id) and Global.npc_memory[npc_id]["bought"] == false:
		rand_item = Global.npc_memory[npc_id]["item"]
		has_bought = false
		update_text()
	else:
		generate_new_order()

func generate_new_order() -> void:
	rand_item = prices.keys().pick_random()
	has_bought = false
	update_text()
	save_to_global()

func update_text() -> void:
	if has_bought:
		label.text = "Thanks!"
	else:
		label.text = "I want to buy:\n" + names[rand_item] + "\nFor:\n$" + str(prices[rand_item])

func save_to_global() -> void:
	Global.npc_memory[npc_id] = {
		"item": rand_item,
		"bought": has_bought
	}

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		inside = true

func remove_item(item: String) -> void:
	for i in range (0, 15):
		if Global.inventory[i] == item:
			Global.inventory[i] = ""
			break
	Global.inventory_updated.emit()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Interact") and inside:
		if has_bought:
			return
		if Global.inventory.values().has(rand_item):
			remove_item(rand_item)
			Global.money += prices[rand_item]
			has_bought = true
			update_text()
			save_to_global()
			Global.money_changed.emit(Global.money)

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		inside = false
