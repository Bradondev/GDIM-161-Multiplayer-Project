extends Node2D
class_name  Levelbase
@export var Transition: transitionNode

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Transition.transition_in()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
