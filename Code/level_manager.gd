extends Node2D

@export var time :int
@export var LevelTimer: Timer
@export var label: Label 
@export var CustomerScene :PackedScene
@export var CriticScene :PackedScene
@export var possibleReices: Array[Repices]

@onready var label_2: Label = $Label2

@export var SpawnArea : Marker2D
@export var ExitArea : Marker2D
var Score : int = 0


var NumberOfCustomer = 0
func Startlevel():
	LevelTimer.start()

func _ready() -> void:
	LevelTimer.wait_time = time
	
	Startlevel()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	label.text = str(roundf(LevelTimer.time_left))
	label_2.text = "Score:" + str(Score)
func  AddToScore(amount:int):
	Score += amount
	
func SpawnCustomer():
	var NewCustomer = CustomerScene.instantiate()
	NewCustomer.GivePoints.connect( AddToScore)
	NewCustomer.possibleReices = possibleReices
	add_child(NewCustomer)
	NewCustomer.global_position = SpawnArea.global_position
	NewCustomer.Exit =  ExitArea

func SpawnCritic():
	var NewCritic = CriticScene.instantiate()
	NewCritic.GivePoints.connect( AddToScore)
	NewCritic.possibleReices = possibleReices
	add_child(NewCritic)
	NewCritic.global_position = SpawnArea.global_position
	NewCritic.Exit =  ExitArea

func _on_timer_2_timeout() -> void:
	var Seats = get_tree().get_nodes_in_group("Seat")
	var NewSeat
	
	for Seat in Seats:
		if Seat.IsEmpty:
			if NumberOfCustomer >= 3:
				SpawnCritic()
				NumberOfCustomer = 0
			
			NumberOfCustomer += 1
			SpawnCustomer()
			break

