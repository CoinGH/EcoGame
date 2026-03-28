extends Control
@onready var asp: AudioStreamPlayer = $AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

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
