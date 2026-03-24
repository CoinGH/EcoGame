extends Control

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

# ---------------------------------------------------
# ГУЧНІСТЬ (HSlider)
# ---------------------------------------------------
func _on_h_slider_value_changed(value: float) -> void:
	var master_bus = AudioServer.get_bus_index("Master")
	
	AudioServer.set_bus_volume_db(master_bus, linear_to_db(value))

# ---------------------------------------------------
# ПОВНИЙ ЕКРАН (CheckButton)
# ---------------------------------------------------
func _on_fullscreen_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

# ---------------------------------------------------
# ВЕРТИКАЛЬНА СИНХРОНІЗАЦІЯ (CheckButton)
# ---------------------------------------------------
func _on_v_sync_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
	else:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)

# ---------------------------------------------------
# МОВА (OptionButton)
# ---------------------------------------------------
func _on_language_item_selected(index: int) -> void:
	if index == 0:
		TranslationServer.set_locale("en")
	elif index == 1:
		TranslationServer.set_locale("uk")
