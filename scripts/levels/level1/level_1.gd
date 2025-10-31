extends Node2D

@export var initial_cargo_count: int = 3

func _ready() -> void:
	for i: int in range(initial_cargo_count):
		Signals.emit_cargo_collected()
