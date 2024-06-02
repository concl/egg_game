extends Node2D

class_name GameScene

var paused = false
const PAUSE_MENU = preload("res://scenes/game_elements/pause_menu.tscn")
var pause_menu = null

# Called when the node enters the scene tree for the first time.
func _input(event):
    if event.is_action_pressed("pause"):
        paused = !paused
        if paused:
            var menu = PAUSE_MENU.instantiate()
            add_child(menu)
            pause_menu = menu
        else:
            pause_menu.queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    if paused:
        pass
