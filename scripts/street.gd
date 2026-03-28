extends Node2D

@onready var inventory: CanvasLayer = $Inventory
@onready var player = $CharacterBody2D
@onready var asp_2d: AudioStreamPlayer2D = $DoorBody/AudioStreamPlayer2D
@onready var asp_2d_2: AudioStreamPlayer2D = $DoorBody/AudioStreamPlayer2D2
@onready var camera_2d: Camera2D = $CharacterBody2D/Camera2D
@export var items_to_spawn: Array[PackedScene]
@onready var trash_spawners: Node = $TrashSpawners

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

	var all_points = trash_spawners.get_children()
	randomize()
	var num_items_to_create = randi_range(5, 24)
	all_points.shuffle()
	
	for i in range(num_items_to_create):
		var point = all_points[i]
		var random_item_scene = items_to_spawn.pick_random()
		var item_instance = random_item_scene.instantiate()
		item_instance.global_position = point.global_position
		add_child(item_instance)
