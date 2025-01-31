extends Area2D
@onready var schwarz = $"/root/MainGame/CanvasLayer/ColorRect"
@onready var escape_label = $"/root/MainGame/CanvasLayer/won"

var eintritt = 1

func _ready() -> void:
	schwarz.modulate = Color(0, 0, 0, 0)
	#escape_label.modulate.a = 0
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body: Node) -> void:
	if eintritt <= 0:
		start_fade_out()
	eintritt -= 1
	

func start_fade_out():
	var tween = get_tree().create_tween()
	print("You won!")
	fade_in_node(schwarz, 1.5)
	fade_in_node(escape_label, 0.5)
	await get_tree().create_timer(2.0).timeout
	get_tree().change_scene_to_file("res://main/won.tscn")


func fade_in_node(node: Node, duration: float = 1.0):
	node.visible = true
	node.modulate.a = 0
	var tween = get_tree().create_tween()
	tween.tween_property(node, "modulate:a", 1.0, duration)
