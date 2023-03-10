extends RigidBody

onready var original_parent = get_parent()
onready var original_collision_mask = collision_mask
onready var original_collision_layer = collision_layer


var picked_up_by = null

func pick_up(by):
	if picked_up_by == by:
		return
		
	if picked_up_by:
		let_go()
	
	picked_up_by = by
	
	mode = RigidBody.MODE_STATIC
	collision_layer = 0
	collision_mask = 0
	
	original_parent.remove_child(self)
	picked_up_by.add_child(self)
	
	transform = Transform()
	
	
	
func let_go(impulse = Vector3(0.0, 0.0, 0.0)):
	if picked_up_by:
		var t = global_transform
		
		picked_up_by.remove_child(self)
		original_parent.add_child(self)
		
		global_transform = t
		mode = RigidBody.MODE_RIGID
		collision_mask = original_collision_mask
		collision_layer = original_collision_layer
		apply_impulse(Vector3(0.0, 0.0, 0.0), impulse)
		
		picked_up_by = null
		
func _ready():
	original_collision_layer = collision_layer
	original_collision_mask = collision_mask		
		
		
	pass
		
