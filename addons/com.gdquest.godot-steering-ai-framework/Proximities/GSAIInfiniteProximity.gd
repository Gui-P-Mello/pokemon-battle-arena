# Determines any agent that is in the specified list as being neighbors with the
# owner agent, regardless of distance.
# @category - Proximities
extends GSAIProximity
class_name GSAIInfiniteProximity


func _init(agent: GSAISteeringAgent, agents: Array) -> void:
	super._init(agent, agents)


# Returns a number of neighbors based on a `callback` function.
#
# `_find_neighbors` calls `callback` for each agent in the `agents` array and
# adds one to the count if its `callback` returns true.
# @tags - virtual
func _find_neighbors(callback: Callable) -> int:
	var neighbor_count := 0
	
	for current_agent in agents:
		if current_agent != agent && current_agent is GSAISteeringAgent:
			if callback.call(current_agent):
				neighbor_count += 1
	
	return neighbor_count
