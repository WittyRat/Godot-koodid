extends Node2D

func _process(_delta):
	if Input.is_action_just_pressed("edasi"):
		get_tree().change_scene("res://Main.tscn")
