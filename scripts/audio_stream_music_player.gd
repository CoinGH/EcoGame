extends AudioStreamPlayer
@onready var asmp: AudioStreamPlayer = $"."

func _ready():
	asmp.finished.connect(_on_audio_finished)

func _on_audio_finished():
	asmp.play()
