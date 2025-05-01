class_name Move extends Resource
@export var move_name: String
@export var move_type: Type
@export var animation_name: String
@export var stamina_cost: float
@export var charge_time: float
var charge_elapsed_time: float
@export var is_damage_physical: bool
@export var base_damage: float
@export var on_execute_move_effects: Array[Effect] = []
@export var on_hit_effects: Array[Effect] = []
var context: BattleContext

func apply_move_effects(effects: Array[Effect] = []) -> void:
	for effect: Effect in effects:
		effect.apply(context)
