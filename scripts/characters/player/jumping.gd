extends Node2D

@export var jump_force: float = 3000
@export var jump_input_action: String = &'jump'

@onready var ground_ray: RayCast2D = $jump_raycast
@onready var player: RigidBody2D = get_parent() as RigidBody2D
@onready var jump_audio: AudioStreamPlayer = $'../jump_audio'

func _input(event: InputEvent) -> void:
	if event.is_action_pressed(jump_input_action):
		if _is_on_ground():
			_jump()

func _jump() -> void:
	player.apply_central_impulse(Vector2(0, -jump_force))
	jump_audio.play()

func _is_on_ground() -> bool:
	return ground_ray.is_colliding()
