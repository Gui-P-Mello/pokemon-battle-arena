# Calculates an angular acceleration to match an agent's orientation to its
# direction of travel.
# @category - Individual behaviors
class_name GSAILookWhereYouGo
extends GSAIMatchOrientation


func _init(agent: GSAISteeringAgent, use_z: bool = false) -> void:
	super._init(agent, null, use_z)


func _calculate_steering(accel: GSAITargetAcceleration) -> void:
	if agent.linear_velocity.length_squared() < agent.zero_linear_speed_threshold:
		accel.set_zero()
	else:
		var orientation: float = (
			GSAIUtils.vector3_to_angle(agent.linear_velocity)
			if use_z
			else GSAIUtils.vector2_to_angle(GSAIUtils.to_vector2(agent.linear_velocity)))
		_match_orientation(accel, orientation)
