extends "res://scenes/game_scenes/evidence.gd"

@onready var main_ui = $"../../UI/MainUI"

func _on_area_2d_input_event(viewport, event, shape_idx):
    if event is InputEventMouseButton:
        if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
            main_ui.toggle_phone()

