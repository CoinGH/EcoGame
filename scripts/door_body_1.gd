extends StaticBody2D
var inside: bool = false
@onready var area_2d: Area2D = $Area2D
@export var scene: String = ""
@onready var res_screen: ColorRect = $"../HUD/ResScreen"
@onready var asp_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var e: Sprite2D = $KeyboardE

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Interact") and inside:
		var tween = get_tree().create_tween()
		asp_2d.play()
		tween.tween_property(res_screen, "modulate:a", 1.1, 0.75)
		await tween.finished
		Global.spawn_point = "FromStreetSpawnPoint"
		get_tree().change_scene_to_file(scene)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		inside = true
		e.visible = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		inside = false
		e.visible = false
