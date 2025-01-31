extends CharacterBody2D

@onready var target = $"../Player"
@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D
@onready var healthbar = $Healthbar
@onready var damage_numbers_origin = $DamageNumbersOrigin
@onready var hitbox = $CollisionShape2D
@onready var player = $"../Player"

var health = 10
var speed = 150
var active: bool = true
var rotation_speed = 5

func _ready():
	#on_dead = die
	healthbar.init_health(health)
	connect("body_entered", Callable(self, "_on_body_entered"))

func _set_health(value):
	#super._set_health(value)
	if health <=0:
		self.queue_free()
	healthbar.health = health

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
		
#func damage(hitbox: Hitbox):
	#var damage = hitbox.damage
	#var is_critical = hitbox.crit_chance > randf()
	#if is_critical:
		#damage *=2
	#DamageNumbers.display_number(damage, damage_numbers_origin.global_position, is_critical)
	#health -= damage
	#if damage:
		#hit_flash_anim_player.play("hit_flash")


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"): 
		print("Gegner berührt den Spieler!")
		player.died()


