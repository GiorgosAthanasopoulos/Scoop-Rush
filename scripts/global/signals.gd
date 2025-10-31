extends Node

signal cargo_collected
signal ring_of_fire_passed
signal finished_level(cargo: int)

func emit_cargo_collected() -> void:
	cargo_collected.emit()

func emit_ring_of_fire_passed() -> void:
	ring_of_fire_passed.emit()

func emit_finished_level(cargo: int) -> void:
	finished_level.emit(cargo)
