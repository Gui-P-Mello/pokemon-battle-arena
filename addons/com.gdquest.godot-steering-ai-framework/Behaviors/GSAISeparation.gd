# Calculates an acceleration that repels the agent from its neighbors in the
# given `GSAIProximity`.
#
# The acceleration is an average based on all neighbors, multiplied by a
# strength decreasing by the inverse square law in relation to distance, and it
# accumulates.
# @category - Group behaviors
class_name GSAISeparation
extends GSAIGroupBehavior

# The coefficient to calculate how fast the separation strength decays with distance.
var decay_coefficient: float = 1.0

var _acceleration: GSAITargetAcceleration


func _init(agent: GSAISteeringAgent, proximity: GSAIProximity) -> void:
	super._init(agent, proximity)


func _calculate_steering(acceleration: GSAITargetAcceleration) -> void:
	acceleration.set_zero()
	_acceleration = acceleration
	proximity._find_neighbors(_report_neighbor)


# Callback for the proximity to call when finding neighbors. Determines the amount of
# acceleration that `neighbor` imposes based on its distance from the owner agent.
# @tags - virtual
func _report_neighbor(neighbor: GSAISteeringAgent) -> bool:
	var to_agent := agent.position - neighbor.position
	var distance_squared := to_agent.length_squared()
	
	if distance_squared == 0.0:
		return true  # Skip calculation for zero distance
	
	var acceleration_max := agent.linear_acceleration_max
	var strength := decay_coefficient / distance_squared
	strength = minf(strength, acceleration_max)
	
	_acceleration.linear += to_agent.normalized() * strength
	return true
