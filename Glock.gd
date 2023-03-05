extends "res://PickableObject.gd"

func action():
	$m1911_finalFire/RootNode/AnimationPlayer.play("Fire")
	
	if $Aim.is_colliding():
		var what_did_we_hit = $Aim.get_collider()
		if what_did_we_hit.has_method("hit"):
			what_did_we_hit.hit($Aim.get_collision_point(), $Aim.get_collision_normal())
			print($Aim.get_collision_point())
			print($Aim.get_collision_normal())


func _process(_delta):
	if $Aim.is_colliding():
		var whatt_did_we_hit = $Aim.is_colliding()
		$Aim/TargetDot.global_transform.origin = $Aim.get_collision_point()
		$Aim/TargetDot.visible = true
	else:
		$Aim/TargetDot.visible = false
