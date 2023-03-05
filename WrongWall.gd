extends StaticBody

func _process(delta):
	var packed_scene = load("res://PickableObject.tscn")
	var scene_instance = packed_scene.instance()
	var aim = scene_instance.get_node("Aim")
	#print(aim.is_colliding())
	if aim and aim.is_colliding():
		var collider = aim.get_collider()
		if collider is StaticBody and collider.name == "WrongWall":
			print("Collided with wall!")

