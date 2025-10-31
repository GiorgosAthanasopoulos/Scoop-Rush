extends Control

@export var master_bus_name: String = &'Master'
@export var music_bus_name: String = &'Music'
@export var sfx_bus_name: String = &'SFX'

@export var main_menu_scene_res_path: String = &'res://scenes/ui/menu/menu.tscn'
@export var settings_scene_res_path: String = &'res://scenes/ui/settings/settings.tscn'

@export var back_input_action: String = &'ui_cancel'

@onready var master_volume_slider: HSlider = $v_box_container/h_box_container/master_volume_slider
@onready var music_volume_slider: HSlider = $v_box_container/h_box_container_2/music_volume_slider
@onready var sfx_volume_slider: HSlider = $v_box_container/h_box_container_3/sfx_volume_slider

@onready var master_mute_button: Button = $v_box_container/h_box_container/master_mute_button
@onready var music_mute_button: Button = $v_box_container/h_box_container_2/music_mute_button
@onready var sfx_mute_button: Button = $v_box_container/h_box_container_3/sfx_mute_button

func _ready() -> void:
	master_volume_slider.value = Settings.master_volume
	music_volume_slider.value = Settings.music_volume
	sfx_volume_slider.value = Settings.sfx_volume

func _on_sfx_volume_slider_value_changed(value: float) -> void:
	Audio.set_sfx_volume(int(value))
	Settings.sfx_volume = int(value)
	Settings.save_settings()

func _on_music_volume_slider_value_changed(value: float) -> void:
	Audio.set_music_volume(int(value))
	Settings.music_volume = int(value)
	Settings.save_settings()

func _on_master_volume_slider_value_changed(value: float) -> void:
	Audio.set_master_volume(int(value))
	Settings.master_volume = int(value)
	Settings.save_settings()

func _on_back_button_pressed() -> void:
	await get_tree().create_timer(.1).timeout
	_back()

func _back() -> void:
	if State.settings_from_game:
		State.settings_from_game = false
		queue_free()
		return

	var error: Error = get_tree().change_scene_to_file(main_menu_scene_res_path)
	if error != OK:
		push_error("Failed to go to main menu: " + error_string(error))

func _input(event: InputEvent) -> void:
	if event.is_action_released(back_input_action):
		_back()

func _on_sfx_mute_button_pressed() -> void:
	sfx_mute_button.text = "(Muted)" if Audio.toggle_sfx_mute() else ""

func _on_music_mute_button_pressed() -> void:
	music_mute_button.text = "(Muted)" if Audio.toggle_music_mute() else ""

func _on_master_mute_button_pressed() -> void:
	master_mute_button.text = "(Muted)" if Audio.toggle_master_mute() else ""
