
extends GameScene

@onready var transition_manager = $TransitionManager

# Called when the node enters the scene tree for the first time.
func _ready():
    transition_manager.fade_in()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass
