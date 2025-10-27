extends Node

signal cargo_collected
signal grapple_attached(brickle: Brickle)

func emit_cargo_collected() -> void:
	cargo_collected.emit()

func emit_grapple_attached(brickle: Brickle) -> void:
	grapple_attached.emit(brickle)
