extends Node

@onready var animated_sprite_2d = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass
    
func mouse_over():
    
    var current_frame = animated_sprite_2d.get_frame()
    var current_progress = animated_sprite_2d.get_frame_progress()
    animated_sprite_2d.play("hover")
    animated_sprite_2d.set_frame_and_progress(current_frame, current_progress)

func mouse_off():
    var current_frame = animated_sprite_2d.get_frame()
    var current_progress = animated_sprite_2d.get_frame_progress()
    animated_sprite_2d.play("default")
    animated_sprite_2d.set_frame_and_progress(current_frame, current_progress)
