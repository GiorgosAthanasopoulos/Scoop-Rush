extends Control

@onready var master_volume_slider: HSlider = $v_box_container/h_box_container/music_volume_slider
@onready var music_volume_slider: HSlider = $v_box_container/h_box_container/master_volume_slider
@onready var sfx_volume_slider: HSlider = $v_box_container/h_box_container/sfx_volume_slider

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

func _on_music_volume_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Music"), value / 100)
	Settings.music_volume = int(value)

func _on_master_volume_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Master"), value / 100)
	Settings.master_volume = int(value)
