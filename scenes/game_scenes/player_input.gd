extends Node



const PAUSE_MENU = preload("res://scenes/game_elements/pause_menu.tscn")

func _unhandled_input(event):
    
    if event.is_action_just_pressed("pause"):
        var menu = PAUSE_MENU.instantiate()
        get_tree()
    
    pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass
