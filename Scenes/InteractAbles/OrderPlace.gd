extends InterActAble

@export var marker_2d: Marker2D 
var CurrentCustomer : Customer

var IsEmpty :bool = true
var  SeatPosition :Vector2

var FoodNeeded : Repices
func  _ready() -> void:
	inter_act_area.body_entered.connect(PlayerEnteredArea)
	inter_act_area.body_exited.connect( PlayerExitedArea)
	SeatPosition = marker_2d.global_position
func InterAct():
	if !CurrentBody.CurrentItem: return
	if CurrentBody.CurrentItem.Name == FoodNeeded.Name:
		CurrentCustomer.MaxScore -= GradeFood()
		CurrentBody.DropItem()
		
		ReSetTable()
	
func _unhandled_input(event: InputEvent) -> void:
	if CurrentBody:
		if event.is_action_pressed("PlayerTwo_Interact"):
			InterAct()
func GradeFood():
	CurrentCustomer.LeaveStore()
	if CurrentBody.CurrentItem.IsSpicy == FoodNeeded.IsSpicy:
		return 0
	else : return -1
func ReSetTable():
	IsEmpty = true 
	FoodNeeded = null 
	CurrentCustomer = null
