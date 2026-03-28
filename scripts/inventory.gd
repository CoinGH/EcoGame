extends CanvasLayer

@onready var grid: GridContainer = $GridContainer 

var tex_full = preload("res://resources/items/ph_1.png")
var tex_empty = preload("res://resources/items/ph_2.png")

func _ready() -> void:
	Global.inventory_updated.connect(update_ui)
	update_ui()

func update_ui() -> void:
	# Отримуємо масив усіх 15 квадратів
	var slots = grid.get_children()
	for i in range(0, 15):
		var current_slot = slots[i]
		var item_name = Global.inventory[i]
		if item_name != "":
			current_slot.texture = tex_full
		else:
			current_slot.texture = tex_empty
