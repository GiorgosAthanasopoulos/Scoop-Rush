extends Node2D

@export var jump_force: float = 3000

@onready var ground_ray: RayCast2D = $jump_raycast
@onready var _player: RigidBody2D = get_parent() as RigidBody2D

func _input(event: InputEvent) -> void:
    if event.is_action_pressed("jump"):
        _jump()

func _jump() -> void:
    if _is_on_ground():
        _player.apply_central_impulse(Vector2(0, -jump_force))

func _is_on_ground() -> bool:
    return ground_ray.is_colliding()
