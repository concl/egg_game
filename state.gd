extends Node

# save stuff
var load_save = false

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
var second_book_page_solved = false


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

