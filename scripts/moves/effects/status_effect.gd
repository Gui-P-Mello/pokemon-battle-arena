class_name StatusEffect extends Effect

enum EffectType {BUFF, DEBUFF, DOT, HEAL_OVER_TIME}

@export var effect_name: String
@export var type: EffectType
@export var duration: float
@export var stackable: bool
@export var max_stacks: int
@export var icon: Texture
var status_effect_elapsed_time: float = 0.0

func on_tick(target: Pokemon, delta: float)-> void:
	pass
