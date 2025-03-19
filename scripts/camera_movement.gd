extends Camera3D

@export var move_speed: float = 3.0
@export var mouse_sensitivity: float = 0.1
@export var boost_multiplier: float = 2.0

var _mouse_captured: bool = true

func _ready() -> void:
	capture_mouse()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and _mouse_captured:
		handle_rotation(event)
	
	if event.is_action_pressed("toggle_mouse_capture"):
		toggle_mouse_capture()

func _process(delta: float) -> void:
	handle_movement(delta)

func capture_mouse() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	_mouse_captured = true

func release_mouse() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	_mouse_captured = false

func toggle_mouse_capture() -> void:
	if _mouse_captured:
		release_mouse()
	else:
		capture_mouse()

func handle_rotation(event: InputEventMouseMotion) -> void:
	# Rotação horizontal (eixo Y)
	self.rotation_degrees.y -= event.relative.x * mouse_sensitivity
	
	# Rotação vertical (eixo X) com clamp
	self.rotation_degrees.x -= event.relative.y * mouse_sensitivity
	self.rotation_degrees.x = clamp(self.rotation_degrees.x, -90.0, 90.0)

func handle_movement(delta: float) -> void:
	var input_dir = Vector3.ZERO
	
	# Movimentação WASD
	input_dir.x = Input.get_axis("camera_move_left", "camera_move_right")
	input_dir.z = Input.get_axis("camera_move_back", "camera_move_forward")
	
	# Movimentação vertical (Q/E)
	input_dir.y = Input.get_axis("move_up", "move_down")
	
	# Normaliza o vetor de direção
	if input_dir.length() > 1:
		input_dir = input_dir.normalized()
	
	# Calcula velocidade
	var speed = move_speed
	if Input.is_action_pressed("boost"):
		speed *= boost_multiplier
	
	# Obtém os vetores de direção da câmera
	var forward = -global_transform.basis.z.normalized()
	var right = global_transform.basis.x.normalized()
	var up = global_transform.basis.y.normalized()
	
	# Aplica movimento relativo à direção da câmera
	var movement = (
		forward * input_dir.z +
		right * input_dir.x +
		up * input_dir.y
	) * speed * delta
	
	global_translate(movement)
