extends  InterActAble
class_name  Customer
@export var Sprites :Array[Texture2D]
@export var possibleReices: Array[Repices]
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var item_icon: Sprite2D = $"item icon"
@export var WaitTime :int
@onready var timer: Timer = $Timer


signal  GivePoints(points)
var WantReices : Repices
var Exit :Marker2D
var CurrentSeat

@export var MaxScore:int = 6
func  _ready() -> void:
	var rng = RandomNumberGenerator.new()
	var my_random_number = rng.randi_range(0, Sprites.size()-1)
	sprite_2d.texture = Sprites[my_random_number]
	timer.wait_time = WaitTime
	PickAnReice()
	FindEmptySeat()
	
	
func PickAnReice():
	var rng = RandomNumberGenerator.new()
	var my_random_number = rng.randi_range(0, possibleReices.size() - 1)
	var RngBool  = RandomNumberGenerator.new()
	var ISSpicy = false
	if rng.randi_range(0, 1): ISSpicy = true
	WantReices = possibleReices[my_random_number]
	WantReices.IsSpicy = ISSpicy
	if WantReices.IsSpicy: item_icon.texture  =WantReices.SpicyIcon
	else: item_icon.texture = WantReices.Icon
	
func FindEmptySeat():
	var Seats = get_tree().get_nodes_in_group("Seat")
	var NewSeat
	
	for Seat in Seats:
		if Seat.IsEmpty:
			NewSeat = Seat
			CurrentSeat = NewSeat
			Seat.IsEmpty = false
			Seat.CurrentCustomer = self
			break
	if !NewSeat:
		print_debug("no seat found")
		return
		
	var tween  = get_tree().create_tween()
	tween.tween_property(self, "global_position",NewSeat.SeatPosition , 3)
	await  tween.finished
	timer.start()
	print_debug("ready")
	NewSeat.FoodNeeded =  WantReices 
	
	
func LeaveStore():
	emit_signal("GivePoints", MaxScore)
	var tween  = get_tree().create_tween()
	tween.tween_property(self, "global_position",Exit.global_position , 3)
	await  tween.finished
	CurrentSeat.ReSetTable()
	queue_free()
	
func ScoreGoDown():
	MaxScore -= 1 
	if MaxScore <= 0:
		MaxScore =0
		LeaveStore()


func _on_timer_timeout() -> void:
	ScoreGoDown()
