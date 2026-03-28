extends Control
@onready var asp: AudioStreamPlayer = $AudioStreamPlayer

func _on_button_to_main_menu_pressed() -> void:
	asp.play()
	await asp.finished
	Global.health = 100
	Global.money = 0.0
	Global.can_move = true
	Global.is_instructed = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_button_restart_pressed() -> void:
	asp.play()
	await asp.finished
	Global.health = 100
	Global.money = 0.0
	Global.can_move = true
	Global.is_instructed = false
	get_tree().change_scene_to_file("res://scenes/game.tscn")
