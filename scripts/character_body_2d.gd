extends CharacterBody2D

const SPEED = 300.0
const SPRINT_SPEED = 450.0
@onready var inventory: CanvasLayer = $"../Inventory"
var sprint: bool = false
var step_timer: float = 0.0
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var asp_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var asp_2d_2: AudioStreamPlayer2D = $AudioStreamPlayer2D2

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Inventory"):
		_inventory()
	if event.is_action_pressed("Sprint"):
		sprint = true
	if event.is_action_released("Sprint"):
		sprint = false

func _physics_process(_delta: float) -> void:
	if not Global.can_move:
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
	if velocity.length() > 0: 
		var time = Time.get_ticks_msec() / 1000.0
		anim.rotation = sin(time * 22.5) * 0.20 # 25.0 - швидкість хитання, 0.25 - сила нахилу

		if velocity.x < 0:
			anim.flip_h = true
		elif velocity.x > 0:
			anim.flip_h = false
		step_timer -= _delta
		if step_timer <= 0.0:
			if randi_range(0, 1):
				asp_2d.play()
			else:
				asp_2d_2.play()
			if sprint:
				step_timer = 0.25 
			else:
				step_timer = 0.4
	else:
		anim.rotation = 0
		step_timer = 0.0

func _inventory() -> void:
	inventory.visible = !inventory.visible
	if inventory.visible:
		Global.can_move = false
	else:
		Global.can_move = true
