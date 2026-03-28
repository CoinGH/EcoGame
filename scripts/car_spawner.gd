extends Marker2D

@export var car_scene: PackedScene
@export var time: float
@onready var timer: Timer = $Timer
@export var megre: int

func _ready() -> void:
	var pre_car = car_scene.instantiate()
	
	# 1. Спочатку жорстко ставимо машину на хрестик маркера
	pre_car.global_position = global_position
	
	# 2. А ВЖЕ ПОТІМ додаємо твій зсув (megre) вперед по дорозі
	pre_car.global_position.x += megre
	
	# 3. Безпечно додаємо її в головну сцену
	get_tree().current_scene.call_deferred("add_child", pre_car)
	
	# 4. РУЙНУЄМО "СТІНУ": додаємо випадковий час (від 0 до 1.5 сек) до таймера
	timer.wait_time = time + randf_range(0.0, 1.5)
	timer.start()

func spawn_car() -> void:    
	var car_instance = car_scene.instantiate()
	car_instance.global_position = global_position
	get_tree().current_scene.add_child(car_instance)
	
	# Щоб дистанція між машинами теж трохи відрізнялася:
	timer.wait_time = time + randf_range(-0.5, 0.5)

func _on_timer_timeout() -> void:
	spawn_car()
