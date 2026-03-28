extends CanvasLayer

@onready var label: RichTextLabel = $RichTextLabel
@onready var color_rect: ColorRect = $ColorRect

func appear() -> void:
	label.modulate.a = 0.0
	color_rect.modulate.a = 0.0
	var tween = create_tween()
	tween.tween_interval(1.5)
	tween.tween_property(label, "modulate:a", 1.0, 2.0)
	tween.parallel().tween_property(color_rect, "modulate:a", 1.0, 2.0)
	tween.tween_interval(2.5)
	tween.tween_property(label, "modulate:a", 0.0, 2.0)
	tween.parallel().tween_property(color_rect, "modulate:a", 0.0, 2.0)
	await tween.finished
	queue_free()
