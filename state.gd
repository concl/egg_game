extends Node

# save stuff
var _load_save = false

var input_enabled = true

# array of changes: each element represents a change for the displayed characters
var changes: Array
var test = null
var phase = 0

# first page of the book
var correct_order = [4,3,2,5,1]
var first_book_page_solved = false

# second page of the book
var inventory = []
var total_items_page_2 = 5
var correct_valuable_items = {
    "Footsteps": null,
    "EggBlanket": null,
    "Phone": null
}
var second_book_page_solved = false

# func _ready():
    # if _load_save:
        # load_save("nu")
# func load_save(save):
    # pass

# Function to load and play a sound file
func play_sound(file_path: String):
    # Create an AudioStreamPlayer instance
    var audio_player = AudioStreamPlayer.new()
    # Add it to the scene tree
    add_child(audio_player)
    # Load the sound file
    var audio_stream = load(file_path)
    if audio_stream is AudioStream:
        # Assign the audio stream to the player
        audio_player.stream = audio_stream
        audio_player.play()
        await audio_player.finished
        # Remove and free the audio player node
        audio_player.queue_free()
    else:
        print("Error: Could not load the audio file")

func apply_grayscale_shader_to_texture(texture: Texture2D) -> ShaderMaterial:
    var grayscale_shader_code = """
    shader_type canvas_item;

    void fragment() {
        vec4 tex_color = texture(TEXTURE, UV);
        float gray = dot(tex_color.rgb, vec3(0.299, 0.587, 0.114));
        COLOR = vec4(gray, gray, gray, tex_color.a);
    }
    """
    
    # Create the shader
    var shader = Shader.new()
    shader.code = grayscale_shader_code
    
    # Create the ShaderMaterial and assign the shader to it
    var shader_material = ShaderMaterial.new()
    shader_material.shader = shader
    
    # Create a new Sprite and apply the ShaderMaterial
    var sprite = Sprite2D.new()
    sprite.texture = texture
    sprite.material = shader_material
    
    return shader_material
