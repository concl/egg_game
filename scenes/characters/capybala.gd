
extends Character

@onready var default = $Sprites/Default
@onready var nervous = $Sprites/Nervous

var test = 0

# Called when the node enters the scene tree for the first time.
func _ready():
    poses = {
        "default": default,
        "nervous": nervous
    }
    super()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    super(delta)
    
