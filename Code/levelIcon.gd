extends Control


@export var Layer:CanvasLayer

@export var NameLevel: int
@export var transition: transitionNode
@export var Level: PackedScene
@export var flower: TextureButton

var PlayAble:int
var Stars:int
@export var levelicon: TextureRect 

@export var FlowersTextures: Array[Texture2D]
@export var Levelicon : Texture2D

var stars 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	flower.texture_normal = FlowersTextures[0]
	flower.texture_pressed = FlowersTextures[1]
	flower.texture_hover = FlowersTextures[2]
	flower.texture_disabled = FlowersTextures[3]
	flower.texture_focused = FlowersTextures[4]
	levelicon.texture = Levelicon

	
	
	
	SetToInvaild()


func _on_focus_entered() -> void:
	print_debug("enter fopcus")
	$StarButton.visible = true
	$StarButton.grab_focus()

func _on_focus_exited() -> void:
	#Layer.visible = false
	$StarButton.visible = false
	pass

func _on_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept") and  has_focus():
		Layer.visible = true



func _on_back_pressed() -> void:
	Layer.visible = false
	grab_focus()


func SetToInvaild():
	pass




func LoadLevel():
	#transition.transition_out()
	#await transition.transition_out_done
	get_tree().change_scene_to_packed(Level)



