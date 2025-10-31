extends Node

@export var music_bus: String = &'Music'

@onready var player: AudioStreamPlayer = AudioStreamPlayer.new()

const MENU: AudioStreamOggVorbis = preload('res://assets/audio/music/menu/v1/menu.ogg')
const SCOOP_CITY_DEMO: AudioStreamMP3 = preload('res://assets/audio/music/v2/scoop city_demo.mp3')

func _ready() -> void:
	add_child(player)
	player.bus = music_bus
	play_menu_music()

func play_menu_music() -> void:
	player.stream = MENU
	player.play()

func play_game_music() -> void:
	player.stream = SCOOP_CITY_DEMO
	player.play()

func stop() -> void:
	player.stop()

func pause() -> void:
	player.stream_paused = true

func unpause() -> void:
	player.stream_paused = false
