extends Area2D

@export var player_group: String = "player"

@onready var audio_stream_player: AudioStreamPlayer = $audio_stream_player

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group(player_group):
		Signals.emit_cargo_collected()
		audio_stream_player.play()

func _on_audio_stream_player_finished() -> void:
	queue_free()
