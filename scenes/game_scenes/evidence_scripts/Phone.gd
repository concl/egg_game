extends "res://scenes/game_scenes/evidence.gd"

@onready var transition_manager = $"../../../TransitionManager"
@onready var main_ui = $"../../../UI/MainUI"

var _dialogue_shown = false

func _on_area_2d_input_event(viewport, event, shape_idx):
    if not State.first_book_page_solved:
        return
    
    if event is InputEventMouseButton:
        if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
            if !_dialogue_shown:
                _dialogue_shown = true
                main_ui.add_evidence_item("Phone")
                transition_manager.camera_click()
                State.play_sound("res://assets/sounds/effects/camera_click.mp3")
                State.start_dialogue("evidence_search","Phone")
            main_ui.toggle_phone()
