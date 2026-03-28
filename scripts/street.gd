extends Node2D

@onready var inventory: CanvasLayer = $Inventory
@onready var player = $CharacterBody2D
@onready var asp_2d: AudioStreamPlayer2D = $DoorBody/AudioStreamPlayer2D
@onready var asp_2d_2: AudioStreamPlayer2D = $DoorBody/AudioStreamPlayer2D2
@onready var camera_2d: Camera2D = $CharacterBody2D/Camera2D


func _ready() -> void:
	inventory.hide()
	Global.money_changed.emit(Global.money)
	Global.inventory_updated.emit()
	Global.health_changed.emit(Global.health)
	if Global.spawn_point != "":
		var target_marker = get_node(Global.spawn_point)
		asp_2d_2.play()
		if target_marker != null:
			player.global_position = target_marker.global_position
			camera_2d.reset_smoothing()
			camera_2d.force_update_scroll()
		Global.spawn_point = ""
