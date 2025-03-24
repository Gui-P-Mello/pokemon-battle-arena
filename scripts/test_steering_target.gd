extends CharacterBody3D

var _steering_agent: GSAISteeringAgent

func _ready():
	_steering_agent = await GSAICharacterBody3DAgent.new(self)
