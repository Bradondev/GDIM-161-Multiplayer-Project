extends CharacterBody2D
class_name  Player
var speed = 400 


@export_enum("PlayerOne","PlayerTwo") var PlayerType: String
@export var HoldItemSprite: Sprite2D
@export var CurrentItem :PickUpable


func _ready() -> void:
	if CurrentItem:
		PickUpItem(CurrentItem)

func _physics_process(delta):
	var direction = Input.get_vector(PlayerType+"_Left", PlayerType+"_Right", PlayerType+"_Up", PlayerType+"_Down")
	velocity = direction * speed

	move_and_slide()
	
func PickUpItem(NewItem : PickUpable):
	CurrentItem = NewItem
	HoldItemSprite.texture = CurrentItem.Icon
func DropItem():
	HoldItemSprite.texture = null
	CurrentItem = null
