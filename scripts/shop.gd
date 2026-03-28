extends Node2D

@onready var inventory: CanvasLayer = $Inventory
@onready var player = $CharacterBody2D
@onready var asp_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	inventory.hide()
	Global.money_changed.emit(Global.money)
	Global.inventory_updated.emit()
	Global.health_changed.emit(Global.health)
	if Global.spawn_point != "":
		var target_marker = get_node(Global.spawn_point)
		asp_2d.play()
		if target_marker != null:
			player.global_position = target_marker.global_position
		Global.spawn_point = ""
