extends Control
@onready var volume_slider: HSlider = $VBoxContainer/HBoxContainer/volume_slider
@onready var vsync_toggle: CheckButton = $VBoxContainer/HBoxContainer2/vsync_toggle
@onready var fullscreen_toggle: CheckButton = $VBoxContainer/HBoxContainer3/fullscreen_toggle
@onready var lang_options: OptionButton = $VBoxContainer/HBoxContainer4/lang_options
@onready var asp: AudioStreamPlayer = $AudioStreamPlayer
@onready var asps: AudioStreamPlayer = $AudioStreamPlayer2

func _on_back_button_pressed() -> void:
	asp.play()
	await asp.finished
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _ready() -> void:
	volume_slider.value = Global.volume_value
	vsync_toggle.button_pressed = Global.is_vsync
	fullscreen_toggle.button_pressed = Global.is_fullscreen
	lang_options.selected = Global.language_index

func _on_toggle_pressed() -> void:
	asps.play()
	await asps.finished

# ---------------------------------------------------
# ГУЧНІСТЬ (HSlider)
# ---------------------------------------------------
func _on_h_slider_value_changed(value: float) -> void:
	var master_bus = AudioServer.get_bus_index("Master")
	
	AudioServer.set_bus_volume_db(master_bus, linear_to_db(value))
	
	Global.volume_value = value

# ---------------------------------------------------
# ПОВНИЙ ЕКРАН (CheckButton)
# ---------------------------------------------------
func _on_fullscreen_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		
	Global.is_fullscreen = toggled_on

# ---------------------------------------------------
# ВЕРТИКАЛЬНА СИНХРОНІЗАЦІЯ (CheckButton)
# ---------------------------------------------------
func _on_v_sync_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
	else:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
		
	Global.is_vsync = toggled_on

# ---------------------------------------------------
# МОВА (OptionButton)
# ---------------------------------------------------
func _on_language_item_selected(index: int) -> void:
	if index == 0:
		TranslationServer.set_locale("en")
	elif index == 1:
		TranslationServer.set_locale("uk")
		
	Global.language_index = index
