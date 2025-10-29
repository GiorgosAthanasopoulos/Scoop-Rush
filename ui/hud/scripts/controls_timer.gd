extends Timer

@onready var controls: Label = get_parent()

func _on_timeout() -> void:
	controls.visible = false
