extends Node2D

static var enabled = false

@onready var glow_sprite = $GlowSprite
@onready var area_2d = $Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
    area_2d.connect("mouse_entered", _on_area_2d_mouse_entered)
    area_2d.connect("mouse_exited", _on_area_2d_mouse_exited)
    area_2d.connect("input_event", _on_area_2d_input_event)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass


func _on_area_2d_mouse_entered():
    if not State.first_book_page_solved:
        return
    glow_sprite.visible = true


func _on_area_2d_mouse_exited():
    if not State.first_book_page_solved:
        return
    glow_sprite.visible = false


func _on_area_2d_input_event(viewport, event, shape_idx):
    if not State.first_book_page_solved:
        return
    if event is InputEventMouseButton:
        print(event)
