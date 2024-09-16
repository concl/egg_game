extends Node


@export var chinese_text: String
@export var english_text: String


func change_language_chinese():
    self.text = chinese_text


func change_language_english():
    self.text = english_text
