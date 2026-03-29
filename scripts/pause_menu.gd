extends CanvasLayer
@onready var asp: AudioStreamPlayer = $AudioStreamPlayer

func _ready() -> void:
	hide()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Pause"):
		toggle_pause()

func toggle_pause() -> void:
	get_tree().paused = !get_tree().paused
	visible = get_tree().paused

func _on_button_resume_pressed() -> void:
	asp.play()
	await asp.finished
	toggle_pause()

func _on_button_quit_pressed() -> void:
	asp.play()
	await asp.finished
	Global.health = 100
	Global.money = 0
	Global.can_move = true
	get_tree().paused = false
	Global.npc_memory.clear()
	for i in range(15):
		Global.inventory[i] = ""
	get_tree().change_scene_to_file("res://scenes/GUI/main_menu.tscn")

func _on_button_exit_pressed() -> void:
	asp.play()
	await asp.finished
	get_tree().quit()
