extends Control

@onready var drawing_canvas: TextureRect = $DrawingElement/DrawingCanvas


func play_dialogue():
    State.start_dialogue("res://dialogue/script/scenes_chinese.dialogue", "page_5_dialogue")

func win():
    State.start_dialogue("res://dialogue/script/scenes_chinese.dialogue", "page_5_win")

func _on_save_button_pressed() -> void:
    drawing_canvas.save_drawing("second.png")
    win()
