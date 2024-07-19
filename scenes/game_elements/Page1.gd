extends Control

const BALLOON = preload("res://dialogue/balloon.tscn")
@onready var first = $First
@onready var second = $Second
@onready var third = $Third
@onready var fourth = $Fourth
@onready var fifth = $Fifth


func _can_drop_data(at_position, data):
    return data[0] is Texture2D

func _drop_data(at_position, data):
    data[1].glow.self_modulate = 0
    

var order = [1,2,3,4,5]
var do_once = true

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    if order == State.correct_order and do_once:
        do_once = false
        var ball = BALLOON.instantiate()
        get_tree().current_scene.add_child(ball)
        ball.start(load("res://dialogue/script/test/testwin.dialogue"),"this_is_a_node_title")
        disable_ui_for_all_children(self)


# Function to disable UI response for all children
func disable_ui_for_all_children(parent: Node):
    for child in parent.get_children():
        if child is Control:
            child.mouse_filter = Control.MOUSE_FILTER_IGNORE
        # Recursively call the function for children of the current child
        disable_ui_for_all_children(child)
