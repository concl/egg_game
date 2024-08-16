extends "res://scenes/game_scenes/evidence.gd"

@onready var transition_manager = $"../../TransitionManager"
@onready var main_ui = $"../../UI/MainUI"
const BREAKFAST = preload("res://scenes/game_scenes/photo_popups/breakfast.tscn")

func _on_area_2d_input_event(viewport, event, shape_idx):
    if not State.first_book_page_solved:
        return
    if event is InputEventMouseButton:
        if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
            main_ui.add_evidence_item("Breakfast")
            transition_manager.camera_click()
            
            var thing = BREAKFAST.instantiate()
            get_tree().current_scene.add_child(thing)
            State.play_sound("res://assets/sounds/effects/camera_click.mp3")
            queue_free()