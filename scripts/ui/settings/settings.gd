extends Control

@onready var master_volume_slider: HSlider = $v_box_container/h_box_container/master_volume_slider
@onready var music_volume_slider: HSlider = $v_box_container/h_box_container_2/music_volume_slider
@onready var sfx_volume_slider: HSlider = $v_box_container/h_box_container_3/sfx_volume_slider

func _ready() -> void:
	master_volume_slider.value = Settings.master_volume
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Master"), float(Settings.master_volume) / 100)

	music_volume_slider.value = Settings.music_volume
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Music"), float(Settings.music_volume) / 100)

	sfx_volume_slider.value = Settings.sfx_volume
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("SFX"), float(Settings.sfx_volume) / 100)

func _on_sfx_volume_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("SFX"), value / 100)
	Settings.sfx_volume = int(value)
	Settings.save_settings()

func _on_music_volume_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Music"), value / 100)
	Settings.music_volume = int(value)
	Settings.save_settings()

func _on_master_volume_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Master"), value / 100)
	Settings.master_volume = int(value)
	Settings.save_settings()

func _on_back_button_pressed() -> void:
	var error: Error = get_tree().change_scene_to_file('res://scenes/ui/meun/menu.tscn')
	if error != OK:
		push_error(error_string(error))

func _input(event: InputEvent) -> void:
	if event.is_action_released("ui_cancel"):
		var error: Error = get_tree().change_scene_to_file('res://scenes/ui/meun/menu.tscn')
		if error != OK:
			push_error(error_string(error))
