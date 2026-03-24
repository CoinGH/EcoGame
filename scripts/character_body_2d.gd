extends CharacterBody2D


const SPEED = 300.0
@onready var inventory: CanvasLayer = $"../Inventory"
var can_move: bool = true

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Inventory"):
		_inventory()

func _physics_process(_delta: float) -> void:
	if not can_move:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
		move_and_slide()
		return

	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

	if direction:
		velocity = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	move_and_slide()

func _inventory() -> void:
	inventory.visible = !inventory.visible
	if inventory.visible:
		can_move = false
	else:
		can_move = true
