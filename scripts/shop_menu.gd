extends CanvasLayer
@onready var asp: AudioStreamPlayer = $AudioStreamPlayer


func _on_button_pressed() -> void:
	if Global.money >= 36.92 and Global.check_space():
		Global.money -= 36.92
		Global.add_item("electronic")
		Global.money_changed.emit(Global.money)
	asp.play()
	await asp.finished


func _on_button_2_pressed() -> void:
	if Global.money >= 12.44 and Global.check_space():
		Global.money -= 12.44
		Global.add_item("salt")
		Global.money_changed.emit(Global.money)
	asp.play()
	await asp.finished


func _on_button_3_pressed() -> void:
	if Global.money >= 15.67 and Global.check_space():
		Global.money -= 15.67
		Global.add_item("vegetables")
		Global.money_changed.emit(Global.money)
	asp.play()
	await asp.finished


func _on_button_4_pressed() -> void:
	if Global.money >= 13.13 and Global.check_space():
		Global.money -= 13.13
		Global.add_item("sugar")
		Global.money_changed.emit(Global.money)
	asp.play()
	await asp.finished


func _on_button_5_pressed() -> void:
	if Global.money >= 16.25 and Global.check_space():
		Global.money -= 16.25
		Global.add_item("fruits")
		Global.money_changed.emit(Global.money)
	asp.play()
	await asp.finished
