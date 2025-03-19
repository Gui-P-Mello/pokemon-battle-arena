# Container for multiple behaviors that returns the result of the first child
# behavior with non-zero acceleration.
# @category - Combination behaviors
class_name GSAIPriority
extends GSAISteeringBehavior

var _behaviors: Array[GSAISteeringBehavior] = []

# The index of the last behavior the container prioritized.
var last_selected_index: int
# If a behavior's acceleration is lower than this threshold, the container
# considers it has an acceleration of zero.
var zero_threshold: float


func _init(agent: GSAISteeringAgent, _zero_threshold: float = 0.001) -> void:
	super._init(agent)
	zero_threshold = _zero_threshold


# Appends a steering behavior as a child of this container.
func add(behavior: GSAISteeringBehavior) -> void:
	_behaviors.append(behavior)


# Returns the behavior at the position in the pool referred to by `index`, or
# `null` if no behavior was found.
func get_behavior_at(index: int) -> GSAISteeringBehavior:
	if index < _behaviors.size():
		return _behaviors[index]
	push_error("Tried to get index %d in array of size %d" % [index, _behaviors.size()])
	return null


func _calculate_steering(accel: GSAITargetAcceleration) -> void:
	var threshold_squared := zero_threshold * zero_threshold
	last_selected_index = -1

	if _behaviors.is_empty():
		accel.set_zero()
		return

	for i in _behaviors.size():
		last_selected_index = i
		var behavior := _behaviors[i]
		behavior.calculate_steering(accel)
		
		if accel.get_magnitude_squared() > threshold_squared:
			break
