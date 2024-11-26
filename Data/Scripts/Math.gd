extends Node
class_name Math

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

static func ExpDecay(a,b,decay,dt):
	if typeof(a)==TYPE_BASIS:
		var result = Basis.IDENTITY
		result.x = ExpDecay(a.x,b.x,decay,dt)
		result.y = ExpDecay(a.y,b.y,decay,dt)
		result.z = ExpDecay(a.z,b.z,decay,dt)
		return result.orthonormalized()
	return b+(a-b)*exp(-decay*dt)


static func ExpDecayAngle(a, b, decay:float, dt:float):
	var result
	if typeof(a)==TYPE_VECTOR3:
		a.x=ExpDecayAngle(a.x,b.x,decay,dt)
		a.y=ExpDecayAngle(a.y,b.y,decay,dt)
		a.z=ExpDecayAngle(a.z,b.z,decay,dt)
		result = a
	else:
		result = b + (fmod(2.0 * fmod(a - b, TAU),TAU) - fmod(a - b, TAU)) * exp(-decay *dt)
	return result
