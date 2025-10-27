extends RigidBody2D

@export var torque: float = 200_000
@export var max_torque: float = 30

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed(&'move_right'):
		_accelerate(torque, delta)
	if Input.is_action_pressed(&'move_left'):
		_accelerate(-torque, delta)

func _accelerate(_torque: float, delta: float) -> void:
	var no_torque: bool = _torque == 0
	if no_torque:
		return

	var has_hit_max_speed: bool = abs(angular_velocity) >= abs(max_torque)
	if has_hit_max_speed:
		return

	apply_torque_impulse(_torque * delta)
