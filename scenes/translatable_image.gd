extends Control

@export var is_chinese: bool

func _ready():
    if State._language == "chinese":
        if is_chinese:
            show()
        else:
            hide()
    else:
        if is_chinese:
            hide()
        else:
            show()

func change_language_chinese():
    if is_chinese:
        show()
    else:
        hide()


func change_language_english():
    if is_chinese:
        hide()
    else:
        show()
