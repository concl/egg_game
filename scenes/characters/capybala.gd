
extends Character

@onready var nervous = $Nervous
@onready var default = $Default

var test = 0
var current_expression = "Default"
var conv = {
    "Default": default,
    "Nervous": nervous
}

# Called when the node enters the scene tree for the first time.
func _ready():
    super()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    print('asdf')
    if test == 30:
        return
    print(global_position)
    test += 1

func set_expression(name):
    
    conv[current_expression].visible = false
    conv[name].visible = true
    current_expression = name
    
