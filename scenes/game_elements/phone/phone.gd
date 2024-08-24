extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var play_button: TextureButton = $Music/PlayButton
@onready var progress_bar: HSlider = $Music/ProgressBar
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

const PHONE_PAUSE_BUTTON = preload("res://assets/images/evidence_images/phone/phone_pause_button.png")
const PHONE_PLAY_BUTTON = preload("res://assets/images/evidence_images/phone/phone_play_button.png")

var homescreen = false
var chat_open = false
var images_open = false
var music_open = false

var rap_dialogue = false

func _ready():
    open_homescreen()

func open_homescreen():
    animation_player.play("homescreen")
    homescreen = true

func open_chat():
    animation_player.play("open_chat")
    chat_open = true
    

func close_chat():
    animation_player.play("close_chat")
    chat_open = false
    
func open_images():
    animation_player.play("open_images")
    images_open = true

func close_images():
    animation_player.play("close_images")
    images_open = false

func open_music():
    if not rap_dialogue:
        State.start_dialogue("res://dialogue/script/scenes_chinese.dialogue", "rap_dialogue")
    
    animation_player.play("open_music")
    music_open = true
    
func close_music():
 
    animation_player.play("close_music")
    music_open = false
    
    if not rap_dialogue:
        await animation_player.animation_finished
        rap_dialogue = true
        State.start_dialogue("res://dialogue/script/scenes_chinese.dialogue", "rap_dialogue_2")

func _on_home_button_pressed() -> void:
    if chat_open:
        close_chat()
    
    if images_open:
        close_images()
    
    if music_open:
        paused = true
        audio_stream_player.stop()
        play_button.texture_normal = PHONE_PLAY_BUTTON
        close_music()


var dragging = false
var paused = true

# only used for progress bar of music
func _process(delta: float) -> void:
    if not paused and not dragging:
        var song_length = audio_stream_player.stream.get_length()
        progress_bar.value = audio_stream_player.get_playback_position() / song_length * 100

func _on_play_button_pressed() -> void:
    var song_length = audio_stream_player.stream.get_length()
    var position = progress_bar.value / 100 * song_length
    paused = not paused
    if not paused:
        audio_stream_player.play(position)
        play_button.texture_normal = PHONE_PAUSE_BUTTON
    else:
        audio_stream_player.stop()
        play_button.texture_normal = PHONE_PLAY_BUTTON

func _on_progress_bar_drag_ended(value_changed: bool) -> void:
    
    dragging = false
    if not paused:
        var song_length = audio_stream_player.stream.get_length()
        var position = progress_bar.value / 100 * song_length

        audio_stream_player.play(position)


func _on_progress_bar_drag_started() -> void:
    dragging = true
    audio_stream_player.stop()
