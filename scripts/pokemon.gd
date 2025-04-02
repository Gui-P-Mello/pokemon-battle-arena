class_name Pokemon extends CharacterBody3D

var _id: int
var _species: int
var _types: Array
var _stamina: float
var _muscular_power: float
var _special_power: float
var _character_body: CharacterBody3D
var _sprite3D: Sprite3D
var _scene_camera: Camera3D
var _current_animation_sprite_sheet: Texture
@export var anim_col = 0
var _steering_agent: GSAICharacterBody3DAgent
var arrive_behavior: GSAIArrive
@export var _target: Node3D
var _steering_target: GSAISteeringAgent
var arrive_blend: GSAIBlend
var priority: GSAIPriority

var angular_velocity:= 0.0
var angular_drag:= 1

var animated_sprite3D: AnimatedSprite3D
var animation: Animation
var animation_player: AnimationPlayer

func _ready():
	animated_sprite3D = $AnimatedSprite3D
	_character_body = self
	_sprite3D = $Sprite3D
	animation_player = $Sprite3D/AnimationPlayer
	_scene_camera = get_tree().get_first_node_in_group("scene_camera")
	_steering_agent = await  GSAICharacterBody3DAgent.new(_character_body)
	_steering_agent.linear_speed_max = 5.0
	_steering_agent.linear_acceleration_max = 2.0
	_steering_agent.angular_speed_max = deg_to_rad(180) #turn speed in degrees per second
	_steering_agent.angular_acceleration_max = deg_to_rad(620)
	_steering_agent.bounding_radius = 0.5
	_steering_agent.apply_linear_drag = 10
	
	_steering_target = GSAISteeringAgent.new()
	_steering_target.position = _target.position
	arrive_behavior = GSAIArrive.new(_steering_agent, _steering_target)
	
	var face = GSAIFace.new(_steering_agent, _steering_target, true)
	face.alignment_tolerance = deg_to_rad(3)
	face.deceleration_radius = deg_to_rad(15)
	
	priority = GSAIPriority.new(_steering_agent)
	
	arrive_blend = GSAIBlend.new(_steering_agent)
	arrive_blend.add(face, 1.0)
	arrive_blend.add(arrive_behavior, 1.0)
	
	priority.add(arrive_blend)

func _physics_process(delta):
	#print(self.rotation)
	if self.position.distance_to(_target.position) >= 2:
		animation_player.play("walk_anim")
		arrive_blend.is_enabled = true
		_steering_target.position = _target.position
		var acceleration = GSAITargetAcceleration.new()
		priority.calculate_steering(acceleration)
		#Makes sure the character won't leave the ground or go below it regardless what the target's position.y value is
		acceleration.linear.y = 0
		_steering_agent._apply_steering(acceleration, delta)
		
		# We then do something similar to apply our agent's rotational speed.
		angular_velocity = clamp(
			angular_velocity + acceleration.angular * delta, -_steering_agent.angular_speed_max, _steering_agent.angular_speed_max
		)
		# This applies drag on the agent's rotation, helping it slow down naturally.
		angular_velocity = lerp(angular_velocity, 0.0, angular_drag)
		rotation += Vector3(0, angular_velocity * delta, 0)
		print(angular_velocity)
	else:
		velocity = Vector3.ZERO
		animation_player.play("strike_anim")
		

func _process(delta):
	_render_perspective()
	
func _render_perspective()->void:
	if _scene_camera == null: 
		print("CAMERA IS NULL")
		return
		
	var c_forward = -_scene_camera.global_transform.basis.z
	var forward = _character_body.global_transform.basis.z
	var left = _character_body.global_transform.basis.x
	
	var f_dot = forward.dot(c_forward)
	var l_dot = left.dot(c_forward)
	var row = 0
	#_sprite3D.flip_h = false
	
	if f_dot < -0.85:
		row = 0 #front sprites row
	elif f_dot > 0.85:
		row = 4 #back sprites row
	else:
		if l_dot > 0:
			if abs(f_dot) < 0.3:
				row = 2 #right sprites row
			elif f_dot < 0:
				row = 1 #front right sprites row
			else:
				row = 3 #back right sprites row
		else:
			if abs(f_dot) < 0.3:
				row = 6 #left sprites row
			elif f_dot < 0:
				row = 7 #front left sprites row
			else:
				row = 5 # back left sprites row
	_sprite3D.frame = anim_col + row * _sprite3D.hframes
	
	#animation
	#animated_sprite3D.sprite_frames.get_frame_count("walk_anim")
	#animated_sprite3D.sprite_frames
	#animated_sprite3D.frame_changed
	#animated_sprite3D.frame_progress
	#animated_sprite3D
	#animated_sprite3D
	#_sprite3D.hframes
	#_sprite3D.vframes
