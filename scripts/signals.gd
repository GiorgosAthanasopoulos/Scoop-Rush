extends Node

signal cargo_collected

func emit_cargo_collected() -> void:
	cargo_collected.emit()
