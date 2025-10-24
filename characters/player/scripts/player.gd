extends RigidBody2D

@export var wheels: Array[Wheel] = []
@export var torque: float = 300_000
@export var max_speed: float = 50

func accelerate(_torque: float, delta: float) -> void:
	for wheel: Wheel in wheels:
		if _torque < 0:
			if wheel.angular_velocity > -max_speed:
				wheel.apply_torque_impulse(_torque * delta)
		else:
			if wheel.angular_velocity < max_speed:
				wheel.apply_torque_impulse(_torque * delta)

func _process(delta: float) -> void:
	if Input.is_action_pressed(&'move_left'):
		accelerate(-torque, delta)
	if Input.is_action_pressed(&'move_right'):
		accelerate(torque, delta)
