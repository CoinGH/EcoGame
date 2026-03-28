extends AnimatableBody2D
@export var direction: Vector2 = Vector2.UP

func _physics_process(delta: float) -> void:
	position += direction * Global.car_speed * delta

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		Global.health = clamp(Global.health - 25, 0, 100)
		Global.health_changed.emit(Global.health)

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
