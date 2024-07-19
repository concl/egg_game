
extends Control

@onready var glow = $glow
@onready var texture_rect = $glow/TextureRect
var texture
var num = 1

func _ready():
     texture = texture_rect.texture

func _get_drag_data(at_position):
    
    var preview_texture = TextureRect.new()
 
    preview_texture.texture = texture
    preview_texture.expand_mode = 1
    preview_texture.size = Vector2(200,200)
 
    var preview = Control.new()
    preview.add_child(preview_texture)
    
    set_drag_preview(preview)
    glow.self_modulate = 0xffffffff
    
    return [texture, self]
 
 
func _can_drop_data(_pos, data):
    return data[0] is Texture2D
 
 
func _drop_data(_pos, data):
    data[1].glow.self_modulate = 0
    animate_swap(data[1])
    
    
    var f = get_parent().order.find(num)
    var g = get_parent().order.find(data[1].num)
    var temp = get_parent().order[f]
    get_parent().order[f] = get_parent().order[g]
    get_parent().order[g] = temp

var swap_duration: float = 1.0 # Duration of the swap animation in seconds
var swap_steps: int = 60 # Number of steps in the animation (frames)

# Function to animate swapping positions
func animate_swap(other_node):
    # Ensure the other node is valid
    if not other_node:
        print("Invalid node passed to animate_swap")
        return

    # Get the starting positions
    var start_pos_self = self.position
    var start_pos_other = other_node.position

    # Start the animation coroutine
    start_swap_animation(start_pos_self, start_pos_other, other_node)

# Coroutine to perform the swap animation
@rpc
func start_swap_animation(start_pos_self: Vector2, start_pos_other: Vector2, other_node):
    var delta_self = (start_pos_other - start_pos_self) / swap_steps
    var delta_other = (start_pos_self - start_pos_other) / swap_steps

    for i in range(swap_steps):
        self.position += delta_self
        other_node.position += delta_other
        await get_tree().create_timer(swap_duration / swap_steps).timeout

    # Ensure final positions are exactly swapped
    self.position = start_pos_other
    other_node.position = start_pos_self
