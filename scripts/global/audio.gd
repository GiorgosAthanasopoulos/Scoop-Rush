extends Node

@export var master_bus_name: String = &'Master'
@export var music_bus_name: String = &'Music'
@export var sfx_bus_name: String = &'SFX'

func _ready() -> void:
	set_master_volume(Settings.master_volume)
	set_music_volume(Settings.music_volume)
	set_sfx_volume(Settings.sfx_volume)

func set_master_volume(volume_linear: int) -> void:
	_set_volume(master_bus_name, volume_linear)

func set_music_volume(volume_linear: int) -> void:
	_set_volume(music_bus_name, volume_linear)

func set_sfx_volume(volume_linear: int) -> void:
	_set_volume(sfx_bus_name, volume_linear)

func _set_volume(bus_name: String, volume_linear: int) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index(bus_name), float(volume_linear) / 100)

func toggle_master_mute() -> bool:
	return _mute(master_bus_name)

func toggle_music_mute() -> bool:
	return _mute(music_bus_name)

func toggle_sfx_mute() -> bool:
	return _mute(sfx_bus_name)

func _mute(bus_name: String) -> bool:
	var bus_idx: int = AudioServer.get_bus_index(bus_name)
	var muted: bool = !AudioServer.is_bus_mute(bus_idx)
	AudioServer.set_bus_mute(bus_idx, muted)
	return muted
