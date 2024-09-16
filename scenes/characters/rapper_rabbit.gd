extends Character

@onready var default: Node2D = $Sprites/Default
@onready var thinking: Node2D = $Sprites/Thinking
@onready var goofy: Node2D = $Sprites/Goofy


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    poses = {
        "default": default,
        "thinking": thinking,
        "goofy": goofy
    }
    super()
