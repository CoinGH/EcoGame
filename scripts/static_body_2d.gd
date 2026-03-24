extends StaticBody2D
@onready var area0: Area2D = $Area2D
var inside: bool = false
@onready var keyboard_e: Sprite2D = $"../KeyboardE"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Interact") and inside:
		print("gay")
		Global.money += 10
		Global.money_changed.emit(Global.money)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		inside = true
		keyboard_e.visible = true
		print("yes")
		Global.health = clamp(Global.health - 1, 0, 100)
		Global.health_changed.emit(Global.health)

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		inside = false
		keyboard_e.visible = false
		print("no")
