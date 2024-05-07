extends Area2D

@onready var flame: Sprite2D = $Flame

func toggle_flame_visibility() -> void:
	flame.visible = not flame.visible

func _ready() -> void:
	# This parameter of the shader material gives each flame a slightly different look and randomized animation.
	flame.material.set("shader_parameter/offset", global_position * 0.1)

func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	var event_is_mouse_click: bool = (
		event is InputEventMouseButton and
		event.button_index == MOUSE_BUTTON_LEFT and
		event.is_pressed()
		)
	if event_is_mouse_click:
		toggle_flame_visibility()
