extends Control

@onready var video_stream_player: VideoStreamPlayer = $VideoStreamPlayer
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
const ENGLISH_AUDIO = preload("res://assets/english_audio.mp3")
const ENGLISH_VIDEO = preload("res://assets/english_video.ogv")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    
    if State._language == "english":
        video_stream_player.stream = ENGLISH_VIDEO
        audio_stream_player.stream = ENGLISH_AUDIO
    video_stream_player.play()
    audio_stream_player.play()
        
    


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    pass
