extends Control

@export var StarbackLevel : Label
@export var Layer:CanvasLayer
@export var backbutton: Button 

@export var NameLevel:String

@export var transition: transitionNode
@export var Level: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$RichTextLabel.text = "[center]" + NameLevel
	$CanvasLayer/RichTextLabel.text =  "[center]" +NameLevel
func _on_focus_entered() -> void:
	print_debug(name)
	#Layer.visible = true


func _on_focus_exited() -> void:
	#Layer.visible = false
	pass

func _on_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept") and  has_focus():
		Layer.visible = true
		backbutton.grab_focus()


func _on_back_pressed() -> void:
	Layer.visible = false
	grab_focus()

func LoadLevel():
	transition.transition_out()
	await transition.transition_out_done
	
	get_tree().change_scene_to_packed(Level)



