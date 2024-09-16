extends CanvasLayer

var char_names = {
    "Capybala": preload("res://scenes/characters/capybala.tscn"),
    "Eggspert": preload("res://scenes/characters/eggspert.tscn"),
    "Owlivia": preload("res://scenes/characters/mrs_owlivia.tscn"),
    "Rabbit": preload("res://scenes/characters/rapper_rabbit.tscn"),
    "Op": preload("res://scenes/characters/op.tscn"),
    "Goose": preload("res://scenes/characters/nanny_goose.tscn")
}

var dimensions: Vector2
var characters = []
var char_obs = []

# Called when the node enters the scene tree for the first time.
func _ready():
    dimensions = get_viewport().get_visible_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass

func _process_changes():
    var changes = State.changes
    State.changes = []
    
    # mutate list / play animations
    for x in changes:
        name = x["name"]
        if name == "AddCharacter":
            characters.append(x["character"])
            var new_char = char_names[x["character"]].instantiate()
            add_child(new_char)
            new_char.global_position.y = dimensions.y
            char_obs.append(new_char)
            if "state" in x:
                var enter_state = x["state"]
                if enter_state == "Default":
                    new_char.play_animation("enter")
                elif enter_state == "Focus":
                    for other_guys in char_obs:
                        other_guys.unfocus()
                    new_char.play_animation("enter_focus")
                    new_char.focused = true
            else:
                new_char.play_animation("enter")
            
        elif name == "MoveCharacter":
            var position = characters.find(x["character"])
            var moving = characters.pop_at(position)
            characters.insert(x["position"], moving)
            
            var ob = char_obs.pop_at(position)
            char_obs.insert(x["position"], ob)
            
        elif name == "PlayAnimation":
            var position = characters.find(x["character"])
            
            if x["animation_name"] == "focus":
                for other_guys in char_obs:
                    other_guys.unfocus()
                char_obs[position].focus()
            elif x["animation_name"] == "unfocus":
                char_obs[position].unfocus()
            else:
                char_obs[position].play_animation(x["animation_name"])
        
        elif name == "RemoveCharacter":
            var position = characters.find(x["character"])
            char_obs[position].exit_scene()
            char_obs.pop_at(position)
        
        elif name == "Pose":
            var position = characters.find(x["character"])
            char_obs[position].pose(x["pose"])
    
    # handle changed positions
    var length = dimensions.x
    var n = char_obs.size()
    for i in range(n):
        char_obs[i].change_loc((i + 1) * length / (n + 1))
        
