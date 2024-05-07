extends Node2D
class_name InterActAble

@export var inter_act_area: Area2D 
var CanInterAct :bool = false
var CurrentBody: Player

func _ready() -> void:
	inter_act_area.body_entered.connect(PlayerEnteredArea)
	inter_act_area.body_exited.connect( PlayerExitedArea)
	
func OninterAct():
	pass
func _physics_process(delta: float) -> void:
		pass
		

func PlayerEnteredArea(body):
	CanInterAct = true
	print_debug(body)
	CurrentBody = body
	
func PlayerExitedArea(body):
	CanInterAct = false
	CurrentBody = null

func InterAct():
	pass
