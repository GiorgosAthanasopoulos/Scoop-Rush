extends RigidBody2D

@export var wheels: Array[Wheel] = []
@export var torque: float = 300_000
@export var max_speed: float = 50
@export var flip_reset_timer: float = 3
@export var flip_limits_deg: Vector2i = Vector2i(100, 260)

var _flipped_timer: float = 0

func _accelerate(_torque: float, delta: float) -> void:
	var no_torque: bool = _torque == 0
	if no_torque:
		return

	for wheel: Wheel in wheels:
		var has_hit_max_speed: bool = abs(wheel.angular_velocity) >= abs(max_speed)
		if has_hit_max_speed:
			continue

		wheel.apply_torque_impulse(_torque * delta)

func _handle_flipping(delta: float) -> void:
	var abs_rotation_deg: float = abs(rad_to_deg(rotation))
	var has_flipped: bool = abs_rotation_deg > flip_limits_deg.x and abs_rotation_deg < flip_limits_deg.y

	if not has_flipped:
		_flipped_timer = 0
		return

	_flipped_timer += delta
	var needs_to_restart: bool = _flipped_timer > flip_reset_timer
	if needs_to_restart:
		var error: Error = get_tree().reload_current_scene()
		if error != OK:
			print(error)

func _process(delta: float) -> void:
	if Input.is_action_pressed(&'move_left'):
		_accelerate(-torque, delta)

	if Input.is_action_pressed(&'move_right'):
		_accelerate(torque, delta)

	_handle_flipping(delta)
