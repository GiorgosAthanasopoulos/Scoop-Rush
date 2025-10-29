extends Control

func _on_quit_button_pressed() -> void:
	get_tree().quit()

func _on_settings_button_pressed() -> void:
	var error: Error = get_tree().change_scene_to_file("res://ui/settings/settings.tscn")
	if error != OK:
		push_error("Failed to go to settings menu: " + error_string(error))

func _on_play_button_pressed() -> void:
	var error: Error = get_tree().change_scene_to_file("res://levels/level1/level1.tscn")
	if error != OK:
		push_error("Failed to go to level 1: " + error_string(error))
