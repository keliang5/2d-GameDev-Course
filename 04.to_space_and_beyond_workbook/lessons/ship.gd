extends Sprite2D

var max_speed := 1000.0
var velocity :=Vector2(0, 0)
var boost_speed := 2500.0
var normal_speed := 2000.0
var steering_factor := 12.0

func _process(delta: float) -> void:
	var direction := Vector2(0, 0)
	direction.x = Input.get_axis("move_left","move_right")
	direction.y = Input.get_axis("move_up","move_down")
	if Input.is_action_just_pressed("boost"):
		max_speed = boost_speed
		get_node("BoostTimer").start()
	
	if direction.length() > 1.0:
		direction = direction.normalized()
	
	var desired_velocity := max_speed * direction
	var steering_vector := desired_velocity - velocity
	velocity += steering_factor * steering_vector * delta
	position += velocity * delta
	if direction.length() > 0.0:
		rotation = velocity.angle()
	

func _on_boost_timer_timeout() -> void:
	max_speed = normal_speed
