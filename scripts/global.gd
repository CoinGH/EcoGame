extends Node
var money = 357.45
var health = 100
signal money_changed(new_value)
signal health_changed(new_val)
var scene = ""
var volume_value: float = 100.0
var is_fullscreen: bool = false
var is_vsync: bool = false
var language_index: int = 0
var inventory = {
	0: "fruit_salad", 1: "fruit_salad", 2: "handcrafted_game_console", 3: "", 4: "",
	5: "handcrafted_game_console", 6: "handcrafted_accumulator", 7: "", 8: "", 9: "",
	10: "soup", 11: "soup", 12: "handcrafted_accumulator", 13: "", 14: ""
}
var npc_memory = {}
var can_move: bool = true
var car_speed: float = 300.0
var spawn_point: String = ""
var is_instructed: bool = false

const plastic_price: float = 15.75
const glass_price: float = 18.25
const paper_price: float = 8.67
const metal_price: float = 23.33

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
			print("Додано ", item_name, " у слот ", i)
			inventory_updated.emit()
			return true
	print("Інвентар повний!")
	return false
