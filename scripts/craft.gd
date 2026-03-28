extends CanvasLayer
@onready var asp: AudioStreamPlayer = $AudioStreamPlayer

func get_inventory_counts() -> Dictionary:
	var counts = {}
	for i in range(15):
		var item = Global.inventory[i]
		if typeof(item) == TYPE_STRING and item != "":
			if counts.has(item):
				counts[item] += 1
			else:
				counts[item] = 1
	return counts

func can_craft(recipe: Dictionary) -> bool:
	var my_items = get_inventory_counts()
	for item in recipe:
		if not my_items.has(item) or my_items[item] < recipe[item]:
			return false
	return true

func remove_item(item: String) -> void:
	for i in range (0, 15):
		if Global.inventory[i] == item:
			Global.inventory[i] = ""
			break
	Global.inventory_updated.emit()

func _on_button_pressed() -> void:
	var recipe = {"electronic": 1, "plastic": 2}
	if can_craft(recipe):
		remove_item("electronic")
		remove_item("plastic")
		remove_item("plastic")
		Global.add_item("handcrafted_game_console")
		asp.play()
		await asp.finished


func _on_button_2_pressed() -> void:
	var recipe = {"fruits": 2, "sugar": 1}
	if can_craft(recipe):
		remove_item("fruits")
		remove_item("fruits")
		remove_item("sugar")
		Global.add_item("fruit_salad")
		asp.play()
		await asp.finished


func _on_button_3_pressed() -> void:
	var recipe = {"vegetables": 1, "salt": 1}
	if can_craft(recipe):
		remove_item("vegetables")
		remove_item("salt")
		Global.add_item("soup")
		asp.play()
		await asp.finished


func _on_button_4_pressed() -> void:
	var recipe = {"metal": 1, "electronic": 1}
	if can_craft(recipe):
		remove_item("metal")
		remove_item("electronic")
		Global.add_item("handcrafted_accumulator")
		asp.play()
		await asp.finished


func _on_button_5_pressed() -> void:
	asp.play()
	await asp.finished
