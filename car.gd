extends CharacterBody2D

var wheel_base = 70  # Distance from front to rear wheel
var steering_angle = 15  # Amount that front wheel turns, in degrees

var steer_direction

func _physics_process(delta):
	get_input()
	calculate_steering(delta)
	move_and_slide()
func get_input():
	var turn = Input.get_axis("steer_left", "steer_right")
	steer_direction = turn * deg_to_rad(steering_angle)
	velocity = Vector2.ZERO
	if Input.is_action_pressed("accelerate"):
		velocity = transform.x * 500
func calculate_steering(delta):
	# 1. Find the wheel positions
	var rear_wheel = position - transform.x * wheel_base / 2.0
	var front_wheel = position + transform.x * wheel_base / 2.0
	# 2. Move the wheels forward
	rear_wheel += velocity * delta
	front_wheel += velocity.rotated(steer_direction) * delta
	# 3. Find the new direction vector
	var new_heading = rear_wheel.direction_to(front_wheel)
	# 4. Set the velocity and rotation to the new direction
	velocity = new_heading * velocity.length()
	rotation = new_heading.angle()
