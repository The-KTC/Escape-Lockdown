extends Area2D



func _on_body_entered(body: Node) -> void:
	#print("Ein Körper ist eingetreten: ", body.name)
	pass

func _on_body_exited(body: Node) -> void:
	#print("Ein Körper hat den Bereich verlassen: ", body.name)
	pass
