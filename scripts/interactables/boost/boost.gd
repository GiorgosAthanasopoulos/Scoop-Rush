extends Area2D

@export var player_group: String = "player"
@export var boost_amount: int = 3

@onready var audio_stream_player: AudioStreamPlayer = $audio_stream_player

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group(player_group):
		Signals.emit_boost_picked_up(boost_amount)
		#audio_stream_player.play()
		queue_free()

#func _on_audio_stream_player_finished() -> void:
	#queue_free()
