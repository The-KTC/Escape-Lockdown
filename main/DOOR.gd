extends Area2D



func _on_body_entered(body: Node) -> void:
	#print("Ein Körper ist eingetreten: ", body.name)
	pass

func _on_body_exited(body: Node) -> void:
	#print("Ein Körper hat den Bereich verlassen: ", body.name)
	pass

func _on_main_door_tree_entered() -> void:
	print("AAAAAAAAAA")
func _on_main_door_tree_exited() -> void:
	print("BBBBBBBBBBB")
func _on_main_door_child_entered_tree(node: Node) -> void:
	print("CCCCCCCCCC")
func _on_main_door_child_exiting_tree(node: Node) -> void:
	print("DDDD")
func _on_main_door_child_order_changed() -> void:
	print("EEEE")
func _on_main_door_tree_exiting() -> void:
	print("FFFFFF")


func _on_collision_shape_2d_child_entered_tree(node: Node) -> void:
	print("GGGGGGG")
