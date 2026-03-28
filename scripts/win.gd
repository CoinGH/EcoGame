extends Control
@onready var asp: AudioStreamPlayer = $AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_back_pressed() -> void:
	asp.play()
	await asp.finished
	Global.health = 100
	Global.money = 0.0
	Global.can_move = true
	Global.is_instructed = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
