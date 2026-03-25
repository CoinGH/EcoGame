extends StaticBody2D
@onready var area_2d: Area2D = $Area2D
var inside: bool = false
@onready var keyboard_e_2: Sprite2D = $"../KeyboardE2"

# МАГІЯ ТУТ: @export дозволяє вписувати назву прямо в Інспекторі справа!
@export var item_name: String = "plastic" 

func _ready() -> void:
	keyboard_e_2.hide()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Interact") and inside:
		# Пробуємо покласти предмет в інвентар
		var was_added = Global.add_item(item_name)
		
		# Якщо в інвентарі було місце і функція повернула true:
		if was_added:
			queue_free() # Видаляємо предмет зі сцени (ми його підібрали)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		inside = true
		keyboard_e_2.show()

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		inside = false
		keyboard_e_2.hide()
