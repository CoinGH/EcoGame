extends Node2D

@onready var inventory: CanvasLayer = $Inventory
@onready var player = $CharacterBody2D
@onready var asp_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var instruction: CanvasLayer = $Instruction

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	inventory.hide()
	if Global.is_instructed == false:
		Global.is_instructed = true
		instruction.appear()
	else:
		instruction.hide()
	Global.money_changed.emit(Global.money)
	Global.inventory_updated.emit()
	Global.health_changed.emit(Global.health)
	if Global.spawn_point != "":
		var target_marker = get_node(Global.spawn_point)
		asp_2d.play()
		if target_marker != null:
			player.global_position = target_marker.global_position
		Global.spawn_point = ""

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _input(event: InputEvent) -> void:
	pass
