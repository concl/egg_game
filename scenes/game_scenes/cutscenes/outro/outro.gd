extends Control

@onready var video_stream_player: VideoStreamPlayer = $VideoStreamPlayer
const MAIN_MENU = preload("res://scenes/main_menu.tscn")
const OUTRO = preload("res://assets/outro.ogv")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    video_stream_player.stream = OUTRO
    video_stream_player.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    pass


func _on_video_stream_player_finished() -> void:
    get_tree().change_scene_to_packed(MAIN_MENU)
