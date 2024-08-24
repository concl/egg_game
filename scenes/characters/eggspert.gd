extends Character


@onready var default: Node2D = $Sprites/Default
@onready var thinking: Node2D = $Sprites/Thinking
@onready var confused: Node2D = $Sprites/Confused

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    poses = {
        "default": default,
        "thinking": thinking,
        "confused": confused
    }
    
