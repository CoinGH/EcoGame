extends Control
@onready var asp: AudioStreamPlayer = $AudioStreamPlayer


func _on_button_back_pressed() -> void:
	asp.play()
	await asp.finished
	Global.health = 100
	Global.money = 0.0
	Global.can_move = true
	Global.is_instructed = false
	Global.npc_memory.clear()
	for i in range(15):
		Global.inventory[i] = ""
	get_tree().change_scene_to_file("res://scenes/GUI/main_menu.tscn")
