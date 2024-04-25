extends Node2D

@export var transition: transitionNode

@export var FirstLevel: Control
var GameData :SavedData

func _ready() -> void:
	Load()
	transition.transition_in()
	FirstLevel.grab_focus()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func Load():
	GameData = 	GameSaver.LoadGameData()
	
func SetOverWorld():
	var levels= get_tree().get_nodes_in_group("level")
	for level in levels:
		pass
