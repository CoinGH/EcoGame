extends Node
var money = 0.0
var health = 100
signal money_changed(new_value)
signal health_changed(new_val)
var scene = ""
var volume_value: float = 100.0
var is_fullscreen: bool = false
var is_vsync: bool = false
var language_index: int = 0
var inventory = {
	0: "", 1: "", 2: "", 3: "", 4: "",
	5: "", 6: "", 7: "", 8: "", 9: "",
	10: "", 11: "", 12: "", 13: "", 14: ""
}
var npc_memory = {}
var can_move: bool = true
var car_speed: float = 300.0
var spawn_point: String = ""
var is_instructed: bool = false

const plastic_price: float = 10.75
const glass_price: float = 12.25
const paper_price: float = 7.67
const metal_price: float = 16.33

signal inventory_updated
signal e_btn

func check_space() -> bool:
	for i in range(0, 15):
		if inventory[i] == "":
			return true
	return false

func add_item(item_name: String) -> bool:
	for i in range(0, 15):
		if inventory[i] == "":
			inventory[i] = item_name
			inventory_updated.emit()
			return true
	return false

func _ready() -> void:
	TranslationServer.set_locale("en")
