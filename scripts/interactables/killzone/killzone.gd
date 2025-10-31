extends Area2D

@export var player_group: String = "player"

@onready var crash_audio: AudioStreamPlayer = $crash_audio

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group(player_group):
		Music.pause()
		crash_audio.play()

func _on_crash_audio_finished() -> void:
	Music.unpause()
	get_tree().call_deferred("reload_current_scene")
