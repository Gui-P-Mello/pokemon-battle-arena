# Calculates acceleration to take an agent away from where a target agent is
# moving.
# @category - Individual behaviors
class_name GSAIEvade
extends GSAIPursue


func _init(agent: GSAISteeringAgent, target: GSAISteeringAgent, predict_time_max: float = 1.0) -> void:
	super._init(agent, target, predict_time_max)


func _get_modified_acceleration() -> float:
	return -agent.linear_acceleration_max
