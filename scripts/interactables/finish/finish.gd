extends Area2D

@export var player_group: String = "player"
@export var main_menu_scene_res_path: String = &'res://scenes/ui/menu/menu.tscn'

@onready var audio_stream_player: AudioStreamPlayer = $audio_stream_player

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group(player_group):
		Music.stop()
		audio_stream_player.play()

func _on_audio_stream_player_finished() -> void:
	Music.play_menu_music()
	var error: Error = get_tree().change_scene_to_file(main_menu_scene_res_path)
	if error != OK:
		push_error("Failed to go to main menu scene: " + error_string(error))
