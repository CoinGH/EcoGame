extends Marker2D

@export var car_scene: PackedScene
@export var time: float
@onready var timer: Timer = $Timer
@export var megre: int

func _ready() -> void:
	var pre_car = car_scene.instantiate()
	
	pre_car.global_position = global_position
	
	pre_car.global_position.x += megre
	
	get_tree().current_scene.call_deferred("add_child", pre_car)
	
	timer.wait_time = time + randf_range(0.0, 1.5)
	timer.start()

func spawn_car() -> void:    
	var car_instance = car_scene.instantiate()
	car_instance.global_position = global_position
	get_tree().current_scene.add_child(car_instance)
	
	timer.wait_time = time + randf_range(-0.5, 0.5)

func _on_timer_timeout() -> void:
	spawn_car()
