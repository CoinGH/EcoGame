extends ProgressBar


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.health_changed.connect(_on_health_changed)

func _on_health_changed(value1):
	value = value1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
