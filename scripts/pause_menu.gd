extends CanvasLayer

func _ready() -> void:
	hide()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Pause"):
		toggle_pause()

func toggle_pause() -> void:
	get_tree().paused = !get_tree().paused
	visible = get_tree().paused

func _on_button_resume_pressed() -> void:
	toggle_pause()

func _on_button_quit_pressed() -> void:
	get_tree().paused = false 
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_button_exit_pressed() -> void:
	get_tree().quit()
