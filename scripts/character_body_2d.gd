extends CharacterBody2D

const SPEED = 300.0
const SPRINT_SPEED = 450.0
@onready var inventory: CanvasLayer = $"../Inventory"
var can_move: bool = true
var sprint: bool = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Inventory"):
		_inventory()
	if event.is_action_pressed("Sprint"):
		sprint = true
	if event.is_action_released("Sprint"):
		sprint = false

func _physics_process(_delta: float) -> void:
	if not can_move:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
		move_and_slide()
		return
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

	if direction and not sprint:
		velocity = direction * SPEED
	elif direction and sprint:
		velocity = direction * SPRINT_SPEED
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
