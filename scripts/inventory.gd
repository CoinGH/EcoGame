extends CanvasLayer

@onready var grid: GridContainer = $GridContainer 

var tex_empty = preload("res://resources/items/empty_slot.png")

const TEXTURE_MAP = {
	"plastic": preload("res://resources/items/ph_6777.png"),
	"metal": preload("res://resources/items/ph_67778.png"),
	"glass": preload("res://resources/items/ph_677.png"),
	"paper": preload("res://resources/items/ph_677787.png"),
	"fruit_salad": preload("res://resources/items/fs_slot.png"),
	"handcrafted_game_console": preload("res://resources/items/hgc_slot.png"),
	"soup": preload("res://resources/items/s_slot.png"),
	"handcrafted_accumulator": preload("res://resources/items/ha_slot.png"),
	"electronic": preload("res://resources/items/el_slot.png"),
	"salt": preload("res://resources/items/salt_slot.png"),
	"fruits": preload("res://resources/items/fruits_slot.png"),
	"sugar": preload("res://resources/items/sugar_slot.png"),
	"vegetables": preload("res://resources/items/veg_slot.png")
}

func _ready() -> void:
	Global.inventory_updated.connect(update_ui)
	update_ui()

func update_ui() -> void:
	var slots = grid.get_children()
	for i in range(0, 15):
		var current_slot = slots[i]
		var item_name = Global.inventory[i]
		if TEXTURE_MAP.has(item_name):
			current_slot.texture = TEXTURE_MAP[item_name]
		else:
			current_slot.texture = tex_empty
