extends CanvasLayer

# Шлях до твоєї сітки (перетягни сюди GridContainer з затиснутим Ctrl)
@onready var grid: GridContainer = $GridContainer 

var tex_full = preload("res://resources/items/ph_1.png")
var tex_empty = preload("res://resources/items/ph_2.png")

func _ready() -> void:
	# Слухаємо сигнал з Глобала. Коли щось підібрали — запускаємо update_ui
	Global.inventory_updated.connect(update_ui)
	
	# Оновлюємо сітку одразу при запуску
	update_ui()

func update_ui() -> void:
	# Отримуємо масив усіх 15 квадратиків (ColorRect), які лежать у сітці
	var slots = grid.get_children()
	
	# Пробігаємося по нашому словнику від 1 до 15
	for i in range(0, 15):
		var current_slot = slots[i]
		var item_name = Global.inventory[i]
		
		# Якщо в словнику є предмет - пишемо його назву. Якщо немає - очищаємо.
		if item_name != "":
			current_slot.texture = tex_full
		else:
			current_slot.texture = tex_empty
