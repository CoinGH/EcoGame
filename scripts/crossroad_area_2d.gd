extends Area2D
@export var spawners: Array[Marker2D]

func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		for marker in spawners:
			marker.get_node("Timer").stop()
		Global.car_speed = 0

func _on_body_exited(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		for marker in spawners:
			marker.get_node("Timer").start()
		Global.car_speed = 300.0
