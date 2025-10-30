extends Node

var has_seen_controls_popup: bool = false

const SETTINGS_FILE_PATH: String = "user://settings.cfg"

func _ready() -> void:
	load_settings()

func _exit_tree() -> void:
	save_settings()

func save_settings() -> void:
	var config: ConfigFile = ConfigFile.new()
	config.set_value("ui", "has_seen_controls_popup", has_seen_controls_popup)
	var error: Error = config.save(SETTINGS_FILE_PATH)
	if error != OK:
		push_error("Failed to save settings file: " + error_string(error))
		return

func load_settings() -> void:
	var config: ConfigFile = ConfigFile.new()
	var error: Error = config.load(SETTINGS_FILE_PATH)
	if error != OK:
		push_error("Failed to load settings file: " + error_string(error))
		return
	has_seen_controls_popup = config.get_value("ui", "has_seen_controls_popup", false)
