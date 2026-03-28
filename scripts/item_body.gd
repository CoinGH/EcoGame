extends StaticBody2D
@onready var area_2d: Area2D = $Area2D
var inside: bool = false
@onready var keyboard_e_2: Sprite2D = $KeyboardE2
@export var item_name: String = "plastic" 

func _ready() -> void:
	keyboard_e_2.hide()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Interact") and inside:
		var was_added = Global.add_item(item_name)
		if was_added:
			queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		inside = true
		keyboard_e_2.show()

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		inside = false
		keyboard_e_2.hide()
