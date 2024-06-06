extends TextureButton

class_name  LevelButton

@export var transition: transitionNode


@export var Level: PackedScene
var Leveldata :LevelData
@export var parent : Node
var fullStar: Texture2D = preload("res://art/Ui/level/star filled.png")

var PlayAble:int
var Stars:int

@onready var levellabel: TextureRect = $"../Level"
@onready var star_3: TextureRect = $"../star1"
@onready var judges: TextureRect = $"../judges"

@export var levelIconpng :Texture2D

var Isloading = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await parent.setupdone
	print_debug("ready")
	if !Leveldata.Unlocked:
		disabled = true
		texture_hover = texture_disabled
		texture_focused = texture_disabled
		texture_pressed = texture_disabled
	FixLabels(self)
func SetToInvaild():
	pass


func LoadLevel():
	if Isloading:return
	Isloading = true
	transition.transition_out()
	await transition.transition_out_done
	get_tree().change_scene_to_packed(Level)

	


func _on_start_focus_exited() -> void:
	$start.visible = false
	

func _on_start_2_focus_exited() -> void:
	$"../flower2/start2".visible = false

func _on_start3focus_exited() -> void:
	$"../flower3/start".visible = false


func _on_start4_focus_exited() -> void:
	$"../flower4/start".visible = false


func _on_focusflower_entered() -> void:
	$start.visible = true
	FixLabels($".")



func _on_flower_2_focus_entered() -> void:
	$"../flower2/start2".visible = true
	FixLabels($"../flower2")


func _on_flower_3_focus_entered() -> void:
	$"../flower3/start".visible = true
	FixLabels($"../flower3")


func _on_flower_4_focus_entered() -> void:
	$"../flower4/start".visible = true
	FixLabels($"../flower4")


func _on_flower_4_focus_exited() -> void:
	$"../flower4/start".visible = false


func _on_flower_3_focus_exited() -> void:
	$"../flower3/start".visible = false


func _on_flower_2_focus_exited() -> void:
	$"../flower2/start2".visible = false


func _on_focusflowqer_exited() -> void:
	$start.visible = false


func _on_pressed() -> void:
	LoadLevel()
func FixLabels(Data):
	print_debug(Data)
	Data.Leveldata.stars
	print_debug("load")
	levellabel.texture =  Data.levelIconpng
	var temp = 0
	
	var star = get_tree().get_nodes_in_group("star")
	for x in star :
		star[temp].texture = load("res://art/Ui/level/star grayed out.png")
		temp +=1
	temp = 0
	
	for x in Data.Leveldata.stars:
		star[temp].texture = fullStar
		temp +=1



