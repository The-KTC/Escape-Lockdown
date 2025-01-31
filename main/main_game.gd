extends Node2D

@onready var timer: Timer = $Timer/Timer
@onready var timer_label: Label = $Timer/TimerLabel
var time_left = 120

func _ready():
	timer.start()
	update_timer_label()

func _process(delta: float):
	time_left = int(timer.time_left)
	update_timer_label()

func update_timer_label():
	var minutes = time_left/60
	var seconds =time_left%60
	timer_label.text= "%02d:%02d" % [minutes, seconds]
	

func player_die():
	print("OOOH, NOOO..! You're dead LoL")
	get_tree().reload_current_scene() #neuladen

func _on_timer_timeout() -> void:
	player_die()
