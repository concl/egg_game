extends "res://scenes/game_elements/notebook/ArrowButton.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass


func _on_mouse_entered():
    mouse_over()
    


func _on_mouse_exited():
    mouse_off()