extends Control


@export var Thingtopause : Node
var mainMenu = preload("res://Scenes/main_menu.tscn")

func _unhandled_input(event: InputEvent) -> void:
	
	if event.is_action_pressed("pause"):
		if Thingtopause.process_mode == 0:pause()
		
		elif  Thingtopause.process_mode == 4 :  Unpause()

			
		
func pause():
	Thingtopause.process_mode = Node.PROCESS_MODE_DISABLED
	show()
	
	
func Unpause():
	hide()
	Thingtopause.process_mode =Node.PROCESS_MODE_ALWAYS

func _on_texture_button_pressed() -> void:
	Unpause()


func _on_texture_button_2_pressed() -> void:
	#Unpause()
	get_tree().change_scene_to_packed(mainMenu)

