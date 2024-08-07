extends Control

@onready var valuable = $Valuable
@onready var not_valuable = $NotValuable
@onready var next_page = $NextPage

var solved = false

var items_found = 0
var valuable_items = {}
var not_valuable_items = {}


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass

func check_win():
    if items_found == State.total_items_page_2:
        pass


