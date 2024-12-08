extends RigidBody2D

@export var speed = 10

func _physics_process(delta: float) -> void:
	moving()
	
func moving():
	if Input.is_action_pressed("ui_left"):
		$"前轮".angular_velocity += speed
		$"后轮".angular_velocity += speed
	if Input.is_action_pressed("ui_right"):
		$"前轮".angular_velocity -= speed
		$"后轮".angular_velocity -= speed
