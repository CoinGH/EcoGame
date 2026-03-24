extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.money_changed.connect(_on_money_changed)

func _on_money_changed(value):
	text = str(value) + " $"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
