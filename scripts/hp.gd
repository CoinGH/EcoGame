extends ProgressBar
@onready var res_screen: ColorRect = $"../ResScreen"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.health_changed.connect(_on_health_changed)

func _on_health_changed(value1):
	value = value1
	if Global.health <= 0:
		fade_to_black()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func fade_to_black() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(res_screen, "modulate:a", 1.1, 2)
	await tween.finished
	get_tree().change_scene_to_file("res://scenes/GameOver.tscn")
