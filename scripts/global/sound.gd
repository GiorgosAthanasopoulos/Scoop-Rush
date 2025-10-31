extends Node

@export var sfx_bus: String = &'SFX'

@onready var player: AudioStreamPlayer = AudioStreamPlayer.new()

const UI_CLICK: AudioStreamWAV = preload('res://assets/audio/sfx/ui/UIClick.wav')
const UI_HOVER: AudioStreamWAV = preload('res://assets/audio/sfx/ui/UIHover.wav')

func _ready() -> void:
	add_child(player)
	player.bus = sfx_bus

func play_mouse_entered() -> void:
	player.stream = UI_HOVER
	player.play()

func play_pressed() -> void:
	player.stream = UI_CLICK
	player.play()
