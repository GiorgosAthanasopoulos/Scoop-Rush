extends Timer

@onready var timer_label: Label = $'../canvas_layer/v_box_container_3/timer_label'
@onready var lose: AudioStreamPlayer = $'../lose'

func _process(_delta: float) -> void:
	if State.paused:
		return

	timer_label.text = "Time: " + str(int(time_left))

func _on_timeout() -> void:
	lose.play()
	await get_tree().create_timer(.1).timeout
	Signals.emit_finished_level(0)
