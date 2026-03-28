extends ProgressBar
@onready var res_screen: ColorRect = $"../ResScreen"


func _ready() -> void:
	Global.health_changed.connect(_on_health_changed)

func _on_health_changed(value1):
	value = value1
	if Global.health <= 0:
		fade_to_black()

func fade_to_black() -> void:
	Global.can_move = false
	var tween = get_tree().create_tween()
	tween.tween_property(res_screen, "modulate:a", 1.1, 2)
	await tween.finished
	get_tree().change_scene_to_file("res://scenes/GUI/GameOver.tscn")
