extends Control

@export var settings_scene_res_path: String = &'res://scenes/ui/settings/settings.tscn'
@export var level_1_res_path: String = &'res://scenes/levels/level1/level1.tscn'

func _on_quit_button_pressed() -> void:
	get_tree().quit()

func _on_settings_button_pressed() -> void:
	var error: Error = get_tree().change_scene_to_file(settings_scene_res_path)
	if error != OK:
		push_error("Failed to go to settings menu: " + error_string(error))

func _on_play_button_pressed() -> void:
	var error: Error = get_tree().change_scene_to_file(level_1_res_path)
	if error != OK:
		push_error("Failed to go to level 1: " + error_string(error))
