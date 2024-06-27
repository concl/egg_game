extends Node2D

class_name Character

@onready var animation_player = $AnimationPlayer

func _init():
    pass

func _ready():
    animation_player.play("enter")
    
func change_loc():
    pass

