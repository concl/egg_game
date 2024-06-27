extends CanvasLayer


var dimensions: Vector2
var characters = []

# Called when the node enters the scene tree for the first time.
func _ready():
    dimensions = get_viewport().get_visible_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass

func _process_changes():
    var changes = State.changes
    State.changes = []
    
    # mutate list / play animations
    for x in changes:
        name = x["name"]
        if name == "AddCharacter":
            characters.append(x.character)
        elif name == "MoveCharacter":
            pass
    
    # handle changed positions
            
            
    print(characters)
