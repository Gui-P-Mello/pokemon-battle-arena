# A specialized steering agent that updates itself every frame so the user does
# not have to using a RigidBody3D
# @category - Specialized agents
extends GSAISpecializedAgent
class_name GSAIRigidBody3DAgent

# The RigidBody3D to keep track of
var body: RigidBody3D : set = _set_body

var _last_position: Vector3
var _body_ref: WeakRef


func _init(_body: RigidBody3D) -> void:
	if not _body.is_inside_tree():
		await _body.ready
	self.body = _body

	_body.get_tree().physics_frame.connect(_on_SceneTree_physics_frame)


# Moves the agent's `body` by target `acceleration`.
# @tags - virtual
func _apply_steering(acceleration: GSAITargetAcceleration, _delta: float) -> void:
	var _body: RigidBody3D = _body_ref.get_ref()
	if not _body:
		return
	
	_applied_steering = true
	_body.apply_central_impulse(acceleration.linear)
	_body.apply_torque_impulse(Vector3.UP * acceleration.angular)
	
	if calculate_velocities:
		linear_velocity = _body.linear_velocity
		angular_velocity = _body.angular_velocity.y


func _set_body(value: RigidBody3D) -> void:
	body = value
	_body_ref = weakref(value)

	_last_position = value.global_position
	_last_orientation = value.rotation.y

	position = _last_position
	orientation = _last_orientation


func _on_SceneTree_physics_frame() -> void:
	var _body: RigidBody3D = _body_ref.get_ref()
	if not _body:
		return
	
	var current_position := _body.global_position
	var current_orientation := _body.rotation.y

	position = current_position
	orientation = current_orientation

	if calculate_velocities:
		if _applied_steering:
			_applied_steering = false
		else:
			linear_velocity = _body.linear_velocity
			angular_velocity = _body.angular_velocity.y
