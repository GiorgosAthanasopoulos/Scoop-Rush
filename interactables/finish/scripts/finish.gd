extends Area2D

# TODO: add finish flag sprite
# TODO: do something when winning (e.g. go to next level or show win message)

@export var player_group: String = "player"

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group(player_group):
		var error: Error = get_tree().reload_current_scene()
		if error != OK:
			push_error("Failed to reload level(finish): " + error_string(error))

