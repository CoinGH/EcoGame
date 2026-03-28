extends Label
@onready var res_screen: ColorRect = $"../ResScreen"


func _ready() -> void:
	Global.money_changed.connect(_on_money_changed)

func _on_money_changed(value):
	text = str(value) + " $"
	if Global.money >= 500:
		fade_to_black()

func fade_to_black() -> void:
	Global.can_move = false
	var tween = get_tree().create_tween()
	tween.tween_property(res_screen, "modulate:a", 1.1, 2)
	await tween.finished
	get_tree().change_scene_to_file("res://scenes/GUI/win.tscn")
