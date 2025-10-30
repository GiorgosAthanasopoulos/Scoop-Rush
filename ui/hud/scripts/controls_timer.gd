extends Timer

@onready var controls: Label = get_parent()

func _ready() -> void:
	if Settings.has_seen_controls_popup:
		controls.visible = false
		stop()

func _on_timeout() -> void:
	controls.visible = false
	Settings.has_seen_controls_popup = true
	Settings.save_settings()
