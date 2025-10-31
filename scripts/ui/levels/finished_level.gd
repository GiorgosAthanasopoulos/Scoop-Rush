extends Control

@export var one_star_threshold: int = 1
@export var two_star_threshold: int = 5
@export var three_star_threshold: int = 10
@export var main_menu_scene_res_path: String = &'res://scenes/ui/menu/menu.tscn'

@onready var score_1: Button = $canvas_layer/v_box_container/h_box_container/score_1
@onready var score_2: Button = $canvas_layer/v_box_container/h_box_container/score_2
@onready var score_3: Button = $canvas_layer/v_box_container/h_box_container/score_3
@onready var canvas_layer: CanvasLayer = $canvas_layer

func _ready() -> void:
	var error: Error = Signals.finished_level.connect(_on_finished_level) as Error
	if error != OK:
		push_error("Failed to connect to finished level signal in finished level ui: " + error_string(error))

func _on_finished_level(cargo: int) -> void:
	score_1.visible = cargo >= one_star_threshold
	score_2.visible = cargo >= two_star_threshold
	score_3.visible = cargo >= three_star_threshold
	canvas_layer.visible = true

func _on_replay_button_pressed() -> void:
	Music.play_game_music()
	var error: Error = get_tree().reload_current_scene()
	if error != OK:
		push_error("Failed to reload current scene in finished level: " + error_string(error))

func _on_main_menu_button_pressed() -> void:
	Music.play_menu_music()
	var error: Error = get_tree().change_scene_to_file(main_menu_scene_res_path)
	if error != OK:
		push_error("Failed to go to main menu in finished level: " + error_string(error))

func _on_quit_button_pressed() -> void:
	await get_tree().create_timer(.1).timeout
	get_tree().quit()
