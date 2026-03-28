extends StaticBody2D
@onready var area0: Area2D = $Area2D
var inside: bool = false
@onready var keyboard_e: Sprite2D = $KeyboardE


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	keyboard_e.hide()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Interact") and inside:
		Global.money += Global.inventory.values().count("glass") * Global.glass_price + Global.inventory.values().count("paper") * Global.paper_price + Global.inventory.values().count("plastic") * Global.plastic_price
		Global.money_changed.emit(Global.money)
		for i in range (0, 15):
			if Global.inventory[i] == "plastic" or Global.inventory[i] == "glass" or Global.inventory[i] == "paper":
				Global.inventory[i] = ""
		Global.inventory_updated.emit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		inside = true
		keyboard_e.visible = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		inside = false
		keyboard_e.visible = false
