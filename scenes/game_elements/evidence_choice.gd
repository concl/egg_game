extends Control


func _on_egg_book_choice_pressed() -> void:
    State.start_dialogue("scenes", "egg_book_choice")

func _on_marriage_choice_pressed() -> void:
    State.start_dialogue("scenes", "marriage_choice")


func _on_portrait_choice_pressed() -> void:
    State.start_dialogue("scenes", "portrait_choice")


func _on_breakfast_choice_pressed() -> void:
    State.start_dialogue("scenes", "breakfast_choice")
