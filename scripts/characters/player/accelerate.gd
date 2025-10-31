extends RigidBody2D

@export var torque: float = 200_000
@export var max_torque: float = 30
@export var acceleration_motor_pitch: float = 1.5
@export var move_left_input_action: String = &'move_left'
@export var move_right_input_action: String = &'move_right'

@onready var motor_audio: AudioStreamPlayer = $'../../motor_audio'

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed(move_right_input_action):
		_accelerate(torque, delta)
	if Input.is_action_pressed(move_left_input_action):
		_accelerate(-torque, delta)

func _process(_delta: float) -> void:
	var accelerating: bool = Input.is_action_pressed(move_right_input_action) or Input.is_action_pressed(move_left_input_action)
	motor_audio.pitch_scale = acceleration_motor_pitch if accelerating else 1.0

func _accelerate(_torque: float, delta: float) -> void:
	var no_torque: bool = _torque == 0
	if no_torque:
		return

	var has_hit_max_speed: bool = abs(angular_velocity) >= abs(max_torque)
	if has_hit_max_speed:
		return

	apply_torque_impulse(_torque * delta)
