extends Label
@onready var res_screen: ColorRect = $"../ResScreen"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.money_changed.connect(_on_money_changed)

func _on_money_changed(value):
	text = str(value) + " $"
	if Global.money >= 1000:
		fade_to_black()

func fade_to_black() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(res_screen, "modulate:a", 1.1, 2)
	await tween.finished
	get_tree().change_scene_to_file("res://scenes/win.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
