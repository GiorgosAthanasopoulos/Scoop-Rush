extends Node

@export var music_bus: String = &'Music'

@onready var player: AudioStreamPlayer = AudioStreamPlayer.new()

const MENU: AudioStreamOggVorbis = preload('res://assets/audio/music/menu/v1/menu.ogg')
const ICE_CREAM_HOUSE: AudioStreamOggVorbis = preload('res://assets/audio/music/v3/scoop city.ogg')

func _ready() -> void:
	add_child(player)
	player.bus = music_bus
	play_menu_music()

func play_menu_music() -> void:
	player.stream = MENU
	player.play()

func play_game_music() -> void:
	player.stream = ICE_CREAM_HOUSE
	player.play()

func stop() -> void:
	player.stop()

func pause() -> void:
	player.stream_paused = true

func unpause() -> void:
	player.stream_paused = false
