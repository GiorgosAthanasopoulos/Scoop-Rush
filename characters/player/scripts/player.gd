extends RigidBody2D

@export var wheels: Array[Wheel] = []
@export var torque: float = 300_000
@export var max_speed: float = 50
@export var flip_reset_timer: float = 3

var _flipped_timer: float = 0

func _accelerate(_torque: float, delta: float) -> void:
	for wheel: Wheel in wheels:
		if _torque < 0:
			if wheel.angular_velocity > -max_speed:
				wheel.apply_torque_impulse(_torque * delta)
		else:
			if wheel.angular_velocity < max_speed:
				wheel.apply_torque_impulse(_torque * delta)

func _handle_flipping(delta: float) -> void:
	if abs(rad_to_deg(rotation)) > 100 and abs(rad_to_deg(rotation)) < 260:
		_flipped_timer += delta
		if _flipped_timer > flip_reset_timer:
			var error: Error = get_tree().reload_current_scene()
			if error != OK:
				print(error)
	else:
		_flipped_timer = 0.0

func _process(delta: float) -> void:
	if Input.is_action_pressed(&'move_left'):
		_accelerate(-torque, delta)
	if Input.is_action_pressed(&'move_right'):
		_accelerate(torque, delta)
	_handle_flipping(delta)
