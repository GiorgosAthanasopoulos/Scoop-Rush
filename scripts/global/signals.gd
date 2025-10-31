extends Node

signal cargo_collected
signal ring_of_fire_passed

func emit_cargo_collected() -> void:
	cargo_collected.emit()

func emit_ring_of_fire_passed() -> void:
	ring_of_fire_passed.emit()
