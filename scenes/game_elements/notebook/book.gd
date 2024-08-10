extends Control

var page_number = 0
@onready var pages = [$Page1, $Page2, $Page3, $Page4, $Page5, $Page6]
@onready var page2_container = $Page2/NotValuable/GridContainer

# evidence item name to object
var evidence_items = {
    "Basket": preload("res://scenes/game_elements/notebook/Page2/evidence_pictures/basket.tscn"),
    "EggBlanket": preload("res://scenes/game_elements/notebook/Page2/evidence_pictures/egg_blanket.tscn"),
    "Footsteps": preload("res://scenes/game_elements/notebook/Page2/evidence_pictures/footsteps.tscn"),
    "Phone": preload("res://scenes/game_elements/notebook/Page2/evidence_pictures/phone_evidence.tscn"),
    "Breakfast": preload("res://scenes/game_elements/notebook/Page2/evidence_pictures/breakfast.tscn"),
    "EggBook": null,
    "Marriage": null,
    "Portrait": null
}

# Called when the node enters the scene tree for the first time.
func _ready():
    pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass

func next_page():
    if page_number == len(pages):
        return
    pages[page_number].visible = false
    pages[page_number + 1].visible = true
    page_number += 1

func prev_page():
    if page_number == 0:
        return
    pages[page_number].visible = false
    pages[page_number - 1].visible = true
    page_number -= 1

func add_evidence_item(item_name):
    var new_item = evidence_items[item_name].instantiate()
    page2_container.add_child(new_item)
    pages[1].not_valuable_items[item_name] = null

