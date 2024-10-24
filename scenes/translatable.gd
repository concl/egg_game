extends Node


@export var chinese_text: String
@export var english_text: String

func _ready():
    if State._language == "chinese":
        self.text = chinese_text
    else:
        self.text = english_text

func change_language_chinese():
    self.text = chinese_text


func change_language_english():
    self.text = english_text
