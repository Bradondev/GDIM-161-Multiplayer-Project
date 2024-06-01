extends InterActAble



@export var Type: ingredient
@export var icon_1: Sprite2D 
@export var label: Label 


var Amount : int 

func _ready() -> void:
	
	icon_1.texture =Type.Icon
	inter_act_area.body_entered.connect(PlayerEnteredArea)
	inter_act_area.body_exited.connect( PlayerExitedArea)
	
func InterAct():
	if CurrentBody.CurrentItem == Type:
		CurrentBody.DropItem()
		return
		
	if !CurrentBody.CurrentItem:
		CurrentBody.PickUpItem(Type)
	#	AddAmount(-1)
		return
	
func _unhandled_input(event: InputEvent) -> void:
	if CurrentBody:
		if event.is_action_pressed("PlayerTwo_Interact"):
			InterAct()
			
func  AddAmount( AmountToAdd :int):
	Amount += AmountToAdd
	UpdataAmount()
func UpdataAmount():
	label.text = str(Amount)
