extends Node

signal cargo_collected
signal remove_cargo

signal ring_of_fire_passed

signal finished_level(cargo: int)

signal boost_picked_up(charges: int)
signal boost_used

signal overheat_add
signal overheat_remove

func emit_cargo_collected() -> void:
	cargo_collected.emit()

func emit_remove_cargo() -> void:
	remove_cargo.emit()

func emit_ring_of_fire_passed() -> void:
	ring_of_fire_passed.emit()

func emit_finished_level(cargo: int) -> void:
	assert(cargo >= 0)
	finished_level.emit(cargo)

func emit_boost_picked_up(charges: int) -> void:
	assert(charges > 0)
	boost_picked_up.emit(charges)

func emit_boost_used() -> void:
	boost_used.emit()

func emit_overheat_add() -> void:
	overheat_add.emit()

func emit_overheat_remove() -> void:
	overheat_remove.emit()
