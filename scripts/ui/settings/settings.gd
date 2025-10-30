extends Control

@export var master_bus_name: String = &'Master'
@export var music_bus_name: String = &'Music'
@export var sfx_bus_name: String = &'SFX'

@export var main_menu_scene_res_path: String = &'res://scenes/ui/meun/menu.tscn'
@export var settings_scene_res_path: String = &'res://scenes/ui/meun/menu.tscn'

@export var back_input_action: String = &'ui_cancel'

@onready var master_volume_slider: HSlider = $v_box_container/h_box_container/master_volume_slider
@onready var music_volume_slider: HSlider = $v_box_container/h_box_container_2/music_volume_slider
@onready var sfx_volume_slider: HSlider = $v_box_container/h_box_container_3/sfx_volume_slider

func _ready() -> void:
	master_volume_slider.value = Settings.master_volume
	_set_bus_volume_percent(master_bus_name, Settings.master_volume)

	music_volume_slider.value = Settings.music_volume
	_set_bus_volume_percent(music_bus_name, Settings.music_volume)

	sfx_volume_slider.value = Settings.sfx_volume
	_set_bus_volume_percent(sfx_bus_name, Settings.sfx_volume)

func _on_sfx_volume_slider_value_changed(value: float) -> void:
	_set_bus_volume_percent(sfx_bus_name, Settings.sfx_volume)
	Settings.sfx_volume = int(value)
	Settings.save_settings()

func _on_music_volume_slider_value_changed(value: float) -> void:
	_set_bus_volume_percent(music_bus_name, Settings.music_volume)
	Settings.music_volume = int(value)
	Settings.save_settings()

func _on_master_volume_slider_value_changed(value: float) -> void:
	_set_bus_volume_percent(master_bus_name, Settings.master_volume)
	Settings.master_volume = int(value)
	Settings.save_settings()

func _on_back_button_pressed() -> void:
	var error: Error = get_tree().change_scene_to_file(main_menu_scene_res_path)
	if error != OK:
		push_error(error_string(error))

func _input(event: InputEvent) -> void:
	if event.is_action_released(back_input_action):
		var error: Error = get_tree().change_scene_to_file(settings_scene_res_path)
		if error != OK:
			push_error(error_string(error))

func _set_bus_volume_percent(bus_name: String, volume: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index(bus_name), volume / 100)
