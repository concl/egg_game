extends Node

signal transitioned(transition)
@onready var audio_stream_player = $AudioStreamPlayer
@onready var animation_player = $AnimationPlayer

func _ready():
    pass

func change_music(file):
    audio_stream_player.stream = load(file)
    audio_stream_player.play()

func play_music():
    audio_stream_player.play()

func fade_out():
    animation_player.play("FadeOut")

func fade_in():
    animation_player.play("FadeIn")

func camera_click():
    animation_player.stop()
    animation_player.play("CameraClick")

func mute_audio():
    animation_player.play("mute_audio")

func return_audio():
    animation_player.play("return_audio")
    audio_stream_player.play()

func _on_animation_player_animation_finished(anim_name):
    transitioned.emit(anim_name)
