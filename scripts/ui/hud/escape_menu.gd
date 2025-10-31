extends CanvasLayer

@export var escape_input_action: String = &'ui_cancel'
@export var main_menu_scene_res_path: String = &'res://scenes/ui/menu/menu.tscn'
@export var settings_scene_res_path: String = &'res://scenes/ui/settings/settings.tscn'

func _input(event: InputEvent) -> void:
	if event.is_action_pressed(escape_input_action):
		visible = !visible
		State.paused = visible

func _on_resume_button_pressed() -> void:
	visible = false
	State.paused = false

func _on_settings_button_pressed() -> void:
	State.settings_from_game = true
	var settings_scene: PackedScene = load(settings_scene_res_path)
	add_child(settings_scene.instantiate())

func _on_main_menu_button_pressed() -> void:
	var error: Error = get_tree().change_scene_to_file(main_menu_scene_res_path)
	Music.play_menu_music()
	if error != OK:
		push_error("Failed to go to main menu: " + error_string(error))

func _on_quit_button_pressed() -> void:
	await get_tree().create_timer(.1).timeout
	get_tree().quit()
