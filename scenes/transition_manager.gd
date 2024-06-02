extends Node

signal transitioned(transition)

@onready var animation_player = $AnimationPlayer

func fade_out():
    animation_player.play("FadeOut")

func fade_in():
    animation_player.play("FadeOut", -1, -1, true)

func _on_animation_player_animation_finished(anim_name):
    transitioned.emit(anim_name)
