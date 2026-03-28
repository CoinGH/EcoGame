extends CanvasLayer
@onready var asp: AudioStreamPlayer = $AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func remove_item(item: String) -> void:
	for i in range (0, 15):
		if Global.inventory[i] == item:
			Global.inventory[i] = ""
			break
	Global.inventory_updated.emit()

func _on_button_pressed() -> void:
	remove_item("electronic")
	remove_item("plastic")
	Global.add_item("handcrafted_game_console")
	asp.play()
	await asp.finished


func _on_button_2_pressed() -> void:
	asp.play()
	await asp.finished


func _on_button_3_pressed() -> void:
	asp.play()
	await asp.finished


func _on_button_4_pressed() -> void:
	asp.play()
	await asp.finished


func _on_button_5_pressed() -> void:
	asp.play()
	await asp.finished
