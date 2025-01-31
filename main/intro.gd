extends Node2D

@onready var textlabel = $Camera2D/textlabel
var storyline = [
	"Hello players.
	This game was created alongside my internship and my university exams, so unfortunately not all features have been implemented.                                                                         
	(Press left mouse button to continue)",
	"This is Max.             
	He belonged to the Airborne Delta Force.",
	"A few days ago, he had a secret mission in a biological weapons laboratory in Vladivostok.                                              
	The mission did not go according to plan - an explosion caused him to fall unconscious and he is now waking up in a bunker.",
	"He has 120 seconds to break out.        
	A blackout has just occurred, which is why all the lights are switched off and all the doors are open.                                              
	Luckily he has found a light..."
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
		get_tree().change_scene_to_file("res://main/main_game.tscn")
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
			3: 
				get_node("Camera2D/man1").visible = false
				get_node("Camera2D/man2").visible = true
			4:
				get_node("Camera2D/man2").visible = false
				get_node("Camera2D/man3").visible = true



