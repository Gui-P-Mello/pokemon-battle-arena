extends Node3D
@export var pokemons: Array[Pokemon]
func _ready():
	LoadManager.load_for_pokemon(pokemons)
