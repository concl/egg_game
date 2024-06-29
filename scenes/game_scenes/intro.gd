extends Node2D

@onready var transition_manager = $TransitionManager
const TextBalloon = preload("res://dialogue/balloon.tscn")

var done = false
# Called when the node enters the scene tree for the first time.
func _ready():
    transition_manager.fade_in()
    var wait_time = Timer.new()
    wait_time.wait_time = 1.0
    wait_time.one_shot = true
    add_child(wait_time)
    wait_time.start()
    await wait_time.timeout
    wait_time.queue_free()
    
    var balloon = TextBalloon.instantiate()
    get_tree().current_scene.add_child(balloon)
    balloon.next_message.connect(_on_next_message)
    balloon.start(load("res://dialogue/test.dialogue"),"")
    

func _process(delta):
    if State.phase != 0 and !done:
        done = true
        transition_manager.fade_out()
        await transition_manager.transitioned
        get_tree().change_scene_to_file("res://scenes/game_scenes/main_scene.tscn")

func _on_next_message():
    pass
