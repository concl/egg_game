extends Node

signal transitioned(transition)
@onready var audio_stream_player = $AudioStreamPlayer
@onready var animation_player = $AnimationPlayer

func _ready():
    transitioned.emit("Asdf")

func play_music():
    audio_stream_player.play()

func fade_out():
    animation_player.play("FadeOut")

func fade_in():
    animation_player.play("FadeIn")

func _on_animation_player_animation_finished(anim_name):
    print("faded")
    transitioned.emit(anim_name)
