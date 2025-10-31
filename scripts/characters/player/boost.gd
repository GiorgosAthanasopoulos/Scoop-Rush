extends Node

@export var boost_force : float = 5_000
@export var boost_input_action: String = &'boost'
@export var boost_delay: float = 2

@onready var player: RigidBody2D = $'..'
@onready var sprite_2d: Sprite2D = $'../sprite_2d'
@onready var boost_audio: AudioStreamPlayer = $'../boost_audio'

var _can_boost: bool = true
var _boost_charges: int = 0
var _timer: Timer = Timer.new()

func _ready() -> void:
	add_child(_timer)
	_timer.wait_time = boost_delay
	var error: Error = _timer.timeout.connect(_on_timer_timeout) as Error
	if error != OK:
		push_error("Failed to connect timer timeout in jumping: " + error_string(error))

	error = Signals.boost_picked_up.connect(_on_boost_picked_up) as Error
	if error != OK:
		push_error("Failed to connect on boost picked up in boost: " + error_string(error))

func _physics_process(_delta: float) -> void:
	if State.paused:
		return

	if Input.is_action_just_pressed(boost_input_action):
		_boost()

func _boost() -> void:
	var can_boost: bool = _can_boost and _boost_charges > 0
	if not can_boost:
		return

	var dir: Vector2 = Vector2.RIGHT.rotated(player.rotation)
	var _boost_force: Vector2 = dir * boost_force

	player.apply_central_impulse(_boost_force)
	boost_audio.play()
	_can_boost = false
	_timer.start()
	_boost_charges -= 1
	Signals.emit_boost_used()

func _on_timer_timeout() -> void:
	_can_boost = true

func _on_boost_picked_up(charges: int) -> void:
	_boost_charges = charges
