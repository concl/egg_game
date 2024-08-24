extends Node2D

class_name Character

const PATH = preload("res://scenes/characters/path.tres")
@onready var sprites = $Sprites
@onready var animation_player = $AnimationPlayer
var from
var to
var moving = false
var time_since = 0
var move_factor = 4
var focused = false
var current_pose = "default"
var poses: Dictionary
func _init():
    pass

func _ready():
    pass

func _process(delta):
    if moving:
        time_since += delta * move_factor
        if global_position.x == to:
            moving = false
            time_since = 0
            return
        global_position.x = from + (to - from) * PATH.sample(time_since)
        

func change_loc(pos):
    from = global_position.x
    to = pos
    moving = true

func focus():
    if not focused:
        animation_player.play("focus")
        focused = true

func unfocus():
    if focused:
        animation_player.play("unfocus")
        focused = false

func play_animation(animation_name):
    animation_player.play(animation_name)

func exit_scene():
    animation_player.play("exit")
    await animation_player.animation_finished
    queue_free()

func pose(name):
    poses[current_pose].visible = false
    poses[name].visible = true
    current_pose = name
    
    
    
