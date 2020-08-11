extends ARVRController

var ray : RayCast = null
var current_collider : StaticBody = null

# Called when the node enters the scene tree for the first time.
func _ready():
	ray = $RayCast

func _process(delta):
	if ray.is_enabled() and ray.is_colliding():
		var new_collider : StaticBody = ray.get_collider()
		if new_collider != current_collider:
			new_collider.emit_signal("mouse_entered")
			if current_collider:
				current_collider.emit_signal("mouse_exited")
		current_collider = new_collider
	elif current_collider:
		current_collider.emit_signal("mouse_exited")
		current_collider = null
