extends ProgressBar

@export var max_charges: int = 2

var _charges: int = 0

func _ready() -> void:
	var error: Error = Signals.overheat_add.connect(_on_overheat_add) as Error
	if error != OK:
		push_error("Failed to connect on overheat add in hud: " + error_string(error))

	error = Signals.overheat_remove.connect(_on_overheat_remove) as Error
	if error != OK:
		push_error("Failed to connect on overheat remove in hud: " + error_string(error))


func _on_overheat_add() -> void:
	_charges += 1
	value = float(_charges) / float(max_charges) * 100.0

func _on_overheat_remove() -> void:
	_charges -= 1
	value = float(_charges) / float(max_charges) * 100.0
