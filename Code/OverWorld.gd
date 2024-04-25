extends Node2D

@export var transition: transitionNode
signal  setupdone
@export var FirstLevel: Control
var GameData :SavedData

func _ready() -> void:
	
	Load()
	SetOverWorld()
	transition.transition_in()
	FirstLevel.grab_focus()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func Load():
	GameData = 	GameSaver.LoadGameData()
	
func SetOverWorld():
	var temp = 0
	var levels= get_tree().get_nodes_in_group("level")
	for level in levels:
		level.Leveldata = GameData.Leveldata[temp]
		temp +=1 
	emit_signal("setupdone")
	

