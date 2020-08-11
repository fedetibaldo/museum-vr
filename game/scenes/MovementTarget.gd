extends Spatial

export var active_opacity = 1
export var idle_opacity = 0.1

func go_idle():
	$TargetAura.get_surface_material(0).set_shader_param("opacity", idle_opacity)

func go_active():
	$TargetAura.get_surface_material(0).set_shader_param("opacity", active_opacity)

func _ready(): go_idle()

func _on_TargetBody_mouse_entered(): go_active()

func _on_TargetBody_mouse_exited(): go_idle()
