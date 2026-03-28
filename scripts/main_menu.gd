extends Control
@onready var asp: AudioStreamPlayer = $AudioStreamPlayer

func _on_button_settings_pressed() -> void:
	asp.play()
	await asp.finished
	get_tree().change_scene_to_file("res://scenes/options.tscn")

func _on_button_exit_pressed() -> void:
	asp.play()
	await asp.finished
	get_tree().quit()

func _on_button_play_pressed() -> void:
	asp.play()
	await asp.finished
	get_tree().change_scene_to_file("res://scenes/game.tscn")
