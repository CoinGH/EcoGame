extends Marker2D

# Сюди ми в інспекторі закинемо твою машину
@export var car_scene: PackedScene
@export var time: float
@onready var timer: Timer = $Timer
@export var megre: int

func _ready() -> void:
	var pre_car = car_scene.instantiate()
	pre_car.global_position = global_position
	
	# 2. А ВЖЕ ПОТІМ додаємо твій зсув (megre) вперед по дорозі
	pre_car.global_position.x += megre
	
	# 3. Безпечно додаємо її в головну сцену
	get_tree().current_scene.call_deferred("add_child", pre_car)
	timer.wait_time = time
	timer.start()

func spawn_car() -> void:	
	# 1. Створюємо копію машини
	var car_instance = car_scene.instantiate()
	
	# 2. Ставимо машину рівно в координати нашого Marker2D
	car_instance.global_position = global_position
	
	# 3. Додаємо її в головну сцену гри (щоб вона була незалежною)
	get_tree().current_scene.add_child(car_instance)


func _on_timer_timeout() -> void:
	spawn_car()
