extends RigidBody2D

@export var air_torque: float = 1_000_000
@export var air_torque_left_wheel_divider: float = 2

@export var flip_reset_time: float = 3
@export var flip_limits_deg: Vector2i = Vector2i(100, 260)
var _flipped_timer: float = 0

func _turn(_torque: float, delta: float) -> void:
	var has_air_torque: bool = _torque != 0
	if not has_air_torque:
		return

	var moving_right: bool = Input.is_action_pressed(&'move_right')
	apply_torque_impulse(_torque * delta if moving_right else _torque / air_torque_left_wheel_divider * delta)

func _handle_flipping(delta: float) -> void:
	var abs_rotation_deg: float = abs(rad_to_deg(rotation))
	var has_flipped: bool = abs_rotation_deg > flip_limits_deg.x and abs_rotation_deg < flip_limits_deg.y

	if not has_flipped:
		_flipped_timer = 0 # reset flipped timer
		return

	_flipped_timer += delta
	var needs_to_restart: bool = _flipped_timer > flip_reset_time
	if needs_to_restart:
		var error: Error = get_tree().reload_current_scene()
		if error != OK:
			print(error_string(error))

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed(&'turn_left'):
		_turn(-air_torque, delta)

	if Input.is_action_pressed(&'turn_right'):
		_turn(air_torque, delta)

	_handle_flipping(delta)
