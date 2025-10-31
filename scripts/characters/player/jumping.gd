extends Node2D

@export var jump_force: float = 3000
@export var jump_input_action: String = &'jump'
@export var jump_delay: float = 1

@onready var ground_ray: RayCast2D = $jump_raycast
@onready var player: RigidBody2D = get_parent() as RigidBody2D
@onready var jump_audio: AudioStreamPlayer = $'../jump_audio'

var _can_jump: bool = true
var _timer: Timer = Timer.new()

func _ready() -> void:
	add_child(_timer)
	_timer.wait_time = jump_delay
	var error: Error = _timer.timeout.connect(_on_timer_timeout) as Error
	if error != OK:
		push_error("Failed to connect timer timeout in jumping: " + error_string(error))

func _input(event: InputEvent) -> void:
	if State.paused or State.over:
		return

	if event.is_action_pressed(jump_input_action):
		if _is_on_ground() and _can_jump:
			_jump()

func _jump() -> void:
	player.apply_central_impulse(Vector2(0, -jump_force))
	jump_audio.play()
	_can_jump = false
	_timer.start()

func _is_on_ground() -> bool:
	return ground_ray.is_colliding()

func _on_timer_timeout() -> void:
	_can_jump = true
