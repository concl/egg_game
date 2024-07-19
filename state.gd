extends Node

var input_enabled = true

# array of changes: each element represents a change for the displayed characters
var changes: Array
var test = null
var phase = 0

var correct_order = [2,3,4,5,1]
var book_solved = false

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

