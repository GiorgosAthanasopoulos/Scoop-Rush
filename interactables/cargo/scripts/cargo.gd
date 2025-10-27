extends Area2D

# TODO: add score points to player ui

@export var player_group: String = "player"

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group(player_group):
		Signals.emit_cargo_collected()
		queue_free()
