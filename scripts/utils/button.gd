extends Button

func _ready() -> void:
	var error: Error = mouse_entered.connect(_on_mouse_entered) as Error
	if error != OK:
		push_error("Failed to connect mouse_entered signal on button util: " + error_string(error))
	error = pressed.connect(_on_pressed) as Error
	if error != OK:
		push_error("Failed to connect mouse_entered signal on button util: " + error_string(error))

func _on_mouse_entered() -> void:
	Sound.play_mouse_entered()

func _on_pressed() -> void:
	Sound.play_pressed()
