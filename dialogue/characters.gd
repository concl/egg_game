extends CanvasLayer


var dimensions: Vector2
var characters = []

# Called when the node enters the scene tree for the first time.
func _ready():
    dimensions = get_viewport().get_visible_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    print(State.test)
    print(State.phase)

func rearrange():
    
    for x in State.changes:
        pass
    
    
