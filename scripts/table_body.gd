extends StaticBody2D
var inside: bool = false
@onready var area_2d: Area2D = $Area2D
@onready var keyboard_e: Sprite2D = $KeyboardE
@export var menu: CanvasLayer


func _ready() -> void:
	keyboard_e.hide()
	menu.hide()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Interact") and inside:
		Global.e_btn.emit()
		_craft()

func _craft() -> void:
	menu.visible = !menu.visible
	if menu.visible:
		Global.can_move = false
	else:
		Global.can_move = true

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		inside = true
		keyboard_e.visible = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		inside = false
		keyboard_e.visible = false
