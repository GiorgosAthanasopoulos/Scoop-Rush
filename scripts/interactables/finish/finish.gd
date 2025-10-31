extends Area2D

@export var player_group: String = "player"
@export var main_menu_scene_res_path: String = &'res://scenes/ui/menu/menu.tscn'

@onready var audio_stream_player: AudioStreamPlayer = $audio_stream_player
@onready var lose: AudioStreamPlayer = $lose

var _cargo: int = 0

func _ready() -> void:
	var error: Error = Signals.cargo_collected.connect(_on_cargo_collected) as Error
	if error != OK:
		push_error("Failed to connect cargo_collected signal in finish flag: " + error_string(error))

	error = Signals.remove_cargo.connect(_on_cargo_removed) as Error
	if error != OK:
		push_error("Failed to connect remove_cargo signal in finish flag: " + error_string(error))

func _on_cargo_collected() -> void:
	_cargo += 1

func _on_cargo_removed() -> void:
	_cargo -= 1

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group(player_group):
		Music.stop()
		audio_stream_player.play()

func _on_audio_stream_player_finished() -> void:
	if _cargo == 0:
		lose.play()
		await get_tree().create_timer(.1).timeout
	Signals.emit_finished_level(_cargo)
