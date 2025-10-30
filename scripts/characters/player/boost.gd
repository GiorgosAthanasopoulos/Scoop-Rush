extends Node

@export var boost_force : float = 10_000
@export var boostInputAction: String = &'boost'

@onready var player: RigidBody2D = $'..'
@onready var sprite_2d: Sprite2D = $'../sprite_2d'

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed(boostInputAction):
		_boost(true)
	if Input.is_action_pressed(boostInputAction):
		_boost()

func _boost(single_frame: bool = false) -> void:
	var has_boost: bool = true
	if not has_boost:
		return

	var dir: Vector2 = Vector2.RIGHT.rotated(player.rotation)
	var _boost_force: Vector2 = dir * boost_force

	if single_frame:
		player.apply_central_impulse(_boost_force)
	player.apply_central_force(_boost_force)
