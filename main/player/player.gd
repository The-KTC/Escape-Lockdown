extends CharacterBody2D
var life = 10
@export var MAX_SPEED = 300
@export var ACCELERATION = 1500
@export var FRICTION = 1200
@onready var axis = Vector2.ZERO
@onready var light = $PointLight2D


func _ready() -> void:
	add_to_group("player")
	
func _physics_process(delta):
	move(delta)
	var mouse_pos = get_global_mouse_position()
	var direction = (mouse_pos-global_position).normalized()
	rotation = direction.angle()-deg_to_rad(90)

func get_input_axis():
	axis.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	axis.y = int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))
	return axis.normalized()
	
func move(delta):
	axis = get_input_axis()
	if Input.is_action_pressed("shift"):
		#axis*=2
		MAX_SPEED = 450
	else:
		MAX_SPEED = 300
	if axis==Vector2.ZERO:
		apply_friction(FRICTION * delta)
	else:
		apply_movement(axis * ACCELERATION *delta)
	move_and_slide()

func apply_friction(amount):
	if velocity.length() > amount:
		velocity -= velocity.normalized() * amount
	else:
		velocity = Vector2.ZERO
		
func apply_movement(accel):
	velocity += accel
	velocity = velocity.limit_length(MAX_SPEED)


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("right_mouse"):
		light.enabled = !light.enabled
	
func died():
	$died.visible = true
	$"..".player_die()
