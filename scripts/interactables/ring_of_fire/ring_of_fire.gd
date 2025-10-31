extends StaticBody2D

@export var player_group: String = &'player'

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group(player_group):
		Signals.emit_overheat_add()
