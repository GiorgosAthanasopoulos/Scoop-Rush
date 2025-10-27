extends Area2D
class_name Brickle

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		var mouse_button_event: InputEventMouseButton = event as InputEventMouseButton
		if mouse_button_event.button_index == MouseButton.MOUSE_BUTTON_LEFT and mouse_button_event.pressed:
			Signals.emit_grapple_attached(self)
