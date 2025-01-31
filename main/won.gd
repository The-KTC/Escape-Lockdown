extends Node2D

@onready var textlabel = $Camera2D/textlabel
var storyline = [
"You have successfully escaped from the bunker!",
"But what you didn't know until now was why you were locked up in the first place...",
"The answer is clear:

You have had contact with a very contagious virus with a very high mortality rate from the mission.
You are unknowingly infected and humanity will die out because of you...."
]

#var textlabel: Label = null
var char_index = 0
var typing_speed = 3  # Höher = langsamer
var tmp = 0
var current_text = ""
var storylineTextNummer = 0

func _ready():
	tmp = typing_speed

func _process(delta):
	if storylineTextNummer >= storyline.size():
		# Wechsel zur Hauptszene, wenn alle Texte durchlaufen sind
		get_tree().change_scene_to_file("res://main/start_screen.tscn")
		return

	if char_index < storyline[storylineTextNummer].length():
		if tmp <= 0:
			current_text += storyline[storylineTextNummer][char_index]
			char_index += 1
			textlabel.text = current_text
			tmp = typing_speed
		else:
			tmp -= 1

func fade_in_node(node: Node, duration: float = 1.0):
	node.visible = true
	node.modulate.a = 0
	
	var tween = get_tree().create_tween()
	tween.tween_property(node, "modulate:a", 1.0, duration)

func _input(event):
	if event.is_action_pressed("left_mouse"):
		textlabel.text = ""
		current_text = ""
		char_index = 0
		storylineTextNummer += 1
		match storylineTextNummer:
			1:
				var man1 = get_node("Camera2D/man1")
				fade_in_node(man1, 1.5)
			2: 
				get_node("Camera2D/man1").visible = false
				
				var man2 = get_node("Camera2D/man2")
				fade_in_node(man2, 1.5)
			4:
				get_node("Camera2D/man2").visible = false
				get_node("Camera2D/man3").visible = true



