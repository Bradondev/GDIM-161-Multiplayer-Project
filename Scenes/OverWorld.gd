extends Node2D

@export var transition: transitionNode
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	print_debug("ad")
	transition.transition_in()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
