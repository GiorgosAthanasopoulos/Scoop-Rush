extends Label

var _cargo: int = 0

func _ready() -> void:
	var error: Error = Signals.cargo_collected.connect(_on_cargo_collected) as Error
	if error != OK:
		print(error)

func _on_cargo_collected() -> void:
	_cargo += 1
	text = "Cargo: " + str(_cargo)

