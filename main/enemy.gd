extends CharacterBody2D

@onready var target = $"../Player"
@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D
var speed = 150
var active: bool = true
var rotation_speed = 5

func _physics_process(delta):
	if active:
		navigation_agent.target_position = target.global_position
		var next_path_pos := navigation_agent.get_next_path_position()
		var direction := global_position.direction_to(next_path_pos)
		#rotation = direction.angle() - deg_to_rad(90) # a bit buggy
		var target_angle = direction.angle() -deg_to_rad(90) 
		rotation = lerp_angle(rotation, target_angle, rotation_speed * delta)
		velocity = direction * speed
		move_and_slide()
	else:
		velocity = Vector2.ZERO
