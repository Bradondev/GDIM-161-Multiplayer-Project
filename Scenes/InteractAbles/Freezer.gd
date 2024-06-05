extends InterActAble



@export var Type: ingredient
@export var icon_1: Sprite2D 
@export var label: Label 


@export var Amount : int = 1000

func _ready() -> void:
	inter_act_area.body_entered.connect(PlayerEnteredArea)
	inter_act_area.body_exited.connect( PlayerExitedArea)
	icon_1.texture =Type.Icon
func InterAct():
	if CurrentBody.CurrentItem == Type:
		CurrentBody.DropItem()
		AddAmount(1)
		return
		
	if !CurrentBody.CurrentItem and Amount >0:
		CurrentBody.PickUpItem(Type)
		AddAmount(-1)
		return
	
func _unhandled_input(event: InputEvent) -> void:
	if CurrentBody:
		if event.is_action_pressed("PlayerTwo_Interact"):
			InterAct()
			
func  AddAmount( AmountToAdd :int):
	return
	Amount += AmountToAdd
	UpdataAmount()
func UpdataAmount():
	return
	label.text = str(Amount)
