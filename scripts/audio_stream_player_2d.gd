extends AudioStreamPlayer2D
@onready var asmp: AudioStreamPlayer2D = $"."

func _ready():
	asmp.finished.connect(_on_audio_finished)

func _on_audio_finished():
	asmp.play()
