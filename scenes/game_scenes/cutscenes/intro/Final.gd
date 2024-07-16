extends Node2D

@onready var special_text = $SpecialText

signal ended

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass
    
func start():
    special_text.start()

func _on_special_text_end_click():
    special_text.exit_scene()
    ended.emit()
