extends Area2D

@export var player_group: String = "player"

@onready var audio_stream_player: AudioStreamPlayer = $audio_stream_player

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group(player_group):
		Music.stop()
		audio_stream_player.play()

func _on_audio_stream_player_finished() -> void:
	Music.play_game_music()
	get_tree().call_deferred("reload_current_scene")
