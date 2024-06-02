extends Node2D

const TextBalloon = preload("res://dialogue/balloon.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
    var balloon = TextBalloon.instantiate()
    get_tree().current_scene.add_child(balloon)
    balloon.start(load("res://dialogue/test.dialogue"),"")

func _process(delta):
    if State.phase != 0:
        get_tree().change_scene_to_file("res://scenes/game_scenes/main_scene.tscn")
