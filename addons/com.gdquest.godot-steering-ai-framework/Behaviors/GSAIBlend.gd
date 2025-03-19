# Blends multiple steering behaviors into one, and returns a weighted
# acceleration from their calculations.
#
# Stores the behaviors internally as dictionaries of the form
# {
# 	behavior : GSAISteeringBehavior,
# 	weight : float
# }
# @category - Combination behaviors
class_name GSAIBlend
extends GSAISteeringBehavior

var _behaviors: Array[Dictionary] = []
var _accel := GSAITargetAcceleration.new()


func _init(agent: GSAISteeringAgent) -> void:
	super._init(agent)


# Appends a behavior to the internal array along with its `weight`.
func add(behavior: GSAISteeringBehavior, weight: float) -> void:
	behavior.agent = agent
	_behaviors.append({behavior = behavior, weight = weight})


# Returns the behavior at the specified `index`, or an empty `Dictionary` if
# none was found.
func get_behavior_at(index: int) -> Dictionary:
	if index < _behaviors.size():
		return _behaviors[index]
	push_error("Tried to get index %d in array of size %d" % [index, _behaviors.size()])
	return {}


func _calculate_steering(blended_accel: GSAITargetAcceleration) -> void:
	blended_accel.set_zero()

	for bw in _behaviors:
		var behavior: GSAISteeringBehavior = bw["behavior"]
		var weight: float = bw["weight"]
		
		behavior.calculate_steering(_accel)
		blended_accel.add_scaled_accel(_accel, weight)

	blended_accel.linear = GSAIUtils.clampedv3(blended_accel.linear, agent.linear_acceleration_max)
	blended_accel.angular = clampf(
		blended_accel.angular,
		-agent.angular_acceleration_max,
		agent.angular_acceleration_max
	)
