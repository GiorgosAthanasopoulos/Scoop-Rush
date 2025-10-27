extends Line2D

func _ready() -> void:
    var error: Error = Signals.grapple_attached.connect(_on_grapple_attached) as Error
    if error != OK:
        print(error)

func _on_grapple_attached(_brickle: Brickle) -> void:
    pass
