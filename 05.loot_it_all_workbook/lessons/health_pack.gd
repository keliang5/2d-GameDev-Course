extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_entered.connect(_on_area_entered)
	play_floating_animation()
	
func play_floating_animation() -> void:
	var tween := create_tween()
	var sprite_2d := get_node("Sprite2D")
	var position_offset := Vector2(0.0, 4.0)
	var duration = randf_range(0.8, 1.2)
	tween.tween_property(sprite_2d, "position", position_offset, duration)
	tween.tween_property(sprite_2d, "position", -1.0 * position_offset, duration)
	tween.set_loops()
	tween.set_trans(Tween.TRANS_SINE)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_entered(area: Area2D) -> void:
	queue_free()
