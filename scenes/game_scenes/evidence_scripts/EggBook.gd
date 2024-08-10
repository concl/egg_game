extends "res://scenes/game_scenes/evidence.gd"

# EggBook

@onready var transition_manager = $"../../TransitionManager"
@onready var main_ui = $"../../UI/MainUI"

var _been_clicked = false

func _on_area_2d_input_event(viewport, event, shape_idx):
    if event is InputEventMouseButton:
        if _been_clicked:
            if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
                main_ui.toggle_egg_book()
        else:
            _been_clicked = true
            # do other stuff
            
            if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
                main_ui.toggle_egg_book()

