class_name Pokemon extends Node

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


func _ready():
	_character_body = $CharacterBody3D
	_sprite3D = $CharacterBody3D/Sprite3D
	_scene_camera = get_tree().get_first_node_in_group("scene_camera")

func _process(delta):
	_render_perspective()

#func _init(id: int, species:int, types: Array, stamina: float, muscular_power: float, special_power: float):
	#_id = id
	#_species = species
	#_types = types
	#_stamina = stamina
	#_muscular_power = muscular_power
	#_special_power = special_power
	
func _render_perspective()->void:
	if _scene_camera == null: 
		print("CAMERA IS NULL")
		return
		
	var c_forward = -_scene_camera.global_transform.basis.z
	var forward = _sprite3D.global_transform.basis.z
	var left = _sprite3D.global_transform.basis.x
	
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
	_sprite3D.frame = anim_col + row * 4
