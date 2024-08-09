extends CanvasLayer

@onready var animation_player = $AnimationPlayer
@onready var label = $Label
@export var text: String
@export var tick_time: float = 0.2 # in seconds
@export var autostart: bool = false
@export var centered: bool = true

signal end_click
signal ended

var _is_typing = false
var _time_before_tick: float
var _text_index = 0
var _horizontal_position
var finished = false

func _unhandled_input(event):
    # if the user left clicks when the text is finished
    if event is InputEventMouseButton and event.pressed:
        if finished:
            finished = false
            end_click.emit()
        elif _is_typing:
            label.text = text
            ended.emit()
            finished = true
            _is_typing = false

# Called when the node enters the scene tree for the first time.
func _ready():
    label.text = ""
    label.size[0] = 0
    _horizontal_position = label.position[0]
    if autostart:
        start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    
    if _is_typing:
        _time_before_tick -= delta
        if _time_before_tick <= 0:
            tick()
    
    if centered:
        var hsize = label.size[0]
        label.position[0] = _horizontal_position - hsize/2


func start():
    _is_typing = true
    _time_before_tick = tick_time    


func tick():
    _time_before_tick = tick_time
    if _text_index < text.length():
        label.text += text[_text_index]
        _text_index += 1
        if centered:
            var hsize = label.size[0]
            label.position[0] = _horizontal_position - hsize/2
    else:
        ended.emit()
        finished = true
        _is_typing = false

func exit_scene():
    # play fade out animation then queue free using await
    animation_player.play("fade_out")
    await animation_player.animation_finished
    queue_free()
