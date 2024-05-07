extends InterActAble



@export var Type: ingredient
@export var icon_1: Sprite2D 



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
		return
	
	
	
func _unhandled_input(event: InputEvent) -> void:
	if CurrentBody:
		if event.is_action_pressed("PlayerTwo_Interact"):
			InterAct()
