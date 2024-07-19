extends Control

@onready var book_element = $BookElement
@onready var animation_player = $BookElement/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass
    
func toggle_book():
    if book_element.book_open:
        book_element.close()
    else:
        book_element.open()


