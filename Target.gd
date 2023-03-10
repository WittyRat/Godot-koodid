extends StaticBody

var vp_material

#func reset_target():
#	$Viewport/Background.visible = true
#	$Viewport/BulletHole.visible = false
#	$Viewport.render_target_update_mode = Viewport.UPDATE_ONCE

func hit(p_at, p_direction = Vector3()):
	var t = global_transform
	var at = t.xform_inv(p_at)	
	
	# 3D koordinaatide muutmine 2Dks
	at.x = (0.5 + (at.x / 1.0)) * 512.0
	at.y = (0.5 - (at.y / 2.0)) * 1024.0
	
	# Kuuliaukude positsioneerimine
	$Viewport/BulletHole.rect_position = Vector2(at.x - 32.0, at.y - 32.0)
	
	# Kuuliaukude renderdamine
	$Viewport/Background.visible = false
	$Viewport/BulletHole.visible = true
	$Viewport.render_target_update_mode = Viewport.UPDATE_ONCE

func _ready():
	vp_material = SpatialMaterial.new()
	vp_material.albedo_texture = $Viewport.get_texture()
	$MeshInstance.material_override = vp_material
