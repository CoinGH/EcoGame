extends CanvasLayer
@onready var asp: AudioStreamPlayer = $AudioStreamPlayer
@onready var color_rect: ColorRect = $ColorRect
@onready var label: Label = $ColorRect/Label


func _on_button_pressed() -> void:
	if Global.money >= 36.92 and Global.check_space():
		Global.money -= 36.92
		Global.add_item("electronic")
		Global.money_changed.emit(Global.money)
		label.text = "Succefully purchased!"
	else:
		label.text = "You don't have enough money or space!"
	label_a()
	asp.play()
	await asp.finished

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

func _on_button_2_pressed() -> void:
	if Global.money >= 12.44 and Global.check_space():
		Global.money -= 12.44
		Global.add_item("salt")
		Global.money_changed.emit(Global.money)
		label.text = "Succefully purchased!"
	else:
		label.text = "You don't have enough money or space!"
	label_a()
	asp.play()
	await asp.finished


func _on_button_3_pressed() -> void:
	if Global.money >= 15.67 and Global.check_space():
		Global.money -= 15.67
		Global.add_item("vegetables")
		Global.money_changed.emit(Global.money)
		label.text = "Succefully purchased!"
	else:
		label.text = "You don't have enough money or space!"
	label_a()
	asp.play()
	await asp.finished


func _on_button_4_pressed() -> void:
	if Global.money >= 13.13 and Global.check_space():
		Global.money -= 13.13
		Global.add_item("sugar")
		Global.money_changed.emit(Global.money)
		label.text = "Succefully purchased!"
	else:
		label.text = "You don't have enough money or space!"
	label_a()
	asp.play()
	await asp.finished


func _on_button_5_pressed() -> void:
	if Global.money >= 16.25 and Global.check_space():
		Global.money -= 16.25
		Global.add_item("fruits")
		Global.money_changed.emit(Global.money)
		label.text = "Succefully purchased!"
	else:
		label.text = "You don't have enough money or space!"
	label_a()
	asp.play()
	await asp.finished
