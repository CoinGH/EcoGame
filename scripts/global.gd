extends Node
var money = 0
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

const plastic_price: float = 15.75
const glass_price: float = 19.25
const paper_price: float = 8.67

# Сигнал, щоб казати UI, що інвентар змінився і треба перемалювати іконки
signal inventory_updated

# Універсальна функція додавання
func add_item(item_name: String) -> bool:
	for i in range(0, 15): # Цикл пробігається по слотах від 1 до 15
		if inventory[i] == "": # Якщо знаходить порожній слот
			inventory[i] = item_name # Кладе туди предмет
			print("Додано ", item_name, " у слот ", i)
			inventory_updated.emit() # Кричимо, що інвентар оновився
			return true # Повертаємо true (успіх)
			
	print("Інвентар повний!")
	return false # Якщо дійшли сюди, значить вільних місць немає (false)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
