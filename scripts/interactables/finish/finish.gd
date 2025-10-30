extends Area2D

@export var player_group: String = "player"

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group(player_group):
		get_tree().call_deferred("reload_current_scene")
