extends PickUpable
class_name ingredient




@export_enum("Meat", "Vegen", "Vegetarian") var Diet: String
@export_enum("Not Spicy", "Spicy") var IsSpice:int
@export_enum("Cold","Hot") var IsHot: int

@export var IsPrepped :bool = false

@export var CanBePreped :bool = false
@export var PrepedIcon : Texture2D
