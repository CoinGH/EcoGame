extends CanvasLayer
@onready var asp: AudioStreamPlayer = $AudioStreamPlayer
@onready var color_rect: ColorRect = $ColorRect
@onready var label: Label = $ColorRect/Label

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

func label_a() -> void:
	label.modulate.a = 0.0
	color_rect.modulate.a = 0.0
	color_rect.visible = true
	var tween = create_tween()
	tween.tween_interval(0.15)
	tween.tween_property(label, "modulate:a", 1.0, 2.0)
	tween.parallel().tween_property(color_rect, "modulate:a", 1.0, 2.0)
	tween.tween_interval(0.5)
	tween.tween_property(label, "modulate:a", 0.0, 2.0)
	tween.parallel().tween_property(color_rect, "modulate:a", 0.0, 2.0)
	await tween.finished
	color_rect.visible = false

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
		label.text = "Succefully purchased!"
	else:
		label.text = "You don't have enough resources!"
	label_a()
	asp.play()
	await asp.finished


func _on_button_2_pressed() -> void:
	var recipe = {"fruits": 2, "sugar": 1}
	if can_craft(recipe):
		remove_item("fruits")
		remove_item("fruits")
		remove_item("sugar")
		Global.add_item("fruit_salad")
		label.text = "Succefully purchased!"
	else:
		label.text = "You don't have enough resources!"
	label_a()
	asp.play()
	await asp.finished


func _on_button_3_pressed() -> void:
	var recipe = {"vegetables": 1, "salt": 1}
	if can_craft(recipe):
		remove_item("vegetables")
		remove_item("salt")
		Global.add_item("soup")
		label.text = "Succefully purchased!"
	else:
		label.text = "You don't have enough resources!"
	label_a()
	asp.play()
	await asp.finished


func _on_button_4_pressed() -> void:
	var recipe = {"metal": 1, "electronic": 1}
	if can_craft(recipe):
		remove_item("metal")
		remove_item("electronic")
		Global.add_item("handcrafted_accumulator")
		label.text = "Succefully purchased!"
	else:
		label.text = "You don't have enough resources!"
	label_a()
	asp.play()
	await asp.finished


func _on_button_5_pressed() -> void:
	label.text = "! Secret !"
	label_a()
	asp.play()
	await asp.finished
