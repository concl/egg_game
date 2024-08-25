extends Control


func _on_egg_book_choice_pressed() -> void:
    State.start_dialogue("res://dialogue/script/scenes_chinese.dialogue", "egg_book_choice")

func _on_marriage_choice_pressed() -> void:
    State.start_dialogue("res://dialogue/script/scenes_chinese.dialogue", "marriage_choice")


func _on_portrait_choice_pressed() -> void:
    State.start_dialogue("res://dialogue/script/scenes_chinese.dialogue", "portrait_choice")


func _on_breakfast_choice_pressed() -> void:
    State.start_dialogue("res://dialogue/script/scenes_chinese.dialogue", "breakfast_choice")
