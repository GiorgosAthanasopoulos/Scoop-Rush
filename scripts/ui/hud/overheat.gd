extends ProgressBar

var _max_charges: int = 0
var _charges: int = 0

func _ready() -> void:
	var error: Error = Signals.boost_picked_up.connect(_on_boost_picked_up) as Error
	if error != OK:
		push_error("Failed to connect on boost picked up in hud: " + error_string(error))

	error = Signals.boost_used.connect(_on_boost_used) as Error
	if error != OK:
		push_error("Failed to connect on boost used up in hud: " + error_string(error))


func _on_boost_picked_up(charges: int) -> void:
	_charges = charges
	_max_charges = charges
	value = max_value

func _on_boost_used() -> void:
	_charges -= 1
	value = float(_charges) / float(_max_charges) * 100.0
